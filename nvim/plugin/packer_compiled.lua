-- Automatically generated packer.nvim plugin loader code

if vim.api.nvim_call_function('has', {'nvim-0.5'}) ~= 1 then
  vim.api.nvim_command('echohl WarningMsg | echom "Invalid Neovim version for packer.nvim! | echohl None"')
  return
end

vim.api.nvim_command('packadd packer.nvim')

local no_errors, error_msg = pcall(function()

_G._packer = _G._packer or {}
_G._packer.inside_compile = true

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
  if threshold then
    table.insert(results, '(Only showing plugins that took longer than ' .. threshold .. ' ms ' .. 'to load)')
  end

  _G._packer.profile_output = results
end

time([[Luarocks path setup]], true)
local package_path_str = "/Users/nsrddyn/.cache/nvim/packer_hererocks/2.1.1736781742/share/lua/5.1/?.lua;/Users/nsrddyn/.cache/nvim/packer_hererocks/2.1.1736781742/share/lua/5.1/?/init.lua;/Users/nsrddyn/.cache/nvim/packer_hererocks/2.1.1736781742/lib/luarocks/rocks-5.1/?.lua;/Users/nsrddyn/.cache/nvim/packer_hererocks/2.1.1736781742/lib/luarocks/rocks-5.1/?/init.lua"
local install_cpath_pattern = "/Users/nsrddyn/.cache/nvim/packer_hererocks/2.1.1736781742/lib/lua/5.1/?.so"
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
  ale = {
    loaded = true,
    path = "/Users/nsrddyn/.local/share/nvim/site/pack/packer/start/ale",
    url = "https://github.com/dense-analysis/ale"
  },
  ["auto-pairs"] = {
    loaded = true,
    path = "/Users/nsrddyn/.local/share/nvim/site/pack/packer/start/auto-pairs",
    url = "https://github.com/jiangmiao/auto-pairs"
  },
  ["c.vim"] = {
    loaded = true,
    path = "/Users/nsrddyn/.local/share/nvim/site/pack/packer/start/c.vim",
    url = "https://github.com/vim-scripts/c.vim"
  },
  ["coc.nvim"] = {
    loaded = true,
    path = "/Users/nsrddyn/.local/share/nvim/site/pack/packer/start/coc.nvim",
    url = "https://github.com/neoclide/coc.nvim"
  },
  ["diffview.nvim"] = {
    config = { "\27LJ\2\n:\0\0\3\0\3\0\a6\0\0\0'\2\1\0B\0\2\0029\0\2\0004\2\0\0B\0\2\1K\0\1\0\nsetup\rdiffview\frequire\0" },
    loaded = true,
    path = "/Users/nsrddyn/.local/share/nvim/site/pack/packer/start/diffview.nvim",
    url = "https://github.com/sindrets/diffview.nvim"
  },
  ["emmet-vim"] = {
    loaded = true,
    path = "/Users/nsrddyn/.local/share/nvim/site/pack/packer/start/emmet-vim",
    url = "https://github.com/mattn/emmet-vim"
  },
  ["fzf.vim"] = {
    loaded = true,
    path = "/Users/nsrddyn/.local/share/nvim/site/pack/packer/start/fzf.vim",
    url = "https://github.com/junegunn/fzf.vim"
  },
  ["kanagawa.nvim"] = {
    config = { "\27LJ\2\n\15\0\1\2\0\0\0\0024\1\0\0L\1\2\0È\3\1\0\4\0\20\0\0256\0\0\0'\2\1\0B\0\2\0029\0\2\0005\2\3\0005\3\4\0=\3\5\0025\3\6\0=\3\a\0025\3\b\0=\3\t\0025\3\n\0=\3\v\0025\3\f\0=\3\r\0024\3\0\0=\3\14\0023\3\15\0=\3\16\2B\0\2\0016\0\17\0009\0\18\0'\2\19\0B\0\2\1K\0\1\0\25colorscheme kanagawa\bcmd\bvim\14overrides\0\vcolors\14typeStyle\1\0\1\tbold\2\19statementStyle\1\0\1\tbold\2\17keywordStyle\1\0\1\vitalic\2\18functionStyle\1\0\1\tbold\2\17commentStyle\1\0\1\vitalic\2\1\0\r\19terminalColors\2\16dimInactive\1\16transparent\2\14typeStyle\0\19statementStyle\0\17keywordStyle\0\18functionStyle\0\17commentStyle\0\14undercurl\2\fcompile\1\ntheme\twave\14overrides\0\vcolors\0\nsetup\rkanagawa\frequire\0" },
    loaded = true,
    path = "/Users/nsrddyn/.local/share/nvim/site/pack/packer/start/kanagawa.nvim",
    url = "https://github.com/rebelot/kanagawa.nvim"
  },
  nerdtree = {
    loaded = true,
    path = "/Users/nsrddyn/.local/share/nvim/site/pack/packer/start/nerdtree",
    url = "https://github.com/preservim/nerdtree"
  },
  ["nvim-lspconfig"] = {
    loaded = true,
    path = "/Users/nsrddyn/.local/share/nvim/site/pack/packer/start/nvim-lspconfig",
    url = "https://github.com/neovim/nvim-lspconfig"
  },
  ["nvim-treesitter"] = {
    loaded = true,
    path = "/Users/nsrddyn/.local/share/nvim/site/pack/packer/start/nvim-treesitter",
    url = "https://github.com/nvim-treesitter/nvim-treesitter"
  },
  ["packer.nvim"] = {
    loaded = true,
    path = "/Users/nsrddyn/.local/share/nvim/site/pack/packer/start/packer.nvim",
    url = "https://github.com/wbthomason/packer.nvim"
  },
  ["plenary.nvim"] = {
    loaded = true,
    path = "/Users/nsrddyn/.local/share/nvim/site/pack/packer/start/plenary.nvim",
    url = "https://github.com/nvim-lua/plenary.nvim"
  },
  ["vim-commentary"] = {
    loaded = true,
    path = "/Users/nsrddyn/.local/share/nvim/site/pack/packer/start/vim-commentary",
    url = "https://github.com/tpope/vim-commentary"
  },
  ["vim-gitgutter"] = {
    loaded = true,
    path = "/Users/nsrddyn/.local/share/nvim/site/pack/packer/start/vim-gitgutter",
    url = "https://github.com/airblade/vim-gitgutter"
  },
  ["vim-javascript"] = {
    loaded = true,
    path = "/Users/nsrddyn/.local/share/nvim/site/pack/packer/start/vim-javascript",
    url = "https://github.com/pangloss/vim-javascript"
  },
  ["vim-jsx"] = {
    loaded = true,
    path = "/Users/nsrddyn/.local/share/nvim/site/pack/packer/start/vim-jsx",
    url = "https://github.com/mxw/vim-jsx"
  },
  ["vim-polyglot"] = {
    loaded = true,
    path = "/Users/nsrddyn/.local/share/nvim/site/pack/packer/start/vim-polyglot",
    url = "https://github.com/sheerun/vim-polyglot"
  }
}

