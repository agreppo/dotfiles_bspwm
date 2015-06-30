# https://github.com/windelicato/dotfiles/wiki/bspwm-for-dummies

# Install packages
sudo apt-get install -y xinit
sudo apt-get install -y xserver-xorg
sudo apt-get install -y x11-xserver-utils
sudo apt-get install -y build-essential
sudo apt-get install -y git
sudo apt-get install -y xcb libxcb-util0-dev libxcb-ewmh-dev libxcb-randr0-dev libxcb-icccm4-dev libxcb-keysyms1-dev libxcb-xinerama0-dev libasound2-dev
sudo apt-get install -y vim dmenu rxvt-unicode htop feh
sudo apt-get install -y gtk2-engines-murrine

# Install Iceweasel Beta
sudo echo "deb http://http.debian.net/debian experimental main" > /etc/apt/sources.list.d/iceweaselbeta.list
sudo apt-get update
sudo apt-get install -t experimental iceweasel iceweasel-l10n-fr

# Get sources of bspwm & sxhkd
mkdir ~/src/
cd ~/src/

git clone https://github.com/baskerville/bspwm.git
git clone https://github.com/baskerville/sxhkd.git

# Panel
git clone https://github.com/baskerville/sutils.git
git clone https://github.com/baskerville/xtitle.git
git clone https://github.com/LemonBoy/bar.git

# Compile & Install bspwm & sxhkd
cd ~/src/bspwm/
make
sudo make install

cd ~/src/sxhkd/
make
sudo make install

# Compile & install Paner
cd ~/src/sutils/
make
sudo make install

cd ~/src/xtitle/
make
sudo make install

cd ~/src/bar/
make
sudo make install

# Copy default configuration
mkdir -p ~/.config/bspwm/
cp ~/src/bspwm/examples/bspwmrc ~/.config/bspwm/
chmod u+x ~/.config/bspwm/bspwmrc

mkdir -p ~/.config/sxhkd/
cp ~/src/bspwm/examples/sxhkdrc ~/.config/sxhkd/
chmod u+x ~/.config/sxhkd/sxhkdrc

# Copy panel file
mkdir -p ~/.config/panel/
cp ~/src/bspwm/examples/panel/panel ~/.config/panel/
cp ~/src/bspwm/examples/panel/panel_bar ~/.config/panel/
cp ~/src/bspwm/examples/panel/panel_colors ~/.config/panel/

chmod +x ~/.config/panel/panel
chmod +x ~/.config/panel/panel_bar
chmod +x ~/src/bspwm/examples/panel/panel_colors

# Create .xinitrc file
echo "sxhkd &" > ~/.xinitrc
echo "exec bspwm" >> ~/.xinitrc

# Theme
mkdir -p ~/.themes

# Vim
mkdir -p ~/.vim

startx
