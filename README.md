# Dotfiles

My personal Linux shell configuration files, created while studying MIT's **The Missing Semester of Your CS Education**.

This repository lets me keep my terminal configuration under version control and quickly reproduce the same setup on a new machine.

## Included configuration

- `dotfiles/bashrc` — Bash aliases and prompt customization
- `dotfiles/tmux.conf` — tmux keybindings and quality-of-life settings
- `dotfiles/install.sh` — creates symbolic links from this repository to the expected files in `$HOME`

## Bash aliases

Some of the included aliases are:

```bash
alias dc='cd'
alias ll='ls -alh'
alias la='ls -A'
alias gs='git status'
```

The `dc` alias exists specifically for the common typo when typing `cd`.

## tmux

The tmux configuration includes:

- `Ctrl+A` as the tmux prefix
- `|` for vertical pane splitting
- `-` for horizontal pane splitting
- `Alt + Arrow Keys` to move between panes
- mouse support
- `Ctrl+A`, then `r` to reload the configuration

## Installation

Clone the repository into `~/.dotfiles`:

```bash
git clone https://github.com/joaoteixeirapedro/dotfiles.git ~/.dotfiles
```

Then run:

```bash
cd ~/.dotfiles
chmod +x dotfiles/install.sh
./dotfiles/install.sh
source ~/.bashrc
```

The installer backs up existing regular `.bashrc` and `.tmux.conf` files before creating symbolic links. If a `.backup` file already exists, it uses a numbered backup name instead of replacing it.

## Repository structure

```text
.dotfiles/
├── dotfiles/
│   ├── bashrc
│   ├── tmux.conf
│   └── install.sh
├── .gitignore
├── LICENSE
└── README.md
```

## Testing

The installation can be tested on a fresh Linux virtual machine or a clean WSL distribution by cloning the repository and running `./dotfiles/install.sh`.

## Notes

Do not store passwords, API keys, access tokens, private SSH keys, `.env` files, or other secrets in a public dotfiles repository.

## Why dotfiles?

Keeping configuration files in Git makes terminal setup:

- reproducible
- portable
- version controlled
- easy to restore on a new machine

## Example terminal output

After running the installer on a clean test account, the script prints messages in this format:

```text
Installing dotfiles from /home/user/.dotfiles/dotfiles
Dotfiles installed successfully.
Run: source ~/.bashrc
```

Run `readlink ~/.bashrc` and `readlink ~/.tmux.conf` to inspect the created links. This example uses a placeholder home directory; your path will differ.

## License and local files

The source is available under the [MIT license](LICENSE). The [`.gitignore`](.gitignore) excludes local environment files, editor backups and common key files.
