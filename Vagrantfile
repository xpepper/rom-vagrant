# -*- mode: ruby -*-
# vi: set ft=ruby :

ROOT     = File.expand_path(File.dirname(__FILE__))
DOTFILES = File.join(ROOT, 'dotfiles')

Vagrant.configure("2") do |config|
  config.vm.box = 'ubuntu-12.04'
  config.vm.box_url = 'http://cloud-images.ubuntu.com/vagrant/precise/20131010/precise-server-cloudimg-amd64-vagrant-disk1.box'
  config.vm.hostname = 'rom-rb'
  config.vbguest.auto_update = true
  config.ssh.forward_agent = true

  config.vm.synced_folder File.join(ROOT, '..'), '/home/vagrant/rom-rb'

  if File.exist?(DOTFILES)
    config.vm.synced_folder DOTFILES, '/home/vagrant/.dotfiles'
  end

  config.vm.provision :chef_solo do |chef|
    chef.add_recipe 'apt'
    chef.add_recipe 'main'
    chef.add_recipe 'tmux'
  end
end
