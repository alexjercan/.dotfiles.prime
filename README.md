# Install Ubuntu


1. Install stow and dotfiles

```console
sudo apt install stow git zsh curl
sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"

cd
git clone https://github.com/alexjercan/.dotfiles.git
cd .dotfiles
./ubuntu
```

For auto suggestions
```console
git clone https://github.com/zsh-users/zsh-autosuggestions ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-autosuggestions
```

2. Install ghcup and dependencies

Note: Choose default settings for ghcup

```console
sudo apt install build-essential curl libffi-dev libffi8ubuntu1 libgmp-dev libgmp10 libncurses-dev libncurses5 libtinfo5
curl --proto '=https' --tlsv1.2 -sSf https://get-ghcup.haskell.org | sh
```

3. Install xmonad and dependencies

```console
sudo apt install git libx11-dev libxft-dev libxinerama-dev libxrandr-dev libxss-dev libasound2-dev alsa-tools pavucontrol blueman nitrogen picom trayer xdotool
cd .config/xmonad
cabal update
cabal install --package-env=$HOME/.config/xmonad
```

Note: I couldn't get xmonad-wallpaper to install so I can use `setRandomWallpaper`

Note: To install lux on ubuntu check [lux](https://github.com/Ventto/lux)

4. Install xmobar and dependencies

```console
sudo apt install libxpm-dev
cabal install xmobar --flags="all_extensions"
```

5. Install kitty or any terminal emulator and set xmonad terminal to that

```console
sudo apt install kitty
```

6. Install brave-browser [brave.com](https://brave.com/linux/) or any other browser

```console
sudo apt install apt-transport-https curl

sudo curl -fsSLo /usr/share/keyrings/brave-browser-archive-keyring.gpg https://brave-browser-apt-release.s3.brave.com/brave-browser-archive-keyring.gpg

echo "deb [signed-by=/usr/share/keyrings/brave-browser-archive-keyring.gpg arch=amd64] https://brave-browser-apt-release.s3.brave.com/ stable main"|sudo tee /etc/apt/sources.list.d/brave-browser-release.list

sudo apt update

sudo apt install brave-browser
```

7. Install xinit and prepare the ~/.xsession file and startx

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

Note:
The other option would be to use a display manager and add the following into /usr/share/xsessions/xmonad.desktop

```
[Desktop Entry]
Version=1.0
Name=Xmonad
Comment=Use this session to run xmonad as your desktop environment
Exec=xmonad
Icon=
Type=Application
```

8. Install neovim (latest)

```console
sudo add-apt-repository ppa:neovim-ppa/unstable
sudo apt update
```

Install packer [packer](https://github.com/wbthomason/packer.nvim)

Open neovim and run `:PackerSync`
