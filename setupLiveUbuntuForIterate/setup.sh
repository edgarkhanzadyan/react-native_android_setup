echo "installing curl"
sudo apt-get install curl
echo "installing node"
curl -sL https://deb.nodesource.com/setup_9.x | sudo -E bash -
sudo apt-get install -y nodejs
echo "install git dependencies "
sudo apt-get install git-man liberror-perl git
echo "install atom"
cd ~/Documents
wget https://atom.io/download/deb
sudo dpkg -i deb
echo "install cmatrix"
sudo apt-get update
sudo apt-get install cmatrix
echo "RUN CMATRIX"
cmatrix
