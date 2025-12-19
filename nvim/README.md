# Neovim configuration

## Plugins

### 🎨 Themes

- [everforest.nvim](https://github.com/sainnhe/everforest) — Soft, warm, pastel woodland colorscheme.
- [kanagawa.nvim](https://github.com/rebelot/kanagawa.nvim) — Japanese-inspired colorscheme with rich contrasts.
- [synthweave.nvim](https://github.com/NvChad/synthweave.nvim) — Neon synthwave retro-futuristic theme.

### 🧭 UI & Navigation

- [alpha-nvim](https://github.com/goolord/alpha-nvim) — Elegant dashboard/greeter for Neovim.
- [bufferline.nvim](https://github.com/akinsho/bufferline.nvim) — Stylish buffer/tab line with icons and diagnostics.
- [lualine.nvim](https://github.com/nvim-lualine/lualine.nvim) — Fast and lightweight statusline written in Lua.
- [telescope.nvim](https://github.com/nvim-telescope/telescope.nvim) — Powerful fuzzy finder for files, LSP, git, and more.
- [nvim-tree.lua](https://github.com/nvim-tree/nvim-tree.lua) — File explorer tree written in Lua.
- [which-key.nvim](https://github.com/folke/which-key.nvim) — Popup showing keybindings and available commands.
- [indent-blankline.nvim](https://github.com/lukas-reineke/indent-blankline.nvim) — Indentation guides with scope highlighting.
- [render-markdown.nvim](https://github.com/MeanderingProgrammer/render-markdown.nvim) — Render Markdown with icons, checkboxes, etc.
- [fzf-lua](https://github.com/ibhagwan/fzf-lua) — Super fast fuzzy finder powered by fzf (Lua integration).

### 🧠 LSP & Development

- [cmp.nvim](https://github.com/hrsh7th/nvim-cmp) — Completion engine for Neovim (snippets, LSP, buffer, etc.).
- [nvim-ts-autotag](https://github.com/windwp/nvim-ts-autotag) — Auto-close & auto-rename HTML/TSX tags using Treesitter.
- [nvim-treesitter](https://github.com/nvim-treesitter/nvim-treesitter) — Better syntax highlighting and code structure parsing.
- [typescript-tools.nvim](https://github.com/pmizio/typescript-tools.nvim) — TypeScript LSP enhancements + commands.
- [neogen](https://github.com/danymat/neogen) — Generate annotations/docstrings for functions/classes.
- [simple-note.nvim](https://github.com/tamton-aquib/simple-note.nvim) — Lightweight note-taking plugin integrated in Neovim.

### 🔧 Coding & Editing

- [Comment.nvim](https://github.com/numToStr/Comment.nvim) — Smart commenting motions for lines and blocks.
- [todo-comments.nvim](https://github.com/folke/todo-comments.nvim) — Highlight & search TODO/FIX/HACK/NOTE comments.
- [conform.nvim](https://github.com/stevearc/conform.nvim) — Async code formatter with on-save support.
- [suave.nvim](https://github.com/miikanissi/suave.nvim) — Smooth scrolling and cursor movement animations.
- [tsj.nvim](https://github.com/Wansmer/treesj) — Toggle between single-line and multiline code structures.
- [grug-far.nvim](https://github.com/MagicDuck/grug-far.nvim) - Find And Replace plugin for neovim

### 🔌 Git Integration

- [neogit](https://github.com/NeogitOrg/neogit) — Magit-like interface for Git inside Neovim.
- [blame.nvim](https://github.com/FabijanZulj/blame.nvim) — Git blame annotations for lines and files.
- [diffview.nvim](https://github.com/sindrets/diffview.nvim) — Beautiful Git diff viewer with file history support.

### 🌐 Misc

- [commander.nvim](https://github.com/FeiyouG/commander.nvim) — Command palette with searchable actions.
- [live-server.nvim](https://github.com/barrett-ruth/live-server.nvim) — Launch a local dev server with live reload.
- [vim-dadbod-ui](https://github.com/kristijanhusak/vim-dadbod-ui) — UI for database management using vim-dadbod.
- [copilot.lua](https://github.com/zbirenbaum/copilot.lua) — GitHub Copilot integration for Neovim.

## Snippets

### VSCode

To sync snippets from VSCode to Neovim, I use [`lua/config/snippets/vscode`](https://github.com/arthur-plazanet/dotfiles/blob/937a94940b507af2d924b11b361dd46e00dabdf1/nvim/lua/config/snippets/vscode) as source of truth and create symbolic link to the VSCode snippets directory.

#### macOS

> [!NOTE]
> Use of default profile in VSCode `~/Library/Application\ Support/Code/User/snippets`

cd to your VSCode snippets directory:

```sh
cd ~/Library/Application\ Support/Code/User/
```

Make copy in case:

```sh
cp -r snippets ~/.config/nvim/lua/config/snippets/vscode-backup
```

Remove existing directory:

```sh
# pwd ~/Library/Application\ Support/Code/User/

rm -rf snippets
```

Create symbolic link:

```bash
ln -s ~/.config/nvim/lua/config/snippets/vscode snippets
```

## Checklist

See [checklist.md](./checklist.md)
