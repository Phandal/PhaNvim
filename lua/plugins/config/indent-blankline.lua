require("indent_blankline").setup{
  space_char_blankline = " ",
  show_current_context = true,
  show_current_context_start = true,
  use_treesitter = true,
  show_trailing_blankline_indent = false,
  char = "│",
  --char = "⎸",
  filetype_exclude = {
    "help",
    "terminal"
  },
  buftype_exclude = {
    "terminal"
  }
}
