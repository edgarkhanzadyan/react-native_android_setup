# react-native_android_setup
Setup react-native by this git repository: run this app by
```sh
bash ./android_setup.sh
```
* wait untill it will bring android window (DO NOT CLOSE TERMINAL TILL IT WILL NOT STOP WORKING BY ITSELF!)

* in android window enter custom setup, choose your favourite theme and press next all the time

* then when terminal will close, run
```sh
android avd
```
* create avd, and it is preferebly to use nexus 5 with atom64_86 processor and android 6.0, but you can choose another one.
* create it and start
* try react-native by
```sh
react-native init MyProject
```
```sh
cd MyProject
```
```sh
react-native start
```
* open another terminal, in that terminal write
```sh
react-native run-android
```
* enjoy react-native!)
