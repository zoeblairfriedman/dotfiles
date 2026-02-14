# dotfiles

My personal development environment configuration files.

## What's Included

- **Neovim** - Full IDE-like setup for Ruby/Rails and TypeScript/React development

## Neovim Setup

A well-tuned Neovim configuration optimized for fullstack development with Ruby on Rails and React/TypeScript.

### Features

- 🎨 **Beautiful UI** - Palenight color scheme with Airline status bar
- 🔍 **Fuzzy Finding** - FZF integration for quick file navigation
- 🧠 **IntelliSense** - CoC for autocomplete, go-to-definition, and more
- ✨ **Auto-fixing** - ALE with Prettier and Rubocop integration
- 🧪 **RSpec Integration** - Run tests directly from Vim
- 🎯 **Git Integration** - GitGutter diff markers and inline blame
- 🌈 **Rainbow Parens** - Color-coded nested brackets
- 📝 **Language Support** - CoffeeScript, JavaScript, TypeScript, React, Ruby, Slim

### Prerequisites

Before installing, make sure you have:

1. **Neovim** (0.8.0+)
   ```bash
   brew install neovim
   ```

2. **Node.js** (for CoC)
   ```bash
   brew install node
   ```

3. **Python 3** (for some plugins)
   ```bash
   brew install python3
   ```

4. **Ripgrep** (for FZF searching)
   ```bash
   brew install ripgrep
   ```

5. **Rubocop** (for Ruby linting)
   ```bash
   gem install rubocop
   ```

6. **vim-plug** (plugin manager)
   ```bash
   sh -c 'curl -fLo "${XDG_DATA_HOME:-$HOME/.local/share}"/nvim/site/autoload/plug.vim --create-dirs \
       https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim'
   ```

### Installation

1. **Backup your existing config** (if you have one)
   ```bash
   mv ~/.config/nvim ~/.config/nvim.backup
   ```

2. **Create the config directory**
   ```bash
   mkdir -p ~/.config/nvim
   ```

3. **Symlink the config file**
   ```bash
   ln -s ~/Development/dotfiles/nvim/init.vim ~/.config/nvim/init.vim
   ```

4. **Install plugins**
   Open Neovim and run:
   ```vim
   :PlugInstall
   ```

5. **Restart Neovim** and you're good to go!

### Key Mappings Cheatsheet

**Leader key is `,`**

#### File Navigation
- `Ctrl+n` - Toggle NERDTree file explorer
- `:Files` - FZF fuzzy file finder

#### RSpec Testing
- `,r` - Run current spec file
- `,l` - Run spec at current line
- `,a` - Run last spec again
- `,cr` - Close spec results window

#### Debugging
- `,c` - Insert `console.log()` or `Rails.logger.debug` (language-aware)
- `,t` - Insert `puts` debug statement (Ruby only)

#### Code Navigation (via CoC)
- `gd` - Go to definition
- `gy` - Go to type definition
- `gi` - Go to implementation
- `gr` - Show references
- `ga` - Code action at cursor
- `K` - Show documentation
- `[g` - Previous diagnostic
- `]g` - Next diagnostic
- `,rn` - Rename symbol

#### Code Editing
- `gcc` - Comment/uncomment line
- `gc` - Comment/uncomment selection (visual mode)
- `cs"'` - Change surrounding quotes (vim-surround)
- `gS` - Split one-liner into multi-line
- `gJ` - Join multi-line into one-liner
- `,f` - Format selected code
- `=` - Auto-indent (with selection)

#### Linting (ALE)
- `ge` - Show error/warning details

#### Completion
- `Tab` - Next completion suggestion
- `Shift+Tab` - Previous completion suggestion

### Plugins Used

| Plugin | Purpose |
|--------|---------|
| **palenight.vim** | Dark color scheme |
| **vim-rainbow** | Rainbow colored brackets/parens |
| **vim-airline** | Status bar at bottom |
| **vim-surround** | Change surrounding quotes/brackets |
| **vim-repeat** | Repeat plugin actions with `.` |
| **vim-eunuch** | UNIX commands (`:Wall`, etc.) |
| **file-line** | Open files to specific line |
| **splitjoin.vim** | Split/join code blocks with `gS`/`gJ` |
| **nerdtree** | File explorer sidebar |
| **delimitMate** | Auto-close brackets/quotes |
| **vim-endwise** | Auto-add `end` in Ruby |
| **vim-better-whitespace** | Highlight trailing whitespace |
| **vim-polyglot** | Language syntax support |
| **vim-rails** | Rails-specific helpers |
| **vim-rake** | Rake integration |
| **vim-bundler** | Bundler integration |
| **run-rspec.vim** | Run RSpec tests from Vim |
| **vim-commentary** | Comment code with `gcc` |
| **vim-gitgutter** | Show git diff in gutter |
| **blamer.nvim** | Inline git blame |
| **coc.nvim** | IntelliSense/autocomplete engine |
| **ale** | Linting and auto-fixing |
| **vim-rubocop** | Rubocop integration |
| **fzf** | Fuzzy finder |

### Customization

The config is organized into clear sections:

- **EDITOR SETTINGS** - Basic Vim options
- **KEY MAPPINGS & LEADER** - Custom keybindings
- **PLUGIN INSTALLATION** - vim-plug plugin list
- **PLUGIN CONFIGURATION** - Plugin-specific settings

Feel free to modify any section to suit your preferences!

### Troubleshooting

**CoC not working?**
- Make sure Node.js is installed
- Run `:CocInfo` to check status
- Run `:CocUpdate` to update extensions

**Linting not working?**
- Install language-specific tools (rubocop, eslint, etc.)
- Check `:ALEInfo` for diagnostics

**Plugins not loading?**
- Run `:PlugUpdate` to update plugins
- Run `:PlugClean` to remove unused plugins

## License

Feel free to use and modify as you like!
