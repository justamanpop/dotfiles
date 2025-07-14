--commands to replace aws credentials with contents of clipboard, takes np or p as input, indicating which of non prod or prod aws creds to replace
--
local replace_aws_credentials = function(opts)
	local search_profile_map = {
		n = "/701412975123_epsilon-std-admin",
		p = "/826553963729_epsilon-std-admin",
	}

	if search_profile_map[opts.fargs[1]] ~= nil then
		vim.cmd("Oac")
		vim.cmd(search_profile_map[opts.fargs[1]])
		vim.api.nvim_input("v3j$hp;wq<CR>")
	else
		vim.notify(
			"Invalid input to Rac command, please pass n for non-prod profile and p for prod profile",
			vim.log.levels.ERROR
		)
		return
	end
end

vim.api.nvim_create_user_command("Rac", replace_aws_credentials, { nargs = 1 })
