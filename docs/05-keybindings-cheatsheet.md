# ⌨️ Keybindings Master Cheat Sheet

Toàn bộ phím tắt trong hệ thống Neovim được phân chia theo từng không gian chức năng. Phím Leader mặc định là phím **Cách (Space)**.

---

## 1. 🪟 Quản lý Cửa sổ (Window Management)

| Phím tắt | Lệnh tương đương | Mô tả chức năng |
| :--- | :--- | :--- |
| `<leader>wsv` | `<C-w>v` | Tách đôi cửa sổ theo chiều dọc (Vertical Split) |
| `<leader>wsh` | `<C-w>s` | Tách đôi cửa sổ theo chiều ngang (Horizontal Split) |
| `<leader>wx` | `<C-w>q` | Đóng cửa sổ hiện tại |
| `<leader>wh` | `<C-w>h` | Di chuyển con trỏ sang cửa sổ bên trái |
| `<leader>wl` | `<C-w>l` | Di chuyển con trỏ sang cửa sổ bên phải |
| `<leader>wk` | `<C-w>k` | Di chuyển con trỏ lên cửa sổ phía trên |
| `<leader>wj` | `<C-w>j` | Di chuyển con trỏ xuống cửa sổ phía dưới |

---

## 2. 📑 Quản lý Tab / Buffers (`bufferline.nvim`)

| Phím tắt | Lệnh gọi | Mô tả chức năng |
| :--- | :--- | :--- |
| `<leader>bn` | `:bnext<CR>` | Chuyển sang buffer kế tiếp |
| `<leader>bp` | `:BufferLinePick<CR>` | Chọn trực quan buffer bằng ký tự gợi ý |
| `<leader>bx` | `:bdelete<CR>` | Đóng buffer hiện tại |
| `<leader>bd` | `:BufferLineCloseOthers<CR>` | Đóng tất cả các buffer khác trừ buffer đang mở |
| `<leader>bs` | `:ls<CR>` | Liệt kê danh sách tất cả các buffer |

---

## 3. 🔍 Tìm kiếm & Định hướng (`telescope.nvim`)

| Phím tắt | Hàm xử lý | Mô tả chức năng |
| :--- | :--- | :--- |
| `<leader>ff` | `builtin.find_files` | Tìm kiếm file theo tên trong project |
| `<leader>fg` | `builtin.live_grep` | Tìm kiếm nội dung văn bản trong toàn bộ project (Ripgrep) |
| `<leader>fb` | `builtin.buffers` | Tìm kiếm trong các buffer đang mở |
| `<leader>fd` | `builtin.diagnostics` | Tìm kiếm và nhảy tới danh sách lỗi chẩn đoán |
| `<leader>fh` | `builtin.help_tags` | Tìm kiếm trong tài liệu trợ giúp của Neovim |

*Trong cửa sổ tìm kiếm Telescope:*
* `<C-j>` / `<C-k>`: Di chuyển chọn kết quả xuống / lên.
* `<C-n>` / `<C-p>`: Lịch sử tìm kiếm tiếp theo / trước đó.

---

## 4. 📂 Cây thư mục File Explorer (`neo-tree.nvim`)

| Phím tắt | Lệnh gọi | Mô tả chức năng |
| :--- | :--- | :--- |
| `<leader>op` | `:Neotree filesystem reveal left<CR>` | Mở thanh cây thư mục bên trái và trỏ tới file hiện tại |
| `<leader>xp` | `:Neotree close<CR>` | Đóng thanh cây thư mục |

---

## 5. 🛠️ Biên dịch, Format & LSP

| Phím tắt | Lệnh / Hàm | Mô tả chức năng |
| :--- | :--- | :--- |
| `<leader>rc` | Custom Terminal Task | **Run Code**: Chạy file hiện tại (C++, TS, JS) trong terminal split |
| `<leader>cf` | `vim.lsp.buf.format` | **Code Format**: Định dạng file qua Prettier, Clang-format, Stylua... |
| `<leader>e` | `vim.diagnostic.open_float` | Mở cửa sổ nổi giải thích chi tiết lỗi tại vị trí con trỏ |
| `<Tab>` | `za` | Đóng / Mở khối code gập (Toggle Fold) |
| `<leader>cH` | `:TSBufEnable highlight<CR>` | Kích hoạt lại cú pháp tô màu Treesitter |
| `<Esc>` | `:nohlsearch<CR>` | Xóa vùng sáng bôi đen sau khi tìm kiếm |
| `<` (Visual) | `<gv` | Thụt lề sang trái và giữ nguyên vùng chọn |
| `>` (Visual) | `>gv` | Thụt lề sang phải và giữ nguyên vùng chọn |

---

## 6. 🐞 Gỡ lỗi (DAP Debugger)

| Phím tắt | Hàm xử lý | Mô tả chức năng |
| :--- | :--- | :--- |
| `<leader>dp` | `dap.toggle_breakpoint` | Đặt hoặc gỡ Breakpoint tại dòng con trỏ |
| `<leader>dc` | `dap.continue` | Bắt đầu debug hoặc tiếp tục chạy |
| `<leader>dx` | `dap.disconnect` | Ngắt phiên debug và tự đóng DAP UI |
| `<C-n>` | `dap.step_into` | Đi vào bên trong hàm (Step Into) |

---

## 7. 🌿 Quản lý Phiên bản Git (`gitsigns.nvim`)

| Phím tắt | Lệnh gọi | Mô tả chức năng |
| :--- | :--- | :--- |
| `<leader>gh` | `Gitsigns preview_hunk` | Xem trước sự thay đổi của đoạn code (Git diff hunk) |
| `<leader>gt` | `Gitsigns toggle_current_line_blame` | Bật/Tắt chú thích ai là người sửa dòng code này (Git Blame) |

---

## 8. ☕ Công cụ Spring Boot Java (`springboot-nvim`)

| Phím tắt | Hàm xử lý | Mô tả chức năng |
| :--- | :--- | :--- |
| `<leader>Jr` | `springboot_nvim.boot_run` | Chạy ứng dụng Spring Boot trong Neovim Terminal |
| `<leader>Jc` | `springboot_nvim.generate_class` | Tạo nhanh file Class Java |
| `<leader>Ji` | `springboot_nvim.generate_interface` | Tạo nhanh file Interface Java |
| `<leader>Je` | `springboot_nvim.generate_enum` | Tạo nhanh file Enum Java |
