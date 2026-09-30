# 🛠️ Setup Guide & Troubleshooting

Tài liệu này cung cấp hướng dẫn thiết lập môi trường từ con số 0 trên máy mới và cẩm nang xử lý các lỗi thường gặp trong quá trình vận hành.

---

## 1. 📋 Yêu cầu tiên quyết (Prerequisites)

Để toàn bộ tính năng (LSP, DAP Debugger, Treesitter, Linter, Formatter) hoạt động trơn tru:

### A. Công cụ cốt lõi
* **Neovim** >= 0.10.0 (Tải từ [Neovim Releases](https://github.com/neovim/neovim/releases)).
* **Git**: Quản lý phiên bản và tải plugin.
* **Curl** & **Unzip / Tar**: Hỗ trợ Mason tự động giải nén các gói Language Server.
* **Ripgrep (`rg`)** & **`fd`**: Tăng tốc độ tìm kiếm văn bản và file trong Telescope.
  * Windows (via Winget): `winget install BurntSushi.ripgrep.MSVC sharkdp.fd`

### B. Môi trường ngôn ngữ (Runtimes & Compilers)
* **C / C++**: MinGW-w64 (GCC / G++) hoặc Clang trong biến môi trường `PATH`. (Cần thiết để compile Treesitter parsers và debug C++).
* **Node.js** >= 18 & **npm**: Bắt buộc để chạy `ts_ls`, `prettier`, `tsx` và server `js-debug`.
* **Java SDK** >= 17: Cần thiết để khởi chạy Eclipse JDTLS và các ứng dụng Spring Boot.
* **Go** (tùy chọn): Nếu làm việc với các project Go và `gopls`.

---

## 2. 💻 Hướng dẫn Cài đặt trên máy mới

### Bước 1: Clone cấu hình vào thư mục chuẩn của Neovim
* **Trên Windows (PowerShell):**
  ```powershell
  git clone https://github.com/Khoi1308/nvim.git $env:LOCALAPPDATA\nvim
  ```
* **Trên Linux / macOS:**
  ```bash
  git clone https://github.com/Khoi1308/nvim.git ~/.config/nvim
  ```

### Bước 2: Tải các gói phụ thuộc tự động
1. Mở Neovim:
   ```bash
   nvim
   ```
2. Lazy.nvim sẽ tự động clone và nạp các plugin.
3. Chờ Mason tự động tải các LSP và adapter (`clangd`, `codelldb`, `ts_ls`, `eslint-lsp`, `gopls`, `java-debug-adapter`).
4. Chạy `:Mason` để kiểm tra trạng thái cài đặt của các công cụ.

---

## 3. 🚨 Xử lý Sự cố Thường gặp (Troubleshooting)

### Vấn đề 1: Treesitter báo lỗi không thể compile parser khi mở file
* **Nguyên nhân:** Thiếu C compiler (`gcc`, `clang`) hoặc chưa thêm compiler vào biến môi trường hệ thống (`PATH`).
* **Khắc phục:**
  * Cài đặt MinGW qua Winget / Chocolatey hoặc cài `zig`.
  * Kiểm tra trong terminal xem lệnh `gcc --version` có chạy được không.

### Vấn đề 2: Debugger C++ (`codelldb`) không khởi động trên Windows
* **Nguyên nhân:** Mason trên Windows tải binary kèm wrapper `codelldb.cmd`. Nếu đường dẫn bị sai hoặc execution policy bị chặn sẽ không chạy được.
* **Khắc phục:**
  * File [`lua/plugins/debugging.lua`](file:///c:/Users/duong/Documents/nvim/lua/plugins/debugging.lua#L28-L30) đã có đoạn mã xử lý kiểm tra `win32` tự động:
    ```lua
    local codelldb_cmd = vim.fn.has("win32") == 1
        and (vim.fn.stdpath("data") .. "/mason/bin/codelldb.cmd")
      or (vim.fn.stdpath("data") .. "/mason/bin/codelldb")
    ```
  * Đảm bảo trong `:Mason` gói `codelldb` đã được đánh dấu là `Installed`.

### Vấn đề 3: Debug JavaScript / TypeScript báo lỗi đường dẫn `dapDebugServer.js`
* **Nguyên nhân:** Thư mục `js-debug-dap-v1.100.0` bị thiếu hoặc đường dẫn config bị thay đổi.
* **Khắc phục:**
  * Đảm bảo thư mục [js-debug-dap-v1.100.0](file:///c:/Users/duong/Documents/nvim/js-debug-dap-v1.100.0) nằm ngay trong thư mục cấu hình Neovim (`stdpath("config")`).

### Vấn đề 4: Java LSP (`jdtls`) không tự động kích hoạt
* **Nguyên nhân:** Chưa cài đặt JDK 17+ hoặc cấu hình đường dẫn `workspace_dir` trong [`lua/configs/jdtls.lua`](file:///c:/Users/duong/Documents/nvim/lua/configs/jdtls.lua) bị xung đột quyền ghi.
* **Khắc phục:**
  * Đảm bảo `java -version` trả về phiên bản >= 17.
  * Kiểm tra log LSP bằng lệnh `:LspInfo` hoặc `:LspLog` trong Neovim.
