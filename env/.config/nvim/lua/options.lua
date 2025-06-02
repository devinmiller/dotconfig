local options = {
  termguicolors = true,                         -- Enables 24-bit RGB color in the TUI
  shiftwidth = 2,                               -- the number of spaces inserted for each indentation
  tabstop = 2,                                  -- insert 2 spaces for a tab
  expandtab = true,                             -- convert tabs to spaces
  relativenumber = true,                        -- set relative numbered lines
  cursorline = true,                            -- highlight the current line
  number = true,                                -- set numbered lines
  wrap = false,                                 -- display lines as one long line
  signcolumn = "yes",                           -- avoid an annoying layout shift
  showmode = false,
  updatetime = 250,                             -- decrease update time
  splitbelow = true,                            -- put the new window below the current
  splitright = true,                            -- put the new window right of the current
  clipboard = "unnamedplus",                    -- sync clipboard between OS and Neovim.
  foldcolumn = "0",                             -- when and how to draw the foldcolumn
  foldmethod = "expr",                          -- the kind of folding used for the current window
  foldexpr = "v:lua.vim.treesitter.foldexpr()", -- the expression used for the folding
  foldnextmax = 3,                              -- sets the maximum nesting of folds
  foldlevel = 99,                               -- sets the fold level
  foldlevelstart = 99,                          -- sets 'foldlevel' when starting to edit
}

for name, value in pairs(options) do
  vim.opt[name] = value
end
