## Installation

- Install vagrant

- Setup rom-rb work directory, start the vm and open an ssh session

  ```
  git clone https://github.com/rom-rb/rom-vagrant.git rom-rb
  cd rom-vagrant
  git submodule init
  git submodule update
  vagrant up
  vagrant ssh
  ```

- dotfiles support (if you want to work inside the VM)

  ```
  ln -s /path/to/your/dotfiles /path/to/rom-rb/rom-vagrant/dotfiles
  ```

  your dotfiles will be available as `/home/vagrant/.dotfiles`
