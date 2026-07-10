#!/usr/bin/env python3
"""Create and publish a tagged Flutter release."""

from __future__ import annotations

import argparse
import re
import subprocess
import sys
from pathlib import Path


ROOT = Path(__file__).resolve().parents[1]
PUBSPEC = ROOT / "pubspec.yaml"
VERSION_PATTERN = re.compile(
    r"^(0|[1-9]\d*)\.(0|[1-9]\d*)\.(0|[1-9]\d*)"
    r"(?:-[0-9A-Za-z-]+(?:\.[0-9A-Za-z-]+)*)?"
    r"(?:\+[0-9A-Za-z-]+(?:\.[0-9A-Za-z-]+)*)?$"
)
PUBSPEC_VERSION_PATTERN = re.compile(r"(?m)^version:\s*([^\s#]+)(\s*(?:#.*)?)$")


def run(*command: str, capture_output: bool = False) -> str:
    """Run a command in the repository and return stdout when requested."""
    result = subprocess.run(
        command,
        cwd=ROOT,
        check=True,
        text=True,
        stdout=subprocess.PIPE if capture_output else None,
    )
    return result.stdout.strip() if capture_output else ""


def fail(message: str) -> None:
    print(f"error: {message}", file=sys.stderr)
    raise SystemExit(1)


def current_branch() -> str:
    branch = run("git", "branch", "--show-current", capture_output=True)
    if not branch:
        fail("HEAD is detached; check out the branch you want to release first")
    return branch


def ensure_clean_worktree() -> None:
    if run("git", "status", "--porcelain", capture_output=True):
        fail("working tree is not clean; commit or stash changes before releasing")


def read_current_version() -> str:
    match = PUBSPEC_VERSION_PATTERN.search(PUBSPEC.read_text())
    if not match:
        fail(f"could not find a version field in {PUBSPEC}")
    return match.group(1)


def increment_version(version: str, increment: str) -> str:
    """Return the next semantic version for the requested release increment."""
    if not VERSION_PATTERN.fullmatch(version):
        fail(f"current pubspec version {version!r} is not a valid semantic version")

    core_version = version.split("-", maxsplit=1)[0].split("+", maxsplit=1)[0]
    major, minor, patch = (int(part) for part in core_version.split("."))
    if increment == "major":
        return f"{major + 1}.0.0"
    if increment == "minor":
        return f"{major}.{minor + 1}.0"
    if increment == "patch":
        return f"{major}.{minor}.{patch + 1}"
    raise ValueError(f"unsupported increment: {increment}")


def increment_summary(increment: str, current: str, version: str) -> str:
    details = {
        "patch": "increments the patch number",
        "minor": "increments the minor number and resets patch to 0",
        "major": "increments the major number and resets minor and patch to 0",
    }
    return f"{increment}: {current} → {version} ({details[increment]})"


def choose_increment_interactively(current_version: str) -> str:
    choices = ("patch", "minor", "major")
    print(f"Current version: {current_version}")
    print("Choose the release increment:")
    summaries = [
        increment_summary(increment, current_version, increment_version(current_version, increment))
        for increment in choices
    ]

    if sys.stdin.isatty() and sys.stdout.isatty():
        try:
            import termios
            import tty
        except ImportError:
            pass
        else:
            return choose_increment_with_arrows(choices, summaries, termios, tty)

    for summary in summaries:
        print(f"  {summary}")

    while True:
        try:
            choice = input("Increment [patch/minor/major] (default: patch): ").strip().lower()
        except EOFError:
            fail("no interactive input; specify a version or --patch, --minor, or --major")
        choice = choice or "patch"
        if choice in choices:
            return choice
        print("Please enter patch, minor, or major.", file=sys.stderr)


