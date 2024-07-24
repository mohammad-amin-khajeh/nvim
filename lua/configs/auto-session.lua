require("auto-session").setup({
	log_level = "error",
	auto_session_enabled = true,
	auto_save_enabled = true,
	session_lens = {
		buftypes_to_ignore = {}, -- list of buffer types what should not be deleted from current session
		load_on_setup = true,
		theme_conf = { border = true },
		previewer = false,
	},
	vim.keymap.set("n", "<leader>sf", require("auto-session.session-lens").search_session, {
		noremap = true,
		desc = "autosession lens",
	}),
	vim.keymap.set("n", "<leader>sr", "<cmd>SessionRestore<cr>", { desc = "autosession restore" }),
	vim.keymap.set("n", "<leader>ss", "<cmd>SessionSave<cr>", { desc = "autosession save" }),
})
