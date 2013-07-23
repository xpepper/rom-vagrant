## Installation

- Install vagrant

- Import Ubuntu 12.04 box

  ```
  vagrant box add ubuntu-12.04 https://s3-us-west-2.amazonaws.com/squishy.vagrant-boxes/precise64_squishy_2013-02-09.box
  ```

- Start the vm and open an ssh session

  ```
  cd /path/to/rom-vagrant
  vagrant up
  vagrant ssh
  ```

## Setup

```
export ROM_ROOT="/path/to/clones/of/rom/projects"
export ROM_VAGRANT_BOX="ubuntu-12.04"

# optional
export ROM_DOTFILES="path/to/your/dotfiles"
```
