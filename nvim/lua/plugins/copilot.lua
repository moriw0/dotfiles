return {
  "github/copilot.vim",
  lazy = false,
  config = function()
    vim.g.copilot_filetypes = { ["*"] = true }
  end,
}