def choose_increment_with_arrows(
    choices: tuple[str, ...], summaries: list[str], termios: object, tty: object
) -> str:
    """Select a release increment with arrow keys in an ANSI-capable terminal."""
    selected = 0
    stdin = sys.stdin
    stdout = sys.stdout
    file_descriptor = stdin.fileno()
    previous_terminal_settings = termios.tcgetattr(file_descriptor)

    def render() -> None:
        for index, summary in enumerate(summaries):
            marker = "❯" if index == selected else " "
            stdout.write(f"\r\033[2K{marker} {summary}\n")
        stdout.flush()

    print("Use ↑/↓ to choose, then Enter to continue.")
    stdout.write("\033[?25l")
    render()
    try:
        tty.setraw(file_descriptor)
        while True:
            key = stdin.read(1)
            if key in ("\r", "\n"):
                return choices[selected]
            if key == "\x03":
                raise KeyboardInterrupt
            if key != "\x1b":
                continue
            if stdin.read(1) != "[":
                continue
            direction = stdin.read(1)
            if direction == "A":
                selected = (selected - 1) % len(choices)
            elif direction == "B":
                selected = (selected + 1) % len(choices)
            else:
                continue
            stdout.write(f"\033[{len(choices)}F")
            render()
    finally:
        termios.tcsetattr(file_descriptor, termios.TCSADRAIN, previous_terminal_settings)
        stdout.write("\033[?25h\n")
        stdout.flush()


def set_version(version: str) -> None:
    source = PUBSPEC.read_text()
    updated, replacements = PUBSPEC_VERSION_PATTERN.subn(
        lambda match: f"version: {version}{match.group(2)}", source, count=1
    )
    if replacements != 1:
        fail(f"could not update the version field in {PUBSPEC}")
    PUBSPEC.write_text(updated)


def ensure_remote_tag_is_available(remote: str, tag: str) -> None:
    result = subprocess.run(
        ("git", "ls-remote", "--exit-code", "--tags", remote, f"refs/tags/{tag}"),
        cwd=ROOT,
        text=True,
        stdout=subprocess.DEVNULL,
    )
    if result.returncode == 0:
        fail(f"tag {tag} already exists on {remote}")
    if result.returncode != 2:
        fail(f"could not check whether tag {tag} exists on {remote}")


def main() -> None:
    parser = argparse.ArgumentParser(
        description="Update pubspec.yaml, commit it, and push a release tag."
    )
    parser.add_argument(
        "version",
        nargs="?",
        help="Flutter version in pubspec format, for example 1.2.3 or 1.2.3+4",
    )
    increments = parser.add_mutually_exclusive_group()
    increments.add_argument(
        "--patch", dest="increment", action="store_const", const="patch",
        help="Increment the patch version",
    )
    increments.add_argument(
        "--minor", dest="increment", action="store_const", const="minor",
        help="Increment the minor version and reset patch to 0",
    )
    increments.add_argument(
        "--major", dest="increment", action="store_const", const="major",
        help="Increment the major version and reset minor and patch to 0",
    )
    parser.add_argument(
        "--remote", default="origin", help="Git remote to push to (default: origin)"
    )
    parser.add_argument(
        "--dry-run", action="store_true", help="Validate without changing Git or files"
    )
    args = parser.parse_args()

    if args.version is not None and args.increment is not None:
        parser.error("version cannot be used with --patch, --minor, or --major")

    branch = current_branch()
    ensure_clean_worktree()
    current_version = read_current_version()
    if args.version is not None:
        version = args.version.removeprefix("v")
        if not VERSION_PATTERN.fullmatch(version):
            fail(
                "version must be MAJOR.MINOR.PATCH, optionally with prerelease or +BUILD"
            )
    else:
        increment = args.increment or choose_increment_interactively(current_version)
        version = increment_version(current_version, increment)
    if version == current_version:
        fail(f"pubspec.yaml already has version {version}")

    tag = f"v{version}"
    if run("git", "tag", "--list", tag, capture_output=True):
        fail(f"tag {tag} already exists locally")

    if args.dry_run:
        print(
            f"Would change {current_version} to {version}, commit on {branch}, "
            f"and push {branch} and {tag} to {args.remote}."
        )
        return

    ensure_remote_tag_is_available(args.remote, tag)
    set_version(version)
    run("git", "add", "pubspec.yaml")
    run("git", "commit", "-m", f"release: {tag}")

    try:
        run("git", "push", args.remote, branch)
    except subprocess.CalledProcessError:
        fail(
            f"could not push {branch}; the local release commit remains available for retry"
        )

    run("git", "tag", "-a", tag, "-m", f"Release {tag}")
    try:
        run("git", "push", args.remote, tag)
    except subprocess.CalledProcessError:
        fail(
            f"could not push {tag}; it was created locally and can be pushed with: "
            f"git push {args.remote} {tag}"
        )

    print(f"Released {tag}: pushed {branch} and tag to {args.remote}.")


if __name__ == "__main__":
    main()
