if g:dein#_cache_version != 100 | throw 'Cache loading error' | endif
let [plugins, ftplugin] = dein#load_cache_raw(['/home/na9ra/.vimrc', '/home/na9ra/.vim/rc/dein.toml', '/home/na9ra/.vim/rc/dein_lazy.toml'])
if empty(plugins) | throw 'Cache loading error' | endif
let g:dein#_plugins = plugins
let g:dein#_ftplugin = ftplugin
let g:dein#_base_path = '/home/na9ra/.vim/dein'
let g:dein#_runtime_path = '/home/na9ra/.vim/dein/.cache/.vimrc/.dein'
let g:dein#_cache_path = '/home/na9ra/.vim/dein/.cache/.vimrc'
let &runtimepath = '/home/na9ra/.vim/dein/repos/github.com/Shougo/dein.vim/,/home/na9ra/.vim,/usr/share/vim/vimfiles,/home/na9ra/.vim/dein/repos/github.com/Shougo/vimproc.vim,/home/na9ra/.vim/dein/repos/github.com/Shougo/dein.vim,/home/na9ra/.vim/dein/.cache/.vimrc/.dein,/usr/share/vim/vim81,/home/na9ra/.vim/dein/.cache/.vimrc/.dein/after,/usr/share/vim/vimfiles/after,/home/na9ra/.vim/after'
autocmd dein-events InsertEnter * call dein#autoload#_on_event("InsertEnter", ['neocomplete', 'neosnippet'])
