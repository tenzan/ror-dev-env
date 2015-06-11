# -*- mode: ruby -*-
# vi: set ft=ruby :

# All Vagrant configuration is done below. The "2" in Vagrant.configure
# configures the configuration version (we support older styles for
# backwards compatibility). Please don't change it unless you know what
# you're doing.
Vagrant.configure(2) do |config|
  config.vm.box = "ubuntu-14.04-x64"

  # Sync'd folders
  config.vm.synced_folder ".",                         "/vagrant",  disabled: true
  
  # Your working directory is `~/work` and it's shared between Host and Guest OS.
  config.vm.synced_folder "~/work",                "/home/vagrant/work", create: true

  # This will save deb files under your ~/apt-archives, 
  # so that you won't them downloading again when re-building environment
  # This will save you time and money (if you pay for traffic)
  config.vm.synced_folder "~/apt-archives", "/var/cache/apt/archives/", create: true


   # Ubuntu VM
  config.vm.define "ubuntu" do |ubuntu|
    ubuntu.vm.provision "shell", path: "provision.sh", privileged: false
    ubuntu.vm.network "private_network", ip: "10.20.30.100"
    ubuntu.vm.hostname = "ubuntu"
  end # End config.vm.define ubuntu

end
