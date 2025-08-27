vim.b.minisurround_config = {
  custom_surroundings = {
    m = {
      input = { "%$().-()%$" },
      output = { left = "$", right = "$" },
    },
  },
}
