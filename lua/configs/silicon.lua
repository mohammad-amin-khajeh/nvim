require("nvim-silicon").setup({
	font = "CaskaydiaCove NF=32",
	theme = "OneHalfLight",
	background = "#fdd",
	pad_horiz = 100,
	pad_vert = 130,
	no_line_number = true,
	gobble = true,
	shadow_blur_radius = 20,
	language = function()
		return vim.bo.filetype
	end,
	output = function()
		return "/home/mmd/Pictures/Code/"
			.. vim.api.nvim_buf_get_name(0):match(".+/(.+)%.+")
			.. " "
			.. os.date("!%Y-%m-%dT%H-%M-%S")
			.. "_code.png"
	end,
})
