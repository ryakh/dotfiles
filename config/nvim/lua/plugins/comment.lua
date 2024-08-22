-- Effectively wrap blocks and lines of code with comment characters
return {
  "numToStr/Comment.nvim",
  event = { "BufReadPre", "BufNewFile" },
  config = true
}
