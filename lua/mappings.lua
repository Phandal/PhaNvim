local set_key = vim.api.nvim_set_keymap
local key_opts = { noremap = true, silent = true }

set_key("t", "<ESC>", [[<C-\><C-n>]], key_opts)
set_key("n", "<Leader>t", [[<CMD>10sp<CR><CMD>term<CR>]], key_opts)

-- NvimTree specific
set_key("n", "<C-n>", [[<CMD>NvimTreeToggle<CR>]], key_opts)

-- Telescope specific
set_key("n", "<Leader>bs", [[<CMD>lua require("telescope.builtin").current_buffer_fuzzy_find()<CR>]], key_opts)
set_key("n", "<Leader>ff", [[<CMD>lua require("telescope.builtin").find_files()<CR>]], key_opts)
set_key("n", "<Leader>fg", [[<CMD>lua require("telescope.builtin").live_grep()<CR>]], key_opts)
set_key("n", "<Leader>fb", [[<CMD>lua require("telescope.builtin").buffers()<CR>]], key_opts)
set_key("n", "<Leader>fh", [[<CMD>lua require("telescope.builtin").help_tags()<CR>]], key_opts)
set_key("n", "<Leader>gs", [[<CMD>lua require("telescope.builtin").git_status()<CR>]], key_opts)
set_key("n", "<Leader>gi", [[<CMD>lua require("telescope.builtin").lsp_implementations()<CR>]], key_opts)
set_key("n", "<Leader>gd", [[<CMD>lua require("telescope.builtin").lsp_definitions()<CR>]], key_opts)
set_key("n", "<Leader>gr", [[<CMD>lua require("telescope.builtin").lsp_references()<CR>]], key_opts)
set_key("n", "<leader>gp", [[<CMD>lua require("telescope.builtin").diagnostics()<CR>]], key_opts)
