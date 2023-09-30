vim.cmd([[
  " command! -nargs=1 Scratch lua CreateScratchFile(<f-args>)
  command! -nargs=? Note lua CreateNoteFile(<f-args>)
  nmap <leader>n :Telescope find_files cwd=~/notes/<cr>
]])

-- function CreateScratchFile(extension)
-- 	local scratch_path = vim.fn.expand("~/.scratch")
-- 	local filename = os.date("%Y%m%d%H%M%S")
-- 	if extension and extension ~= "" then
-- 		filename = filename .. "." .. extension
-- 	end
-- 	local full_path = scratch_path .. "/" .. filename
-- 	vim.cmd("edit " .. full_path)
-- 	vim.cmd("setlocal buftype=nofile bufhidden=hide noswapfile")
-- 	vim.cmd('autocmd BufDelete <buffer> lua DeleteScratchFile("' .. full_path .. '")')
-- end

-- function DeleteScratchFile(full_path)
-- 	os.remove(full_path)
-- end

function CreateNoteFile(extension)
	local notes_path = vim.fn.expand("~/notes")
	local filename = os.date("%Y%m%d%H%M%S")
	if extension and extension ~= "" then
		filename = filename .. "." .. extension
	else
		filename = filename .. ".md"
	end
	local full_path = notes_path .. "/" .. filename
	vim.cmd("edit " .. full_path)
	vim.cmd("setlocal bufhidden=hide noswapfile")
end
