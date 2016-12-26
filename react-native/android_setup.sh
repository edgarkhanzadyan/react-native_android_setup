if [ "$(whoami)" == "root" ]; then
    printf "Must be run without sudo\n"
    exit -1
fi

if [ "$(which node)" == "" ]; then
  sudo curl -sL https://deb.nodesource.com/setup_6.x | bash -
  sudo aptitude install nodejs -y
fi

if [ "$(which unzip)" == "" ]; then
  sudo aptitude install unzip
fi
sudo npm install -g react-native-cli
sudo npm install -g yarn

sudo wget https://dl.google.com/dl/android/studio/ide-zips/2.2.2.0/android-studio-ide-145.3360264-linux.zip

sudo unzip android-studio-ide-145.3360264-linux.zip -d /opt/
sudo rm android-studio-ide-145.3360264-linux.zip
/opt/android-studio/bin/studio.sh

echo "export ANDROID_HOME=~/Android/Sdk" >> ~/.bashrc
echo "export PATH=\${PATH}:\${ANDROID_HOME}/tools" >> ~/.bashrc
echo "export PATH=\${PATH}:\${ANDROID_HOME}/platform-tools" >> ~/.bashrc
echo "export JAVA_HOME=/opt/jdk1.8.0_111/" >> ~/.bashrc
echo "export CLASSPATH=\${JAVA_HOME}/lib" >> ~/.bashrc
echo "export PATH=\${PATH}:\${JAVA_HOME}/bin" >> ~/.bashrc

sudo wget https://dl.google.com/android/repository/google_apis-23_r01.zip
sudo wget https://dl.google.com/android/repository/sys-img/android/x86-23_r09.zip
sudo wget https://dl.google.com/android/repository/platform-23_r03.zip
sudo wget https://dl.google.com/android/repository/sys-img/android/x86_64-23_r09.zip
sudo wget https://dl.google.com/android/repository/sys-img/google_apis/x86_64-23_r18.zip

mkdir /home/"$(whoami)"/Android/Sdk/system-images
mkdir /home/"$(whoami)"/Android/Sdk/system-images/android-23
mkdir /home/"$(whoami)"/Android/Sdk/system-images/android-23/default
mkdir /home/"$(whoami)"/Android/Sdk/system-images/android-23/google_apis

unzip x86-23_r09.zip -d /home/"$(whoami)"/Android/Sdk/system-images/android-23/default/
unzip x86_64-23_r09.zip -d /home/"$(whoami)"/Android/Sdk/system-images/android-23/default/
unzip x86_64-23_r18.zip -d /home/"$(whoami)"/Android/Sdk/system-images/android-23/google_apis/
unzip google_apis-23_r01.zip -d /home/"$(whoami)"/Android/Sdk/add-ons/
unzip platform-23_r03.zip -d /home/"$(whoami)"/Android/Sdk/platforms

sudo rm x86-23_r09.zip
sudo rm x86_64-23_r09.zip
sudo rm x86_64-23_r18.zip
sudo rm google_apis-23_r01.zip
sudo rm platform-23_r03.zip

sudo apt-get install lib32stdc++6 lib32z1
