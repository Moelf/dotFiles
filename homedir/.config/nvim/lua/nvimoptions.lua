local indent = 4
vim.opt.inccommand = "split" -- "for incsearch while sub
vim.g.clipboard = "osc52"                    -- have vim use OS clipboard
vim.opt.completeopt = "menuone,noinsert,noselect"    -- autocomplete options
vim.opt.expandtab = true                             -- expand tabs into spaces
vim.opt.autoindent = true
vim.opt.ignorecase = true                            -- search case insensitive
vim.opt.smartcase = true
vim.opt.termguicolors = true                         -- enable true color
vim.opt.tabstop = indent
vim.opt.shiftwidth = indent
vim.opt.pumheight = 16                               -- maximum autocomplete popup height
vim.opt.timeoutlen = 200                             -- note that this controls which-key.nvim
vim.opt.textwidth = 120
vim.opt.splitright = true                            -- open splits on the right by default
vim.opt.number=true
vim.opt.laststatus=2
vim.opt.undofile = true
vim.opt.undodir = vim.fn.expand('~/.vim/undodir')
vim.opt.mouse="a"
vim.opt.background="dark"
vim.cmd('colorscheme gruvbox')

vim.api.nvim_create_user_command("TypstPin", function()
  local tinymist_id = nil
  for _, client in pairs(vim.lsp.get_clients()) do
    if client.name == "tinymist" then
      tinymist_id = client.id
      break
    end
  end

  if not tinymist_id then
    vim.notify("tinymist not running!", vim.log.levels.ERROR)
    return
  end

  local client = vim.lsp.get_client_by_id(tinymist_id)
  if client then
    client.request("workspace/executeCommand", {
      command = "tinymist.pinMain",
      arguments = { vim.api.nvim_buf_get_name(0) },
    }, function(err)
      if err then
        vim.notify("error pinning: " .. err, vim.log.levels.ERROR)
      else
        vim.notify("succesfully pinned", vim.log.levels.INFO)
      end
    end, 0)
  end
end, {})
