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
        help="Flutter version in pubspec format, for example 1.2.3 or 1.2.3+4",
    )
    parser.add_argument(
        "--remote", default="origin", help="Git remote to push to (default: origin)"
    )
    parser.add_argument(
        "--dry-run", action="store_true", help="Validate without changing Git or files"
    )
    args = parser.parse_args()

    version = args.version.removeprefix("v")
    if not VERSION_PATTERN.fullmatch(version):
        fail("version must be MAJOR.MINOR.PATCH, optionally with prerelease or +BUILD")

    branch = current_branch()
    ensure_clean_worktree()
    current_version = read_current_version()
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