time([[Defining packer_plugins]], false)
-- Config for: kanagawa.nvim
time([[Config for kanagawa.nvim]], true)
try_loadstring("\27LJ\2\n\15\0\1\2\0\0\0\0024\1\0\0L\1\2\0È\3\1\0\4\0\20\0\0256\0\0\0'\2\1\0B\0\2\0029\0\2\0005\2\3\0005\3\4\0=\3\5\0025\3\6\0=\3\a\0025\3\b\0=\3\t\0025\3\n\0=\3\v\0025\3\f\0=\3\r\0024\3\0\0=\3\14\0023\3\15\0=\3\16\2B\0\2\0016\0\17\0009\0\18\0'\2\19\0B\0\2\1K\0\1\0\25colorscheme kanagawa\bcmd\bvim\14overrides\0\vcolors\14typeStyle\1\0\1\tbold\2\19statementStyle\1\0\1\tbold\2\17keywordStyle\1\0\1\vitalic\2\18functionStyle\1\0\1\tbold\2\17commentStyle\1\0\1\vitalic\2\1\0\r\19terminalColors\2\16dimInactive\1\16transparent\2\14typeStyle\0\19statementStyle\0\17keywordStyle\0\18functionStyle\0\17commentStyle\0\14undercurl\2\fcompile\1\ntheme\twave\14overrides\0\vcolors\0\nsetup\rkanagawa\frequire\0", "config", "kanagawa.nvim")
time([[Config for kanagawa.nvim]], false)
-- Config for: diffview.nvim
time([[Config for diffview.nvim]], true)
try_loadstring("\27LJ\2\n:\0\0\3\0\3\0\a6\0\0\0'\2\1\0B\0\2\0029\0\2\0004\2\0\0B\0\2\1K\0\1\0\nsetup\rdiffview\frequire\0", "config", "diffview.nvim")
time([[Config for diffview.nvim]], false)

_G._packer.inside_compile = false
if _G._packer.needs_bufread == true then
  vim.cmd("doautocmd BufRead")
end
_G._packer.needs_bufread = false

if should_profile then save_profiles() end

end)

if not no_errors then
  error_msg = error_msg:gsub('"', '\\"')
  vim.api.nvim_command('echohl ErrorMsg | echom "Error in packer_compiled: '..error_msg..'" | echom "Please check your config for correctness" | echohl None')
end
