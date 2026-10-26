#!/bin/bash
# Build FixNotif.app from source (macOS, needs Xcode Command Line Tools).
set -euo pipefail
cd "$(dirname "$0")"
mkdir -p FixNotif.app/Contents/MacOS FixNotif.app/Contents/Resources
swiftc -o FixNotif.app/Contents/MacOS/FixNotif FixNotif.swift
cp Info.plist FixNotif.app/Contents/Info.plist
cp AppIcon.icns FixNotif.app/Contents/Resources/AppIcon.icns
echo "Built FixNotif.app — open it or move it to /Applications."
