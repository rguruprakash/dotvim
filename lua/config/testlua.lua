local M = {}

function M.main()
	-- print(vim.fn.expand("%:p:h"))
	-- print(vim.fn.getcwd())
	-- local a = require('dap')
	-- print(vim.inspect(a.list_breakpoints()))
	-- vim.ui.input({ prompt = 'Enter value for shiftwidth: ' }, function(input)
	--   print(input)
	-- end)
	-- vim.cmd('cd ~/git/monroe/integration_test/')
	-- local output = vim.fn.system('go test ./... -list .')
	-- local lines = vim.split(output, '\n')
	-- local tests = {}
	-- local args = {}
	-- for _, line in pairs(lines) do
	--   table.insert(tests, vim.fn.trim(line))
	-- end
	-- vim.ui.select(tests, { label = 'tests> ' }, function(choice)
	--   table.insert(args, '-run')
	--   table.insert(args, choice)
	--   -- print(vim.inspect(type(args)))
	--   print(vim.inspect(args))
	-- end)
end

M.main()
