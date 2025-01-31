-- ~/.config/nvim/lua/core/keymaps.lua

local keymap = vim.keymap -- Alias for readability

-- Set leader key
vim.g.mapleader = " "

-- Normal mode mappings
keymap.set("n", "<leader>pv", vim.cmd.Ex, { desc = "Open file explorer" })
keymap.set("n", "<C-s>", ":w<CR>", { desc = "Save file" })
keymap.set("n", "<leader>q", ":q<CR>", { desc = "Quit Neovim" })

-- Visual mode mappings (Move selected lines up/down)
keymap.set("v", "J", ":m '>+1<CR>gv=gv", { desc = "Move selection down" })
keymap.set("v", "K", ":m '<-2<CR>gv=gv", { desc = "Move selection up" })

-- Telescope keymaps (Ensure Telescope is installed before mapping)
local ok, telescope = pcall(require, "telescope.builtin")
if ok then
    -- Telescope mappings
    keymap.set("n", "<leader>ff", telescope.find_files, { desc = "Find files" })
    keymap.set("n", "<leader>fg", telescope.live_grep, { desc = "Live grep" })
    keymap.set("n", "<leader>fb", telescope.buffers, { desc = "List buffers" })
    keymap.set("n", "<leader>fh", telescope.help_tags, { desc = "Help tags" })

    -- Additional telescope mappings for specific actions
    keymap.set("n", "<leader>fp", ":Telescope git_files<cr>", { desc = "Git files" })
    keymap.set("n", "<leader>fo", ":Telescope oldfiles<cr>", { desc = "Old files" })
else
    vim.notify("Telescope not found. Check Lazy.nvim setup.", vim.log.levels.WARN)
end

-- NvimTree keymap
keymap.set("n", "<leader>e", ":NvimTreeFindFileToggle<cr>", { desc = "Toggle NvimTree" })

-- Format code using LSP
keymap.set("n", "<leader>fmd", vim.lsp.buf.format, { desc = "Format document with LSP" })

-- Markdown preview
keymap.set("n", "<leader>mp", ":MarkdownPreviewToggle<cr>", { desc = "Toggle Markdown Preview" })

-- Nvim-comment keymap
keymap.set({"n", "v"}, "<leader>/", ":CommentToggle<cr>", { desc = "Toggle comments" })

