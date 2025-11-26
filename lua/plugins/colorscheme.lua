return {
	"folke/tokyonight.nvim",
	priority = 1000,
	config = function()
		local transparent = true -- set to true if you would like to enable transparency
		local bg = "#011628"
		local bg_dark = "#011423"
		local bg_highlight = "#143652"
		local bg_search = "#0A64AC"
		local bg_visual = "#275378"
		local fg = "#CBE0F0"
		local fg_dark = "#B4D0E9"
		local fg_gutter = "#627E97"
		local border = "#547998"

		require("tokyonight").setup({
			style = "night",
			transparent = transparent,
			styles = {
				sidebars = transparent and "transparent" or "dark",
				floats = transparent and "transparent" or "dark",
			},
			on_colors = function(colors)
				colors.bg = bg
				colors.bg_dark = transparent and colors.none or bg_dark
				colors.bg_float = transparent and colors.none or bg_dark
				colors.bg_highlight = bg_highlight
				colors.bg_popup = bg_dark
				colors.bg_search = bg_search
				colors.bg_sidebar = transparent and colors.none or bg_dark
				colors.bg_statusline = transparent and colors.none or bg_dark
				colors.bg_visual = bg_visual
				colors.border = border
				colors.fg = fg
				colors.fg_dark = fg_dark
				colors.fg_float = fg
				colors.fg_gutter = fg_gutter
				colors.fg_sidebar = fg_dark
			end,
			-- ✨ THÊM CUSTOM HIGHLIGHTS CHO FOLD
			on_highlights = function(highlights, colors)
				-- Custom fold colors
				highlights.Folded = {
					bg = transparent and colors.none or "#1a2332", -- Darker blue background
					fg = "#7aa2f7", -- Light blue text
					italic = true,
				}

				highlights.FoldColumn = {
					bg = transparent and colors.none or colors.bg_dark,
					fg = "#565f89", -- Subtle gray for fold column
				}

				-- Optional: Custom fold virtual text
				highlights.UfoFoldedFg = { fg = "#c0caf5" }
				highlights.UfoFoldedBg = { bg = "#1a2332" }

				-- Optional: Customize fold icons/chars
				highlights.FoldMarker = {
					fg = "#7aa2f7",
					bg = transparent and colors.none or colors.bg,
				}
			end,
		})

		vim.cmd.colorscheme("tokyonight") -- set our colorscheme

		-- ✨ OPTIONAL: Additional fold settings
		vim.opt.fillchars:append({
			fold = " ",
			foldopen = "-",
			foldclose = "+",
			foldsep = " ",
		})
		vim.opt.foldcolumn = "1"
	end,
}
