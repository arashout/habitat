# Install basics
sudo apt update -y
sudo apt install software-properties-common apt-transport-https wget curl git cmake -y

# Install visual studio code
wget -q https://packages.microsoft.com/keys/microsoft.asc -O- | sudo apt-key add -
sudo add-apt-repository "deb [arch=amd64] https://packages.microsoft.com/repos/vscode stable main"
sudo apt update
sudo apt install code

# Rust + Cargo
curl https://sh.rustup.rs -sSf | sh -s -- -y

# Download favorite command-line tools
sudo apt install ripgrep -y
cargo install exa
cargo isntall bat

# NVM
curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.34.0/install.sh | bash

./bash_setup.sh