local function grapple_select(index)
  if
    require("grapple").exists()
    and require("grapple").find({ index = index }) == require("grapple").find({ buffer = 0 })
  then
    vim.cmd("b#")
  else
    vim.cmd("Grapple select index=" .. index)
  end
end

local keys = {}

-- Static keys
table.insert(keys, { "<leader>ga", "<cmd>Grapple toggle<cr>", desc = "tag a file" })
table.insert(keys, { "<C-e>", "<cmd>Grapple toggle_tags<cr>", desc = "toggle grapple menu" })

for i = 1, 9 do
  table.insert(keys, {
    "<leader>" .. i,
    function()
      grapple_select(i)
    end,
    desc = "grapple select tag " .. i,
  })
end

return {
  "cbochs/grapple.nvim",
  cmd = "Grapple",
  opts = {
    scope = "cwd",
    icons = false,
    status = true,
  },
  keys = keys,
}
