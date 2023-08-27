local M = {}

function M.setup(use)
	use({
		"rcarriga/nvim-dap-ui",
		requires = {
			"mfussenegger/nvim-dap",
			config = function()
				local dap = require("dap")

				vim.keymap.set("n", "<F5>", function()
					require("dap").continue()
				end)
				vim.keymap.set("n", "<F6>", function()
					require("dap").step_over()
				end)
				vim.keymap.set("n", "<F7>", function()
					require("dap").step_into()
				end)
				vim.keymap.set("n", "<F8>", function()
					require("dap").step_out()
				end)
				vim.keymap.set("n", "<Leader>b", function()
					require("dap").toggle_breakpoint()
				end)
				vim.keymap.set("n", "<Leader>lp", function()
					require("dap").set_breakpoint(nil, nil, vim.fn.input("Log point message: "))
				end)
				vim.keymap.set("n", "<Leader>dr", function()
					require("dap").repl.toggle()
				end)
				vim.keymap.set("n", "<Leader>dl", function()
					require("dap").run_last()
				end)
				vim.keymap.set("n", "<Leader>du", function()
					require("dapui").toggle()
				end)
				vim.keymap.set({ "n", "v" }, "<Leader>dh", function()
					require("dap.ui.widgets").hover()
				end)
				vim.keymap.set({ "n", "v" }, "<Leader>dp", function()
					require("dap.ui.widgets").preview()
				end)
				vim.keymap.set("n", "<Leader>df", function()
					local widgets = require("dap.ui.widgets")
					widgets.centered_float(widgets.frames)
				end)
				vim.keymap.set("n", "<Leader>ds", function()
					local widgets = require("dap.ui.widgets")
					widgets.centered_float(widgets.scopes)
				end)

				dap.adapters.delve = {
					type = "server",
					port = "${port}",
					executable = {
						command = "dlv",
						args = { "dap", "-l", "127.0.0.1:${port}" },
					},
				}
				dap.adapters.node2 = {
					-- For this to work you need to make sure the node process is started with the `--inspect` flag.
					name = "Node2: Attach to process",
					type = "node2",
					request = "attach",
					processId = require("dap.utils").pick_process,
				}

				dap.configurations.go = {
					{
						type = "delve",
						name = "Debug",
						request = "attach",
						port = 8080,
						processId = require("dap.utils").pick_process,
					},
					{
						type = "delve",
						name = "Debug test",
						request = "launch",
						mode = "test",
						program = "./${relativeFileDirname}",
						args = function()
							return coroutine.create(function(dap_run_co)
								local command = "go test " .. vim.fn.expand("%:p:h") .. "/... -list ."
								local output = vim.fn.system(command)
								local lines = vim.split(output, "\n")
								local tests = {}
								local args = {}
								for _, line in pairs(lines) do
									if line ~= "" then
										table.insert(tests, vim.fn.trim(line))
									end
								end
								vim.ui.select(tests, { label = "tests> " }, function(choice)
									if choice == nil then
										coroutine.resume(dap_run_co, args)
									else
										table.insert(args, "-test.run")
										table.insert(args, choice)
										vim.ui.input({ prompt = "Testname in suite" }, function(input)
											if input ~= nil then
												table.insert(args, "-testify.m")
												table.insert(args, input)
											end
											coroutine.resume(dap_run_co, args)
										end)
									end
								end)
							end)
						end,
					},
				}
			end,
		},
		config = function()
			require("dapui").setup({
				layouts = {
					-- {
					--   elements = { {
					--     id = "scopes",
					--     size = 0.25
					--   }, {
					--     id = "breakpoints",
					--     size = 0.25
					--   }, {
					--     id = "stacks",
					--     size = 0.25
					--   }, {
					--     id = "watches",
					--     size = 0.25
					--   } },
					--   position = "left",
					--   size = 40
					-- },
					{
						elements = {
							{
								id = "repl",
								size = 0.5,
							},
							-- {
							--   id = "console",
							--   size = 0.5
							-- }
						},
						position = "bottom",
						size = 20,
					},
				},
			})
			local dap = require("dap")
			local dapui = require("dapui")
			dap.listeners.after.event_initialized["dapui_config"] = function()
				dapui.open()
			end
			-- dap.listeners.before.event_terminated["dapui_config"] = function()
			--   dapui.close()
			-- end
			-- dap.listeners.before.event_exited["dapui_config"] = function()
			--   dapui.close()
			-- end

			vim.fn.sign_define("DapBreakpoint", { text = "🙂", texthl = "", linehl = "", numhl = "" })
			vim.fn.sign_define("DapStopped", { text = "🥶", texthl = "", linehl = "", numhl = "" })
		end,
	})
	use({
		"theHamsta/nvim-dap-virtual-text",
		config = function()
			require("nvim-dap-virtual-text").setup()
		end,
	})
end

return M
