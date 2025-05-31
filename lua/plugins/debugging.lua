-- Debugging
return {
	"mfussenegger/nvim-dap",
	dependencies = {
		"rcarriga/nvim-dap-ui",
		"nvim-neotest/nvim-nio",
	},

	config = function()
		local dap, dapui = require("dap"), require("dapui")

		dapui.setup()

		dap.listeners.before.attach.dapui_config = function()
			dapui.open()
		end
		dap.listeners.before.launch.dapui_config = function()
			dapui.open()
		end
		dap.listeners.before.event_terminated.dapui_config = function()
			dapui.close()
		end
		dap.listeners.before.event_exited.dapui_config = function()
			dapui.close()
		end

		-- C plus plus
		dap.adapters.codelldb = {
			type = "server",
			port = "${port}",
			executable = {
				command = vim.fn.stdpath("data") .. "/mason/bin/codelldb",
				args = { "--port", "${port}" },
			},
		}

		dap.configurations.cpp = {
			{
				name = "Launch file",
				type = "codelldb",
				request = "launch",
				program = function()
					return vim.fn.input("Path to executable: ", vim.fn.getcwd() .. "/", "file")
				end,
				cwd = "${workspaceFolder}",
				stopOnEntry = false,
			},
		}

		-- JavaScript
		dap.adapters["pwa-node"] = {
			type = "server",
			host = "localhost",
			port = 3000,
			executable = {
				command = "node",
				-- 💀 Make sure to update this path to point to your installation
				args = { "./js-debug-dap-v1.100.0/js-debug/src/dapDebugServer.js", "${port}" },
			},
		}

		dap.configurations.javascript = {
			{
				type = "pwa-node",
				request = "launch",
				name = "Launch file",
				program = "${file}",
				cwd = "${workspaceFolder}",
			},
		}

		-- Keymap
		vim.keymap.set("n", "<leader>dp", dap.toggle_breakpoint, { desc = "[D]ebug toggle break[P]oint" })
		vim.keymap.set("n", "<leader>dc", dap.continue, { desc = "[D]ebug [C]ontinue" })
		vim.keymap.set("n", "<leader>dx", dap.disconnect, { desc = "[D]ebug Disconnect" })
		-- vim.keymap.set("n", "<leader>dr", dap.restart, { desc = "[D]ebug [R]estart" })
		vim.keymap.set("n", "<C-n>", dap.step_into, { desc = "[D]ebug step into" })
	end,
}
