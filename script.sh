sudo apt-get -y update
sudo apt-get -y install python3-pip
sudo apt install -y python-pygments neofetch figlet lolcat
sudo pip3 install pygments
sudo pip3 install pygmentize

# Alacritty
sudo add-apt-repository  ppa:mmstick76/alacritty
sudo apt install -y alacritty
sudo update-alternatives --install /usr/bin/x-terminal-emulator x-terminal-emulator /usr/bin/alacritty 50
sudo update-alternatives --config x-terminal-emulator

# Fish shell
sudo apt-add-repository  ppa:fish-shell/release-3
sudo apt-get update -y
sudo apt-get install -y fish
chsh -s 'which fish'
cp -r fish_config_files/* ~/.config/fish/.
 
# Vim
sudo apt install -y vim
sudo apt install -y git
git clone https://github.com/VundleVim/Vundle.vim.git ~/.vim/bundle/Vundle.vim
cp .vimrc ~/.vimrc

# Tmux
sudo apt-get update -y
sudo apt-get install -y tmux
username=$(sudo sh -c 'echo $SUDO_USER')

rm -rf /home/$username/.tmux
mkdir /home/$username/.tmux
git clone https://github.com/gpakosz/.tmux.git /home/$username/.tmux/.
export TERM=xterm-256color
export EDITOR=vim
ln -s -f /home/$username/.tmux/.tmux.conf  /home/$username/.tmux.conf
cp /home/$username/.tmux/.tmux.conf.local /home/$username/.
echo 'set-option -g status-position top' >> /home/$username/.tmux.conf

neofetch
filget -f slant $username | lolcat

echo "fish" >> ~/.bashrc
echo "You need to manually open vim and execute ':PluginInstall' . Sorry for the incovenience but no other hack can be found for automating that right now!"
echo "Also you need to log out and login again to see the Tmux theme."

