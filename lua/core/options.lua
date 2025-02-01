-- Basic options
vim.opt.number = true                      -- Enable line numbers
vim.opt.relativenumber = true              -- Enable relative line numbers
vim.opt.expandtab = true                   -- Convert tabs to spaces
vim.opt.tabstop = 4                        -- Set tab width to 4
vim.opt.softtabstop = 4                    -- Set soft tab stop to 4
vim.opt.shiftwidth = 4                     -- Set indentation width to 4
vim.opt.smartindent = true                 -- Enable smart indentation
vim.opt.wrap = false                       -- Disable line wrapping
vim.opt.ignorecase = true                  -- Ignore case when searching
vim.opt.smartcase = true                   -- Override ignorecase if uppercase letters are used in search
vim.opt.termguicolors = true               -- Enable true color support
vim.opt.clipboard = "unnamedplus"          -- Use system clipboard
vim.opt.scrolloff = 8                      -- Minimum number of lines to keep above and below the cursor
vim.opt.sidescrolloff = 8                  -- Minimum number of columns to keep above and below the cursor
vim.opt.encoding = "utf-8"                 -- Set file encoding to UTF-8
vim.opt.autoindent = true                  -- Enable auto indentation
vim.opt.list = true                        -- Show tab characters and trailing whitespace
vim.opt.hlsearch = false                   -- Disable highlighting of all search results
vim.opt.incsearch = true                   -- Enable incremental search

-- Python specific settings
-- vim.g.python3_host_prog = os.getenv("HOME") .. '/virtualenvs/nvim-venv/bin/python' -- Uncomment to set Python environment
vim.api.nvim_create_autocmd({"BufNewFile", "BufRead"}, {
  pattern = "*.py",
  callback = function()
    vim.opt.textwidth = 79                  -- Set text width for Python to 79 characters
    vim.opt.colorcolumn = "79"              -- Show a vertical line at column 79
  end
})

-- Filetype specific settings
vim.api.nvim_create_autocmd({"BufNewFile", "BufRead"}, {
  pattern = {"*.js", "*.html", "*.css", "*.lua"},
  callback = function()
    vim.opt.tabstop = 2
    vim.opt.softtabstop = 2
    vim.opt.shiftwidth = 2                  -- Use 2 spaces for indentation in JavaScript, HTML, CSS, and Lua files
  end
})

-- Return to last edit position when opening files
vim.api.nvim_create_autocmd("BufReadPost", {
    pattern = "*",
    callback = function()
      if vim.fn.line("'\"") > 0 and vim.fn.line("'\"") <= vim.fn.line("$") then
        vim.cmd("normal! g`\"")
      end
    end
})

