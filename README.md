# FixNotif

A tiny macOS menu bar app. When notifications stop working, click the bell
in the menu bar, hit **Fix Notifications**, and it restarts NotificationCenter
for you — no Terminal needed. The bell turns into a checkmark for 3 seconds
to confirm the fix ran.

## Install

1. Download `FixNotif.zip` from the latest release.
2. Unzip it and move `FixNotif.app` to `/Applications`.
3. Open it. The first time, macOS may block it because the app is not signed
   with a Developer ID: right-click `FixNotif.app` and choose **Open**.

The app lives only in the menu bar (no Dock icon). Click the bell any time
notifications misbehave, or choose **Quit** from its menu to stop it.

## Build from source

Needs only the Xcode Command Line Tools:

```bash
./build.sh
```

This produces `FixNotif.app` in the same folder.
