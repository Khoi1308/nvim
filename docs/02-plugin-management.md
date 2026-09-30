# 📦 Plugin Management Guide (Lazy.nvim)

Tài liệu này hướng dẫn cách vận hành, bảo trì và mở rộng hệ thống plugin sử dụng **[lazy.nvim](https://github.com/folke/lazy.nvim)**.

---

## 1. ⚙️ Cơ chế hoạt động của Lazy.nvim

File [`lua/lazy-setup.lua`](file:///c:/Users/duong/Documents/nvim/lua/lazy-setup.lua) thực hiện:
1. **Tự động Bootstrap**: Nếu máy chưa có `lazy.nvim`, Neovim sẽ tự động gọi Git clone về thư mục `stdpath("data")/lazy/lazy.nvim`.
2. **Auto Import**: Cấu hình `require("lazy").setup({{ import = "plugins" }, ...})` giúp tự động đọc toàn bộ file `.lua` trong thư mục [`lua/plugins/`](file:///c:/Users/duong/Documents/nvim/lua/plugins).

---

## 2. ➕ Quy trình thêm Plugin mới

Khi muốn tích hợp một plugin mới, hãy tạo một file riêng trong thư mục [`lua/plugins/`](file:///c:/Users/duong/Documents/nvim/lua/plugins) theo mẫu chuẩn sau:

```lua
-- Ví dụ: lua/plugins/todo-comments.lua
return {
  "folke/todo-comments.nvim",
  dependencies = { "nvim-lua/plenary.nvim" },
  event = { "BufReadPre", "BufNewFile" }, -- Lazy load khi mở file
  opts = {
    -- cấu hình options ở đây
  },
  config = function(_, opts)
    require("todo-comments").setup(opts)
    -- Gán phím tắt nếu cần
    vim.keymap.set("n", "]t", function()
      require("todo-comments").jump_next()
    end, { desc = "Next todo comment" })
  end,
}
```

> **Quy tắc quan trọng (Best Practices):**
> 1. Mỗi file chỉ nên đại diện cho một tính năng hoặc một nhóm plugin gắn liền với nhau (ví dụ: `gitsigns.lua` quản lý cả gitsigns và vim-fugitive).
> 2. Sử dụng `dependencies` để đảm bảo thứ tự nạp đúng đắn.
> 3. Ưu tiên các cờ lazy loading như `event`, `cmd`, hoặc `ft` (filetype) để giảm thời gian khởi động Neovim xuống mức tối đa.

---

## 3. 🔄 Khóa phiên bản (Lockfile - `lazy-lock.json`)

* File [`lazy-lock.json`](file:///c:/Users/duong/Documents/nvim/lazy-lock.json) lưu commit hash chính xác của từng plugin đang cài đặt.
* **Mục đích trong môi trường doanh nghiệp / Team:** Đảm bảo toàn bộ thành viên trong đội ngũ khi clone repo sẽ có cấu hình plugin hoạt động y hệt nhau, không bị lỗi khi plugin upstream có breaking changes.
* Khi cập nhật plugin và kiểm tra hoạt động ổn định, hãy commit cả file `lazy-lock.json` vào Git.

---

## 4. ⌨️ Các lệnh quản lý thông dụng

| Lệnh trong Neovim | Mô tả tác vụ |
| :--- | :--- |
| `:Lazy` | Mở giao diện Dashboard quản lý trực quan |
| `:Lazy sync` | Đồng bộ hóa (Cài đặt plugin mới + Cập nhật + Xóa plugin thừa) |
| `:Lazy update` | Cập nhật tất cả các plugin lên phiên bản mới nhất |
| `:Lazy check` | Kiểm tra xem có bản cập nhật mới từ GitHub hay không |
| `:Lazy clean` | Dọn dẹp các plugin đã bị xóa khỏi config |
| `:Lazy profile` | Xem biểu đồ thời gian tải của từng plugin để tối ưu tốc độ mở máy |
