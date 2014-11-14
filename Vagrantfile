# -*- mode: ruby -*-
# vi: set ft=ruby :

VAGRANTFILE_API_VERSION = "2"

Vagrant.configure(VAGRANTFILE_API_VERSION) do |config|
  config.vm.hostname = "devbox"
#  config.vm.box = "ubuntu/trusty64"
  config.vm.box = "phusion-open-ubuntu-14.04-amd64"
  config.vm.box_url = "https://oss-binaries.phusionpassenger.com/vagrant/boxes/latest/ubuntu-14.04-amd64-vbox.box"


  config.vm.network :private_network, ip: "192.168.33.13"

  # config.vm.synced_folder "../data", "/vagrant_data"

  config.vm.provider "virtualbox" do |vb|
    #vb.gui = true
    vb.customize ["modifyvm", :id, "--memory", "1024"]
  end

  config.vm.provision "puppet" do |puppet|
    puppet.hiera_config_path = "conf/hiera.yaml"
    puppet.manifests_path = "manifests"
    puppet.module_path = "modules"
    puppet.options = ['--verbose']
  end

#  config.vm.provision "docker" do |d|
#    d.pull_images "bradegler/go"
#    d.pull_images "bradegler/node"
#    d.pull_images "bradegler/redis"
#    d.pull_images "bradegler/java7"
#    d.pull_images "bradegler/java8"
#    d.pull_images "bradegler/nginx"
#    d.pull_images "bradegler/scala"
#    d.pull_images "bradegler/rabbitmq"
#  end

end
