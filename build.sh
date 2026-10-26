#!/bin/bash
# Build FixNotif.app from source (macOS, needs Xcode Command Line Tools).
set -euo pipefail
cd "$(dirname "$0")"
mkdir -p FixNotif.app/Contents/MacOS
swiftc -o FixNotif.app/Contents/MacOS/FixNotif FixNotif.swift
cp Info.plist FixNotif.app/Contents/Info.plist
echo "Built FixNotif.app — open it or move it to /Applications."
