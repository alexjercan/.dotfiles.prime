# Install Ubuntu

1. Install stow and dotfiles

```console
sudo apt install stow
cd
git clone https://github.com/alexjercan/.dotfiles.git
cd .dotfiles
./ubuntu
```

2. Install zsh and omz

```console
sudo apt install zsh
```

3. Install ghcup and dependencies

Note: Choose default settings for ghcup

```console
sudo apt install build-essential curl libffi-dev libffi8ubuntu1 libgmp-dev libgmp10 libncurses-dev libncurses5 libtinfo5
curl --proto '=https' --tlsv1.2 -sSf https://get-ghcup.haskell.org | sh
```

5. Install xmonad and dependencies

```console
sudo apt install git libx11-dev libxft-dev libxinerama-dev libxrandr-dev libxss-dev libasound2-dev
cd .config/xmonad
cabal update
cabal install --package-env=$HOME/.config/xmonad
```

Note: I couldn't get xmonad-wallpaper to install so I can use `setRandomWallpaper`

6. Install xmobar and dependencies

```console
sudo apt install libxpm-dev
cabal install xmobar --flags="all_extensions"
```

7. Install kitty or any terminal emulator and set xmonad terminal to that

8. Install brave-browser [brave.com](https://brave.com/linux/)

```console
sudo apt install apt-transport-https curl

sudo curl -fsSLo /usr/share/keyrings/brave-browser-archive-keyring.gpg https://brave-browser-apt-release.s3.brave.com/brave-browser-archive-keyring.gpg

echo "deb [signed-by=/usr/share/keyrings/brave-browser-archive-keyring.gpg arch=amd64] https://brave-browser-apt-release.s3.brave.com/ stable main"|sudo tee /etc/apt/sources.list.d/brave-browser-release.list

sudo apt update

sudo apt install brave-browser
```

9. Install xinit and prepare the ~/.xsession file and startx

```console
sudo apt install xinit
```

.xsession:
```bash
#!/bin/sh
exec xmonad
```

```console
startx
```

10. Install neovim
