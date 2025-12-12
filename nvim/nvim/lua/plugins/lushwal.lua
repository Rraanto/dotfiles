return {
  -- plugin that syncs with pywal colors
  "oncomouse/lushwal.nvim",
  cmd = { "LushwalCompile" },
  dependencies = {
    { "rktjmp/lush.nvim" },
    { "rktjmp/shipwright.nvim" },
  },
}
