---@class ChadrcConfig

return {
	lsp = { signature = true, semantic_tokens = true },

	ui = {
		theme = "one_light",
		theme_toggle = { "one_light", "one_light" },

		hl_override = {
			["@comment"] = { italic = true, bold = true },
		},

		--[[ telescope = {
    style = "bordered",
  }, ]]

		cmp = {
			icons = true,
			lspkind_text = true,
			style = "flat_light",
		},

		statusline = {
			theme = "minimal",
			separator_style = "round",
		},

		nvdash = {
			load_on_startup = true,

			header = {
				"                                                                  ",
				"                                                                  ",
				"                                                                  ",
				"                                                                  ",
				"   ███╗   ███╗███╗   ███╗██████╗       ██╗   ██╗██╗███╗   ███╗    ",
				"   ████╗ ████║████╗ ████║██╔══██╗      ██║   ██║██║████╗ ████║    ",
				"   ██╔████╔██║██╔████╔██║██║  ██║█████╗██║   ██║██║██╔████╔██║    ",
				"   ██║╚██╔╝██║██║╚██╔╝██║██║  ██║╚════╝╚██╗ ██╔╝██║██║╚██╔╝██║    ",
				"   ██║ ╚═╝ ██║██║ ╚═╝ ██║██████╔╝       ╚████╔╝ ██║██║ ╚═╝ ██║    ",
				"   ╚═╝     ╚═╝╚═╝     ╚═╝╚═════╝         ╚═══╝  ╚═╝╚═╝     ╚═╝    ",
				"                                                                  ",
				"                                                                  ",
				"                                                                  ",
				"                                                                  ",
			},
		},
	},
}
