# Neovim Configuration

Personal Neovim configuration managed by [lazy.nvim](https://github.com/folke/lazy.nvim).

## Structure

```
~/.config/nvim/
├── init.lua              # Entry point: bootstraps lazy.nvim, editor options, autocommands
├── lazy-lock.json        # Lockfile pinning plugin versions (managed by lazy.nvim)
├── README.md             # This file
└── lua/
    └── plugins/          # One file per plugin group, loaded via lazy.nvim `import`
        ├── lsp-setup.lua # LSP servers (Mason + lspconfig)
        ├── noice.lua     # Enhanced UI (cmdline, messages, popupmenu)
        ├── notify.lua    # Notification system
        ├── telescope.lua # Fuzzy finder
        └── treesitter.lua# Syntax highlighting & text objects
```

## Plugins

| Plugin | Purpose |
| --- | --- |
| [lazy.nvim](https://github.com/folke/lazy.nvim) | Plugin manager (bootstrap in `init.lua`) |
| [tokyonight.nvim](https://github.com/folke/tokyonight.nvim) | Colorscheme (applied at startup) |
| [which-key.nvim](https://github.com/folke/which-key.nvim) | Popup showing available keybindings |
| [telescope.nvim](https://github.com/nvim-telescope/telescope.nvim) | Fuzzy finder (files, grep, buffers, help, LSP) |
| [telescope-fzf-native.nvim](https://github.com/nvim-telescope/telescope-fzf-native.nvim) | FZF sorter for Telescope (built with `make`) |
| [telescope-zoxide](https://github.com/jvgrootveld/telescope-zoxide) | Jump to recent folders (requires `zoxide`) |
| [plenary.nvim](https://github.com/nvim-lua/plenary.nvim) | Dependency for Telescope |
| [nvim-treesitter](https://github.com/nvim-treesitter/nvim-treesitter) | Syntax highlighting, indentation, parser installation |
| [nvim-treesitter-textobjects](https://github.com/nvim-treesitter/nvim-treesitter-textobjects) | Tree-sitter text objects & movement |
| [nvim-ts-autotag](https://github.com/windwp/nvim-ts-autotag) | Auto close/rename HTML/JSX tags |
| [mason.nvim](https://github.com/mason-org/mason.nvim) | Installs & manages LSP servers |
| [mason-lspconfig.nvim](https://github.com/mason-org/mason-lspconfig.nvim) | Bridges Mason and LSP config |
| [nvim-lspconfig](https://github.com/neovim/nvim-lspconfig) | LSP server configurations |
| [nvim-notify](https://github.com/rcarriga/nvim-notify) | Fancy notification popups |
| [noice.nvim](https://github.com/folke/noice.nvim) | Redesigned cmdline/messages/popup UI |
| [nui.nvim](https://github.com/MunifTanjim/nui.nvim) | Dependency for noice.nvim |

## LSP Servers

Installed automatically via Mason (`ensure_installed`) and enabled on demand
(`automatic_enable`):

| Server | Language |
| --- | --- |
| `pyright` | Python |
| `lua_ls` | Lua |
| `bashls` | Bash |
| `jsonls` | JSON |
| `yamlls` | YAML |
| `clangd` | C / C++ |
| `terraformls` | Terraform / HCL |
| `dockerls` | Dockerfile |
| `docker_compose_language_service` | Docker Compose |
| `gopls` | Go |
| `ts_ls` | TypeScript / JavaScript |
| `rust_analyzer` | Rust |
| `pbls` | Protobuf |

## Keymaps

Leader key: `Space`

### Telescope

| Key | Action |
| --- | --- |
| `<leader>ff` | Find files |
| `<leader>fg` | Live grep |
| `<leader>fb` | Buffers |
| `<leader>fh` | Help tags |
| `<leader>fr` | LSP references |
| `<leader>fs` | LSP document symbols |
| `<leader>fzx` | Zoxide recent folders |

### Tree-sitter text objects (operator + visual mode)

| Key | Object |
| --- | --- |
| `af` / `if` | Function |
| `ac` / `ic` | Class |
| `aa` / `ia` | Parameter |
| `ab` / `ib` | Block |

### Tree-sitter movement (normal / visual / operator)

| Key | Action |
| --- | --- |
| `]m` / `[m` | Next / previous function start |
| `]M` / `[M` | Next / previous function end |
| `]]` / `[[` | Next / previous class start |
| `][` / `[]` | Next / previous class end |

## Editor options

Set in `init.lua`: line numbers (absolute + relative), mouse support, smart
case-insensitive search, 2-space indentation (expanded tabs), sign column, and
truecolor.

Autocommands:
- Strip trailing whitespace on save.
- Populate the location list with diagnostics.
