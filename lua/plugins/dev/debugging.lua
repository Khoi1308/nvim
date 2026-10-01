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
		local codelldb_cmd = vim.fn.has("win32") == 1
				and (vim.fn.stdpath("data") .. "/mason/bin/codelldb.cmd")
			or (vim.fn.stdpath("data") .. "/mason/bin/codelldb")

		dap.adapters.codelldb = {
			type = "server",
			port = "${port}",
			executable = {
				command = codelldb_cmd,
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

		-- JavaScript & TypeScript (js-debug)
		local js_debug_path = vim.fn.stdpath("config")
			.. "/js-debug-dap-v1.100.0/js-debug/src/dapDebugServer.js"

		dap.adapters["pwa-node"] = {
			type = "server",
			host = "localhost",
			port = "${port}",
			executable = {
				command = "node",
				args = { js_debug_path, "${port}" },
			},
		}

		local ts_configurations = {
			{
				type = "pwa-node",
				request = "launch",
				name = "Launch TS with tsx (Direct .ts debug)",
				program = "${file}",
				cwd = "${workspaceFolder}",
				runtimeExecutable = "npx",
				runtimeArgs = { "tsx" },
				sourceMaps = true,
				protocol = "inspector",
				console = "integratedTerminal",
			},
			{
				type = "pwa-node",
				request = "launch",
				name = "Launch Current File (Node / Compiled JS)",
				program = "${file}",
				cwd = "${workspaceFolder}",
				sourceMaps = true,
				protocol = "inspector",
				console = "integratedTerminal",
			},
			{
				type = "pwa-node",
				request = "attach",
				name = "Attach to Process",
				processId = require("dap.utils").pick_process,
				cwd = "${workspaceFolder}",
				sourceMaps = true,
			},
		}

		dap.configurations.typescript = ts_configurations
		dap.configurations.typescriptreact = ts_configurations

		dap.configurations.javascript = {
			{
				type = "pwa-node",
				request = "launch",
				name = "Launch Current File (Node)",
				program = "${file}",
				cwd = "${workspaceFolder}",
				sourceMaps = true,
				protocol = "inspector",
				console = "integratedTerminal",
			},
			{
				type = "pwa-node",
				request = "attach",
				name = "Attach to Process",
				processId = require("dap.utils").pick_process,
				cwd = "${workspaceFolder}",
				sourceMaps = true,
			},
		}
		dap.configurations.javascriptreact = dap.configurations.javascript

		-- Keymap
		vim.keymap.set("n", "<leader>dp", dap.toggle_breakpoint, { desc = "[D]ebug toggle break[P]oint" })
		vim.keymap.set("n", "<leader>dc", dap.continue, { desc = "[D]ebug [C]ontinue" })
		vim.keymap.set("n", "<leader>dx", dap.disconnect, { desc = "[D]ebug Disconnect" })
		-- vim.keymap.set("n", "<leader>dr", dap.restart, { desc = "[D]ebug [R]estart" })
		vim.keymap.set("n", "<C-n>", dap.step_into, { desc = "[D]ebug step into" })
	end,
}
