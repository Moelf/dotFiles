-- Automatically generated packer.nvim plugin loader code

if vim.api.nvim_call_function('has', {'nvim-0.5'}) ~= 1 then
  vim.api.nvim_command('echohl WarningMsg | echom "Invalid Neovim version for packer.nvim! | echohl None"')
  return
end

vim.api.nvim_command('packadd packer.nvim')

local no_errors, error_msg = pcall(function()

  local time
  local profile_info
  local should_profile = false
  if should_profile then
    local hrtime = vim.loop.hrtime
    profile_info = {}
    time = function(chunk, start)
      if start then
        profile_info[chunk] = hrtime()
      else
        profile_info[chunk] = (hrtime() - profile_info[chunk]) / 1e6
      end
    end
  else
    time = function(chunk, start) end
  end
  
local function save_profiles(threshold)
  local sorted_times = {}
  for chunk_name, time_taken in pairs(profile_info) do
    sorted_times[#sorted_times + 1] = {chunk_name, time_taken}
  end
  table.sort(sorted_times, function(a, b) return a[2] > b[2] end)
  local results = {}
  for i, elem in ipairs(sorted_times) do
    if not threshold or threshold and elem[2] > threshold then
      results[i] = elem[1] .. ' took ' .. elem[2] .. 'ms'
    end
  end

  _G._packer = _G._packer or {}
  _G._packer.profile_output = results
end

time([[Luarocks path setup]], true)
local package_path_str = "/home/akako/.cache/nvim/packer_hererocks/2.1.0-beta3/share/lua/5.1/?.lua;/home/akako/.cache/nvim/packer_hererocks/2.1.0-beta3/share/lua/5.1/?/init.lua;/home/akako/.cache/nvim/packer_hererocks/2.1.0-beta3/lib/luarocks/rocks-5.1/?.lua;/home/akako/.cache/nvim/packer_hererocks/2.1.0-beta3/lib/luarocks/rocks-5.1/?/init.lua"
local install_cpath_pattern = "/home/akako/.cache/nvim/packer_hererocks/2.1.0-beta3/lib/lua/5.1/?.so"
if not string.find(package.path, package_path_str, 1, true) then
  package.path = package.path .. ';' .. package_path_str
end

if not string.find(package.cpath, install_cpath_pattern, 1, true) then
  package.cpath = package.cpath .. ';' .. install_cpath_pattern
end

time([[Luarocks path setup]], false)
time([[try_loadstring definition]], true)
local function try_loadstring(s, component, name)
  local success, result = pcall(loadstring(s), name, _G.packer_plugins[name])
  if not success then
    vim.schedule(function()
      vim.api.nvim_notify('packer.nvim: Error running ' .. component .. ' for ' .. name .. ': ' .. result, vim.log.levels.ERROR, {})
    end)
  end
  return result
end

time([[try_loadstring definition]], false)
time([[Defining packer_plugins]], true)
_G.packer_plugins = {
  ["JuliaFormatter.vim"] = {
    loaded = true,
    path = "/home/akako/.local/share/nvim/site/pack/packer/start/JuliaFormatter.vim",
    url = "https://github.com/kdheepak/JuliaFormatter.vim"
  },
  LuaSnip = {
    loaded = true,
    path = "/home/akako/.local/share/nvim/site/pack/packer/start/LuaSnip",
    url = "https://github.com/L3MON4D3/LuaSnip"
  },
  SimpylFold = {
    loaded = true,
    path = "/home/akako/.local/share/nvim/site/pack/packer/start/SimpylFold",
    url = "https://github.com/tmhedberg/SimpylFold"
  },
  ["cmp-buffer"] = {
    loaded = true,
    path = "/home/akako/.local/share/nvim/site/pack/packer/start/cmp-buffer",
    url = "https://github.com/hrsh7th/cmp-buffer"
  },
  ["cmp-cmdline"] = {
    loaded = true,
    path = "/home/akako/.local/share/nvim/site/pack/packer/start/cmp-cmdline",
    url = "https://github.com/hrsh7th/cmp-cmdline"
  },
  ["cmp-nvim-lsp"] = {
    loaded = true,
    path = "/home/akako/.local/share/nvim/site/pack/packer/start/cmp-nvim-lsp",
    url = "https://github.com/hrsh7th/cmp-nvim-lsp"
  },
  ["cmp-path"] = {
    loaded = true,
    path = "/home/akako/.local/share/nvim/site/pack/packer/start/cmp-path",
    url = "https://github.com/hrsh7th/cmp-path"
  },
  gruvbox = {
    loaded = true,
    path = "/home/akako/.local/share/nvim/site/pack/packer/start/gruvbox",
    url = "https://github.com/morhetz/gruvbox"
  },
  indentLine = {
    loaded = true,
    path = "/home/akako/.local/share/nvim/site/pack/packer/start/indentLine",
    url = "https://github.com/Yggdroot/indentLine"
  },
  ["julia-vim"] = {
    loaded = true,
    path = "/home/akako/.local/share/nvim/site/pack/packer/start/julia-vim",
    url = "https://github.com/JuliaEditorSupport/julia-vim"
  },
  ["lualine.nvim"] = {
    loaded = true,
    path = "/home/akako/.local/share/nvim/site/pack/packer/start/lualine.nvim",
    url = "https://github.com/nvim-lualine/lualine.nvim"
  },
  ["nvim-cmp"] = {
    config = { "\27LJ\2\nÕ\4\0\0\t\0!\0C6\0\0\0'\2\1\0B\0\2\0029\1\2\0005\3\4\0005\4\3\0=\4\5\0035\4\b\0009\5\6\0009\5\a\5B\5\1\2=\5\t\0049\5\6\0009\5\n\5B\5\1\2=\5\v\0049\5\6\0009\5\f\5)\aüÿB\5\2\2=\5\r\0049\5\6\0009\5\f\5)\a\4\0B\5\2\2=\5\14\0049\5\6\0009\5\15\5B\5\1\2=\5\16\0049\5\6\0009\5\17\5B\5\1\2=\5\18\0049\5\6\0009\5\19\0055\a\22\0009\b\20\0009\b\21\b=\b\23\aB\5\2\2=\5\24\0049\5\6\0009\a\6\0009\a\n\aB\a\1\0025\b\25\0B\5\3\2=\5\26\0049\5\6\0009\a\6\0009\a\a\aB\a\1\0025\b\27\0B\5\3\2=\5\28\4=\4\6\0034\4\4\0005\5\29\0>\5\1\0045\5\30\0>\5\2\0045\5\31\0>\5\3\4=\4 \3B\1\2\1K\0\1\0\fsources\1\0\1\tname\tpath\1\0\1\tname\fluasnip\1\0\1\tname\rnvim_lsp\f<S-Tab>\1\3\0\0\6i\6s\n<Tab>\1\3\0\0\6i\6s\t<CR>\rbehavior\1\0\1\vselect\2\fReplace\20ConfirmBehavior\fconfirm\n<C-e>\nclose\14<C-Space>\rcomplete\n<C-f>\n<C-d>\16scroll_docs\n<C-n>\21select_next_item\n<C-p>\1\0\0\21select_prev_item\fmapping\15completion\1\0\0\1\0\1\16completeopt\26menu,menuone,noselect\nsetup\bcmp\frequire\0" },
    loaded = true,
    path = "/home/akako/.local/share/nvim/site/pack/packer/start/nvim-cmp",
    url = "https://github.com/hrsh7th/nvim-cmp"
  },
  ["nvim-lsp-installer"] = {
    loaded = true,
    path = "/home/akako/.local/share/nvim/site/pack/packer/start/nvim-lsp-installer",
    url = "https://github.com/williamboman/nvim-lsp-installer"
  },
  ["nvim-lspconfig"] = {
    loaded = true,
    path = "/home/akako/.local/share/nvim/site/pack/packer/start/nvim-lspconfig",
    url = "https://github.com/neovim/nvim-lspconfig"
  },
  ["nvim-web-devicons"] = {
    loaded = true,
    path = "/home/akako/.local/share/nvim/site/pack/packer/start/nvim-web-devicons",
    url = "https://github.com/kyazdani42/nvim-web-devicons"
  },
  ["packer.nvim"] = {
    loaded = true,
    path = "/home/akako/.local/share/nvim/site/pack/packer/start/packer.nvim",
    url = "https://github.com/wbthomason/packer.nvim"
  },
  ["plenary.nvim"] = {
    loaded = true,
    path = "/home/akako/.local/share/nvim/site/pack/packer/start/plenary.nvim",
    url = "https://github.com/nvim-lua/plenary.nvim"
  },
  ["telescope.nvim"] = {
    loaded = true,
    path = "/home/akako/.local/share/nvim/site/pack/packer/start/telescope.nvim",
    url = "https://github.com/nvim-telescope/telescope.nvim"
  },
  ["vim-commentary"] = {
    loaded = true,
    path = "/home/akako/.local/share/nvim/site/pack/packer/start/vim-commentary",
    url = "https://github.com/tpope/vim-commentary"
  },
  ["vim-cursorword"] = {
    loaded = true,
    path = "/home/akako/.local/share/nvim/site/pack/packer/start/vim-cursorword",
    url = "https://github.com/itchyny/vim-cursorword"
  },
  ["vim-gitgutter"] = {
    loaded = true,
    path = "/home/akako/.local/share/nvim/site/pack/packer/start/vim-gitgutter",
    url = "https://github.com/airblade/vim-gitgutter"
  },
  ["vim-slime"] = {
    loaded = true,
    path = "/home/akako/.local/share/nvim/site/pack/packer/start/vim-slime",
    url = "https://github.com/jpalardy/vim-slime"
  },
  ["vim-smoothie"] = {
    loaded = true,
    path = "/home/akako/.local/share/nvim/site/pack/packer/start/vim-smoothie",
    url = "https://github.com/psliwka/vim-smoothie"
  },
  ["vim-surround"] = {
    loaded = true,
    path = "/home/akako/.local/share/nvim/site/pack/packer/start/vim-surround",
    url = "https://github.com/tpope/vim-surround"
  },
  vimtex = {
    loaded = true,
    path = "/home/akako/.local/share/nvim/site/pack/packer/start/vimtex",
    url = "https://github.com/lervag/vimtex"
  }
}

time([[Defining packer_plugins]], false)
-- Config for: nvim-cmp
time([[Config for nvim-cmp]], true)
try_loadstring("\27LJ\2\nÕ\4\0\0\t\0!\0C6\0\0\0'\2\1\0B\0\2\0029\1\2\0005\3\4\0005\4\3\0=\4\5\0035\4\b\0009\5\6\0009\5\a\5B\5\1\2=\5\t\0049\5\6\0009\5\n\5B\5\1\2=\5\v\0049\5\6\0009\5\f\5)\aüÿB\5\2\2=\5\r\0049\5\6\0009\5\f\5)\a\4\0B\5\2\2=\5\14\0049\5\6\0009\5\15\5B\5\1\2=\5\16\0049\5\6\0009\5\17\5B\5\1\2=\5\18\0049\5\6\0009\5\19\0055\a\22\0009\b\20\0009\b\21\b=\b\23\aB\5\2\2=\5\24\0049\5\6\0009\a\6\0009\a\n\aB\a\1\0025\b\25\0B\5\3\2=\5\26\0049\5\6\0009\a\6\0009\a\a\aB\a\1\0025\b\27\0B\5\3\2=\5\28\4=\4\6\0034\4\4\0005\5\29\0>\5\1\0045\5\30\0>\5\2\0045\5\31\0>\5\3\4=\4 \3B\1\2\1K\0\1\0\fsources\1\0\1\tname\tpath\1\0\1\tname\fluasnip\1\0\1\tname\rnvim_lsp\f<S-Tab>\1\3\0\0\6i\6s\n<Tab>\1\3\0\0\6i\6s\t<CR>\rbehavior\1\0\1\vselect\2\fReplace\20ConfirmBehavior\fconfirm\n<C-e>\nclose\14<C-Space>\rcomplete\n<C-f>\n<C-d>\16scroll_docs\n<C-n>\21select_next_item\n<C-p>\1\0\0\21select_prev_item\fmapping\15completion\1\0\0\1\0\1\16completeopt\26menu,menuone,noselect\nsetup\bcmp\frequire\0", "config", "nvim-cmp")
time([[Config for nvim-cmp]], false)
if should_profile then save_profiles() end

end)

if not no_errors then
  error_msg = error_msg:gsub('"', '\\"')
  vim.api.nvim_command('echohl ErrorMsg | echom "Error in packer_compiled: '..error_msg..'" | echom "Please check your config for correctness" | echohl None')
end
