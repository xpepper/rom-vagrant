# -*- mode: ruby -*-
# vi: set ft=ruby :

Vagrant.configure("2") do |config|
  config.vm.box = "ubuntu-12.04"
  config.vbguest.auto_update = true

  config.vm.synced_folder ENV.fetch('ROM_ROOT'), '/home/vagrant/rom'

  config.vm.provision :chef_solo do |chef|
    chef.add_recipe 'main'
  end
end
