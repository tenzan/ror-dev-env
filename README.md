# Purpose
Creating Ruby on Rails virtual environment based on Ubuntu 14.04 64-bit/Vagrant/VirtualBox

# Steps

1. Install `git`, if you don't have one yet.

## Instructions for WindowsOS
 - Windows users can use install git for Windows from https://windows.github.com/
 - When you start installing prerequisites for github for windows and will ask you for reboot
 - After reboot it will start installing `github for windows`
 - Once installation completes, it will pop up the windows to login with you github credentials. Enter them.
 - On your Desktop you will find `Git Shell` shortcut, click on it. (Always use `Git Shell` instead of `Command Prompt`)
 - Move to the directory where you want to clone `https://github.com/tenzan/ror-dev-env`

2. Clone repo
`git clone https://github.com/tenzan/ror-dev-env.git` and `cd` to the repo.

3. Install latest `Virtualbox`. As of Jun 9, 2015 the latest version is 4.3.28

## Windows

Download and install from `http://download.virtualbox.org/virtualbox/4.3.28/VirtualBox-4.3.28-100309-Win.exe`

## Mac OS X. There're several ways, but here I write about `homebrew`

- Install `homebrew` if you don't have one:
`ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"`

- `brew tap caskroom/cask`

- `brew cask install virtualbox`

## Ubuntu. Ref.: `https://www.virtualbox.org/wiki/Linux_Downloads`vagrant

- Add the following line to your /etc/apt/sources.list:
  `deb http://download.virtualbox.org/virtualbox/debian trusty contrib`

- `wget -q https://www.virtualbox.org/download/oracle_vbox.asc -O- | sudo apt-key add -`

- Assuming version 4.3 is the latest.
  `sudo apt-get update && sudo apt-get install virtualbox-4.3`

- You may need to run `sudo apt-get install dkms`


4. Install Vagrant. To learn more: https://www.vagrantup.com/

## Windows

Download and install from `https://dl.bintray.com/mitchellh/vagrant/vagrant_1.7.2.msi`

## Mac OS X

`brew cask install vagrant`

## Ubuntu

`sudo apt-get install vagrant`

*Note*: The following steps are common for any OS

5. Add the vagrant box `ubuntu-14.04-x64`

`vagrant box add ubuntu-14.04-x64 https://cloud-images.ubuntu.com/vagrant/trusty/current/trusty-server-cloudimg-amd64-vagrant-disk1.box`

6. Starting vagrant. Username and password for the VM: `vagrant`
`vagrant up`

*Note:* At some point you will need to download and mount `VBoxGuestAdditions` ISO image to your `VirtualBox`
`http://dlc-cdn.sun.com/virtualbox/4.3.28/VBoxGuestAdditions_4.3.28.iso`

# Test if it's working

Login your VM via `vagrant ssh ubuntu` via your terminal and run the following bunch of commands by *copy&pasting*:

```
rails new myapp &&
cd myapp &&
bundle install &&
rails s -b 0.0.0.0
```

7. To check if `myapp` is running, on your host machine's browser, access `http://10.20.30.100:3000`

*Recommended for reading:* http://stackoverflow.com/a/30723007/1745902


# When you want to rebuild your vagrant environment, run:
`vagrant destroy --force && rm -rf .vagrant && vagrant up`

# Shared folder `~/work`.
As this folder is shared between Host and Guest OS, you fire up your editor/IDE on your host machine and have your code running in the Guest OS.
