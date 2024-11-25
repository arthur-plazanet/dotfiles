# dotfiles

## How to use

1.  Clone or fork the repository. I like to keep it in ~/config:

    ```
    git clone git@github.com:arthur-plazanet/dotfiles.git config
    ```

2.  Run the `set_symbolic_links.sh` script (only needed the first time):

    ```bash
    bash set_symbolic_links.sh
    # or
    chmod +x set_symbolic_links.sh
    ./set_symbolic_links.sh
    ```

This script will:

- Ask for the location of your config files (default: `~/.config`)
- Ask for the location of the target directory for the symbolic links (default: current directory where you cloned the repo)
- Create symbolic links for all files inside folders in the current directory to the configuration directory
    - Example: `~/.config/nvim` &rarr; `~/config/nvim`
- Create symbolic links for files listed in `HOME_FILES` in the home directory to the target directory (default: current directory)
    - Example: `~/.vimrc` &rarr; `~/config/.vimrc`

## How to sync

After running the script once per machine, update the configuration in the repo directory, commit the changes to your repository, and then:

```bash
git pull
```

This will keep your configurations in sync across different machines.
