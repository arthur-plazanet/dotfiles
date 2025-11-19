# Neovim configuration

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
