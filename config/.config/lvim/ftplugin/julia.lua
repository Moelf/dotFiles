local opts = {} 
-- re-use common lsp configurations (keybindings, buffer-highlight and cmp integration)
opts = require("lvim.lsp").get_common_opts() 
require('lspconfig').julials.setup(opts)
