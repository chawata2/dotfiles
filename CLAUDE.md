# CLAUDE.md

This file provides guidance to Claude Code (claude.ai/code) when working with code in this repository.

## Repository Overview

This is a personal dotfiles repository for macOS/Unix system configuration. The repository manages configuration files for terminal applications and shell environments.

## Architecture

The repository follows a modular structure where each tool has its own directory:

- **alacritty/**: Terminal emulator configuration with theme system
  - Main config: `alacritty.toml` 
  - Themes: `themes/themes/` directory with 100+ color schemes
  - Currently uses nightfox theme and HackGen35 Console NF font
  - Auto-launches tmux session on startup

- **tmux/**: Terminal multiplexer configuration
  - Config: `tmux.conf`
  - Custom prefix: Ctrl-t (instead of default Ctrl-b)
  - Vim-style pane navigation and copy mode
  - Custom status bar with session info and timestamp

- **zsh/**: Shell configuration
  - Main config: `.zshrc`
  - Uses sheldon plugin manager for extensions
  - Custom git prompt integration with status indicators
  - fzf integration for history search (Ctrl-r)
  - Loads environment-specific settings from `~/.local.zsh`

- **sheldon/**: Plugin manager for zsh
  - Config: `plugins.toml`
  - Manages zsh-syntax-highlighting and zsh-autosuggestions plugins

## Setup Commands

### Initial Installation
```bash
# Link sheldon config
ln -s $HOME/dotfiles/sheldon/ $HOME/.config/sheldon

# Link alacritty config (if needed)
ln -s $HOME/dotfiles/alacritty/ $HOME/.config/alacritty

# Link tmux config (if needed)  
ln -s $HOME/dotfiles/tmux/tmux.conf $HOME/.config/tmux/tmux.conf
```

### Plugin Management
```bash
# Install/update zsh plugins via sheldon
sheldon lock --update

# Add new zsh plugin
sheldon add <plugin-name> github='<user>/<repo>'
```

### Configuration Reload
```bash
# Reload tmux config
tmux source-file ~/.config/tmux/tmux.conf

# Reload zsh config
source ~/.zshrc
```

## Key Integration Points

- Alacritty automatically starts tmux with session management
- Zsh loads git completion and prompt scripts from the dotfiles directory
- Environment-specific customizations should go in `~/.local.zsh` (not tracked)
- Sheldon manages zsh plugins and is initialized in `.zshrc`