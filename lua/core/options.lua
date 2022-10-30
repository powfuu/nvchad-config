local opt = vim.opt
local g = vim.g
local config = require("core.utils").load_config()
g.vim_version = vim.version().minor
g.nvchad_theme = config.ui.theme
g.toggle_theme_icon = "   "
g.transparency = config.ui.transparency
g.theme_switcher_loaded = false
-- use filetype.lua instead of filetype.vim. it's enabled by default in neovim 0.8 (nightly)
if g.vim_version < 8 then
  g.did_load_filetypes = 0
  g.do_filetype_lua = 1
end
vim.cmd[[
"Auto closing </> tags
set relativenumber
let g:closetag_filenames = '*.html,*.xhtml,*.phtml,*.js,*.jsx,*.tsx'
let g:closetag_filetypes = 'html,xhtml,phtml,*.js,*.jsx,*.tsx'
let g:closetag_emptyTags_caseSensitive = 1
let g:closetag_regions = {
    \ 'typescript.tsx': 'jsxRegion,tsxRegion',
    \ 'javascript.jsx': 'jsxRegion',
    \ 'typescriptreact': 'jsxRegion,tsxRegion',
    \ 'javascriptreact': 'jsxRegion',
    \ }
let g:closetag_shortcut = '>'
let g:closetag_close_shortcut = '<leader>>'
noremap YY "+y<CR>
noremap <leader>p "+gP<CR>
noremap XX "+x<CR>
inoremap <silent> ><Tab> ><Esc>F<lyt>o</<C-r>"><Esc>O<Space>
nmap <silent> <A-l> :call animate#window_delta_width(-24)<CR>
nmap <silent> <A-h> :call animate#window_delta_width(24)<CR>
nmap <silent> <A-Up> :call animate#window_delta_height(-16)<CR>
nmap <silent> <A-Down> :call animate#window_delta_height(16)<CR>
nmap <silent> <A-m> :w <CR>
nmap <silent> <C-m> :syntax sync fromstart <CR>
nmap <silent> <S-l> :bnext<CR>
nmap <silent> <S-h> :bprevious<CR>
nmap <silent> <A-.> :tabnew<CR>
nnoremap <silent> <S-w> :q <CR>
map <silent> <S-q> :bp<bar>sp<bar>bn<bar>bd<CR>
nmap <silent><S-m> :mks!<CR>
cnoreabbrev s split
cnoreabbrev d vsplit
cnoreabbrev p Prettier
nmap <silent> <S-A-l> :vsplit<CR>
nmap <silent> <A-t> :hi Error guibg=guibg guifg=#e06c75 <CR>
nmap <silent> <S-A-k> :split<CR>
cnoreabbrev f <cmd>Telescope find_files hidden=true<CR>
let g:floaterm_title = ""
nnoremap <silent> ,. daw
nnoremap <silent> . caw
nnoremap <silent> <S-A-q> :qall<CR>
nnoremap <silent> <S-A-m> :wqall<CR>
set re=1
set timeout ttimeout         " separate mapping and keycode timeouts
set timeoutlen=125           " mapping timeout 250ms  (adjust for preference)
set ttimeoutlen=0           " keycode timeout 20ms
let g:coc_global_extensions = [ 'coc-html', 'coc-prettier']  " list of CoC extensions needed
set fileencodings=utf-8
:match Error /{\|}\|[\|]\|${\|==\|===\|!\|||\|!=\|&&/
:match Error /current\|styled\|style/
au VimEnter * :hi Error guibg=guibg guifg=#e06c75
autocmd BufEnter * :highlight CursorLine guibg=#32364c
g:vim_jsx_pretty_template_tags=["html","jsx","tsx","js"]
let g:vim_jsx_pretty_colorful_config = 1 " default 0
" IMPROVE PERFORMANCE
set redrawtime=0
set re=0
set noshowcmd noruler
"" set foldmethod=indent
"" set foldclose=all
set hid
set synmaxcol=450
set lazyredraw
syntax sync minlines=28
au BufEnter *.tsx :set ft=javascriptreact
]]

g.nvchad_theme = config.ui.theme
g.toggle_theme_icon = "   "
g.transparency = config.ui.transparency
g.theme_switcher_loaded = false

opt.laststatus = 3 -- global statusline
opt.showmode = false

opt.title = true
opt.clipboard = "unnamedplus"
opt.cursorline = true
opt.cul = true

-- Indenting
opt.expandtab = true
opt.shiftwidth = 4
opt.smartindent = true
opt.tabstop = 4
opt.softtabstop = 4

opt.fillchars = { eob = " " }
opt.ignorecase = true
opt.smartcase = true
opt.mouse = "a"

-- Numbers
opt.number = true
opt.numberwidth = 1
opt.ruler = false

-- disable nvim intro
opt.shortmess:append "sI"

opt.signcolumn = "no"
opt.splitbelow = true
opt.splitright = true
opt.termguicolors = true
opt.undofile = true

-- interval for writing swap file to disk, also used by gitsigns
opt.updatetime = 250

-- go to previous/next line with h,l,left arrow and right arrow
-- when cursor reaches end/beginning of line
opt.whichwrap:append "<>[]hl"

g.mapleader = "|"

-- disable some builtin vim plugins
local default_plugins = {
  "2html_plugin",
  "getscript",
  "getscriptPlugin",
  "gzip",
  "logipat",
  "netrw",
  "netrwPlugin",
  "netrwSettings",
  "netrwFileHandlers",
  "matchit",
  "tar",
  "tarPlugin",
  "rrhelper",
  "spellfile_plugin",
  "vimball",
  "vimballPlugin",
  "zip",
  "zipPlugin",
  "tutor",
  "rplugin",
  "syntax",
  "synmenu",
  "optwin",
  "compiler",
  "bugreport",
  "ftplugin",
}

for _, plugin in pairs(default_plugins) do
  g["loaded_" .. plugin] = 1
end

local default_providers = {
  "node",
  "perl",
  "python3",
  "ruby",
}

for _, provider in ipairs(default_providers) do
  vim.g["loaded_" .. provider .. "_provider"] = 0
end
