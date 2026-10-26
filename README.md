# FixNotif

A small app that lives on the macOS menu bar, for a quick fix whenever
notifications misbehave, without opening Terminal.

## Features

Click the bell icon on the menu bar and choose **Fix notification**: the app
runs `killall NotificationCenter` to restart macOS's notification service.
When done, the icon changes to a tick for 3 seconds to report that the fix
is complete. Choose **Quit** in the menu to close the app.

Use it when: notifications do not appear, banners do not pop up, or
NotificationCenter freezes after the machine has been running for a while.

## Install

1. Download `FixNotif.zip` from Releases.
2. Unzip it, then move `FixNotif.app` to `/Applications`.
3. Open the app and use it.

## If it will not open

The app is not signed with a Developer ID and is not notarized, so a file
downloaded through a browser gets a quarantine flag from macOS. On opening,
macOS reports **"FixNotif is damaged and can't be opened"** — the file is
not damaged at all, this is just Gatekeeper blocking an unsigned app. In
this "damaged" case there is **no Open Anyway button** in Settings (that
button only appears for "unidentified developer" blocks), so do not waste
time looking for it.

To fix it: quit the app if it is running, then run this one command in
Terminal:

```bash
xattr -dr com.apple.quarantine /Applications/FixNotif.app && open /Applications/FixNotif.app
```

The command above removes the quarantine flag and reopens the app, and it
then runs normally.

## Notes

- The app still shows a Dock icon even though menu-bar-only mode is
  enabled — that is cosmetic only, the menu-bar functionality is complete.
- The app does not start automatically at login; if you want that, add it
  to Login Items in Settings yourself.

## Build from source

You only need Xcode Command Line Tools:

```bash
./build.sh
```

This command creates `FixNotif.app` in the same directory.
