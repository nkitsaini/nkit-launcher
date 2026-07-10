# From https://github.com/babariviere/flutter-nix-hello-world/blob/master/flake.nix
# And https://github.com/MikiVanousek/flutter-nix-hello-world/blob/fix/nix/android.nix
{
  description = "An example project using flutter";

  inputs.nixpkgs.url = "github:NixOS/nixpkgs/nixos-unstable";
  inputs.flake-utils.url = "github:numtide/flake-utils";
  inputs.flake-compat = {
    url = "github:edolstra/flake-compat";
    flake = false;
  };

  outputs = { self, nixpkgs, flake-utils, ... }:
    flake-utils.lib.eachDefaultSystem (system:
      let
        pkgs = import nixpkgs {
          inherit system;
          config.allowUnfree = true;
          config.android_sdk.accept_license = true;
        };
        buildToolsVersionForAapt2 = "35.0.1";
      in {
        devShells.default = let
          android = pkgs.androidenv.composeAndroidPackages {
            toolsVersion = "26.1.1";
            platformToolsVersion = "37.0.0";
            buildToolsVersions = [ buildToolsVersionForAapt2 "35.0.0" "34.0.0" "30.0.3" ];
            # buildToolsVersions = [ "30.0.3" ];
            includeEmulator = true;
            emulatorVersion = "37.1.4";
            platformVersions = [ "28" "29" "30" "31" "32" "33" "34" "35" "36" ];
            includeSources = false;
            includeSystemImages = false;
            systemImageTypes = [ "google_apis_playstore" ];
            abiVersions = [ "armeabi-v7a" "arm64-v8a" ];
            cmakeVersions = [ "3.22.1" ];
            includeNDK = true;
            ndkVersions = [ "29.0.14206865" ];
            useGoogleAPIs = false;
            useGoogleTVAddOns = false;
          };
        in pkgs.mkShell {
          buildInputs = with pkgs; [
            # from pkgs
            flutter
            jdk17
            #from ./nix/*
            android.platform-tools
          ];

          ANDROID_HOME = "${android.androidsdk}/libexec/android-sdk";
          GRADLE_OPTS = "-Dorg.gradle.project.android.aapt2FromMavenOverride=${android.androidsdk}/libexec/android-sdk/build-tools/${buildToolsVersionForAapt2}/aapt2";
          JAVA_HOME = pkgs.jdk17;
          ANDROID_AVD_HOME = (toString ./.) + "/.android/avd";
        };
      });
}
