# FixNotif

App nhỏ nằm trên thanh menu macOS, để sửa nhanh mỗi khi thông báo dở chứng
mà không cần mở Terminal.

## Chức năng

Bấm vào icon chuông trên thanh menu rồi chọn **Sửa thông báo**: app chạy
`killall NotificationCenter` để khởi động lại dịch vụ thông báo của macOS.
Xong việc icon đổi thành dấu tick trong 3 giây để báo đã sửa xong. Chọn
**Thoát** trong menu để tắt app.

Dùng khi: thông báo không hiện, banner không nhảy, hoặc NotificationCenter
đơ sau một thời gian chạy máy.

## Cài đặt

1. Tải `FixNotif.zip` từ mục Releases.
2. Giải nén rồi chuyển `FixNotif.app` vào `/Applications`.
3. Mở app lên dùng.

## Không mở được thì làm sao

App chưa ký Developer ID và chưa notarize, nên file tải về qua trình duyệt
bị macOS gắn cờ quarantine. Lúc mở, macOS sẽ báo **"FixNotif is damaged
and can't be opened"** — file không hề hỏng, đây chỉ là Gatekeeper chặn app
không ký. Trường hợp báo "damaged" này **không có nút Open Anyway** trong
Settings (nút đó chỉ hiện với dạng chặn "unidentified developer"), nên đừng
mất công tìm.

Cách sửa: thoát app nếu nó đang chạy, rồi chạy 1 lệnh này trong Terminal:

```bash
xattr -dr com.apple.quarantine /Applications/FixNotif.app && open /Applications/FixNotif.app
```

Lệnh trên gỡ cờ quarantine rồi mở app lại là chạy bình thường.

## Lưu ý

- App vẫn hiện icon trên Dock dù đã bật chế độ chỉ hiện menu bar — chỉ xấu
  thôi, chức năng trên thanh menu vẫn đủ.
- App chưa tự chạy khi mở máy; muốn thì tự thêm vào Login Items trong
  Settings sau.

## Build từ source

Chỉ cần Xcode Command Line Tools:

```bash
./build.sh
```

Lệnh này tạo ra `FixNotif.app` trong cùng thư mục.
