# nvim

## Install

### Install Neovim
Install Neovim latest.

### Install Plugins
execute `:PackerInstall` in Neovim cmdline.

## Formatter

### stylua

Install [stylua](https://github.com/JohnnyMorganz/StyLua).

If you have not Rust, you need to install it.
```bash
asdf plugin add rust
asdf install rust latest
asdf global rust latest
```

Install stylua.
```bash
cargo install stylua
```

## VSCode

[VSCode-neovim](https://github.com/vscode-neovim/vscode-neovim)拡張機能をインストールする。

`keybindings.json`に以下を設定する。

```json
[
    {
        "key":"Ctrl+t",
        "command": "workbench.action.terminal.toggleTerminal",
        "when":""
    },
    {
        "key": "Ctrl+K b",
        "command": "workbench.action.navigateBack",
        "when": "neovim.mode == normal && editorTextFocus",
    },
]
```

`workbench.action.navigateBack`は`init.lua`内で設定すると動作しなかったので、VSCode側で設定した。

## キーマップ
|  機能  |  キーマップ  |
| ---- | ---- |
|  fzf  |  \<leader\>g  |
|  ファイラ  |  \<leader\>f  |
|  live grep  |  \<leader\>g  |
|  バッファfzf  |  \<leader\>b  |
|  前のバッファ  |  \<C-h\>  |
|  次のバッファ  |  \<C-l\>  |
|  Zen Mode  |  \<leader\>z  |
|  quickfix fzf  |  \<leader\>z  |

### Telescope

|  機能  |  キーマップ  |
| ---- | ---- |
|  すべてquickfixに追加  |  \<C-q\>  |
|  選択した項目をquickfixに追加  |  \<M-q\>  |

### Telescope filer

| Insert / Normal | fb_actions           | Description                                                                      |
| --------------- | -------------------- | -------------------------------------------------------------------------------- |
| `<A-c>/c`       | create               | Create file/folder at current `path` (trailing path separator creates folder)    |
| `<S-CR>`        | create_from_prompt   | Create and open file/folder from prompt (trailing path separator creates folder) |
| `<A-r>/r`       | rename               | Rename multi-selected files/folders                                              |
| `<A-m>/m`       | move                 | Move multi-selected files/folders to current `path`                              |
| `<A-y>/y`       | copy                 | Copy (multi-)selected files/folders to current `path`                            |
| `<A-d>/d`       | remove               | Delete (multi-)selected files/folders                                            |
| `<C-o>/o`       | open                 | Open file/folder with default system application                                 |
| `<C-g>/g`       | goto_parent_dir      | Go to parent directory                                                           |
| `<C-e>/e`       | goto_home_dir        | Go to home directory                                                             |
| `<C-w>/w`       | goto_cwd             | Go to current working directory (cwd)                                            |
| `<C-t>/t`       | change_cwd           | Change nvim's cwd to selected folder/file(parent)                                |
| `<C-f>/f`       | toggle_browser       | Toggle between file and folder browser                                           |
| `<C-h>/h`       | toggle_hidden        | Toggle hidden files/folders                                                      |
| `<C-s>/s`       | toggle_all           | Toggle all entries ignoring `./` and `../`                                       |
| `<Tab>`         | see `telescope.nvim` | Toggle selection and move to next selection                                      |
| `<S-Tab>`       | see `telescope.nvim` | Toggle selection and move to prev selection                                      |
| `<bs>/`         | backspace            | With an empty prompt, goes to parent dir. Otherwise acts normally                |

### LSP
