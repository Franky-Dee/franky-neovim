## Vim Commands
#### Motions
- `hjkl` - right, down, up, right
- `e` - forwards to end of word
- `w` - forwards to start of word
- `b` - backwards to end of word
- `shift ~ b` - backwards to the beginning of the word
- `<number> ~ k` - move that amount of line up
- `<number> ~ j` - move that amount of line up
- `gg` - move to the top of page
- `shift + g` - move to the bottom of a page
- `%` - move to the end of the line
- `0` - move to the beginning of a line
- `{` - jump paragraph forwards
- `}` - jump paragraph backwards
- `f` - jump to first occurrence of letter in line
- `shift ~ f` - jump backwards to first occurrence of letter in line
- `t` - jump to before first occurrence of letter in line
- `shift ~ t` - jump backwards to before first occurrence of letter in line
#### Changing Modes
- `:` - enter commands
- `i` - insert mode before cursor
- `a` - insert mode in after of cursor
- `v` - visual mode
- `cntrl ~ v` - rectangular selection mode
- `cntrl ~ c, esc` - exit insert mode
- `o` - create newline below and enter insert
- `shift ~ o` - create newline above and insert
- `c` - delete and insert highlighted word
#### Vim Commands
- `cntrl ~ q` - quit file
- `cntrl ~ s` - write to file
- `:wq` - write and quite
- `d` - delete/cut
- `dd` - delete line
- `dw` - delete word after cursor
- `daw` - delete word under cursor 
- `caw` - delete word under the cursor and go into insert
- `x` - delete letter cursor is on
- `p` - paste after cursor
- `u` - undo
- `y` - copy to buffer
- `cntrl ~ r` - redo
- `shift ~ v` - highlight line
- `/` - search
- `cntrl ~ g` - forward through search results
- `cntrl ~ t` - backward through search results
- `f ~ <character>` - find character in line
- `space ~ nh` - remove highlighted search word
- `z ~ o` - open a folding
- `z ~ c` - close a folding
- `>` - tabs highlighted lines
- `=` - format highlighted
- `shift ~ i` - insert to multiple lines (`esc` after to apply change)
- `g ~ c` - comment highlighted lines
- `v ~ i ~ w` - visual in word (highlight word)
#### File manipulation
- `%` - create file in current directory
- `:e` - create new file
- `.` - enter directory
- `backspace` - exit directory
#### Debugger
- `Space ~ b` - toggle breakpoint
- `F5` - continue
- `F10` - step over
- `F11` - step into
- `space ~ ot` - open integrated terminal
- `cntrl ~ x` - leave terminal insert mode
#### Lazy Git
- `space ~ lg` - open lazy git
- `?` - show commands once lazy git is open
#### Window Management
- `space ~ sv` - split window vertically
- `space ~ sx` - close split window
- `alt ~ tab` - move forwards through tabs
- `alt ~ w` - close tab

#### Engine
- `source %` - reload configuration
- `:Ex` - open explore menu
- `:Lazy` - open lazy
- `:Mason` - open mason
- `:healthcheck` - check for issues with nvim
#### Telescope
- `cntrl ~ p` - search for file
- `cntrl - f` - search for string in file
#### NeoTree
- `cntrl ~ n` - enter neotree
- `a` - add file
#### LSP
- `K` - hover information
- `gd` - go to definition
- `space ~ ca` - show avaliable code actions
- `space ~ gf` - format with lsp
#### Other
- `space ~ fml` - make it rain

