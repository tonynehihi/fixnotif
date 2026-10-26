import AppKit

final class AppDelegate: NSObject, NSApplicationDelegate {
    private var statusItem: NSStatusItem?

    private func symbol(_ name: String) -> NSImage? {
        let image = NSImage(systemSymbolName: name, accessibilityDescription: nil)
        image?.isTemplate = true
        return image
    }

    func applicationDidFinishLaunching(_ notification: Notification) {
        let item = NSStatusBar.system.statusItem(withLength: NSStatusItem.squareLength)
        item.button?.image = symbol("bell")
        item.button?.toolTip = "Sửa thông báo"

        let menu = NSMenu()

        let fix = NSMenuItem(title: "Sửa thông báo", action: #selector(fixNotifications), keyEquivalent: "")
        fix.target = self
        menu.addItem(fix)

        menu.addItem(.separator())

        let quit = NSMenuItem(title: "Thoát", action: #selector(NSApplication.terminate(_:)), keyEquivalent: "q")
        quit.target = NSApplication.shared
        menu.addItem(quit)

        item.menu = menu
        statusItem = item
    }

    @objc private func fixNotifications() {
        let task = Process()
        task.executableURL = URL(fileURLWithPath: "/usr/bin/killall")
        task.arguments = ["NotificationCenter"]
        try? task.run()
        task.waitUntilExit()

        // Feedback: tick 3 giây rồi về lại chuông.
        statusItem?.button?.image = symbol("checkmark")
        DispatchQueue.main.asyncAfter(deadline: .now() + 3) { [weak self] in
            self?.statusItem?.button?.image = self?.symbol("bell")
        }
    }
}

let delegate = AppDelegate()
let app = NSApplication.shared
app.delegate = delegate
app.run()
