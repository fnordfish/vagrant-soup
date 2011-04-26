Introduction
==================



Usage
==================

1. `git clone git://github.com/fnordfish/vagrant-soup.git my_new_vagrant_project`
2. cd my_new_vagrant_project
3. Edit the `Vagrantfile` to match your needs (e.g. add or remove a role and/or recipes)
4. `vagrant up`
5. enjoy

What you need
==================

* [vagrant](http://vagrantup.com) 0.7.2
* [VirtualBox](http://www.virtualbox.org/wiki/Downloads) 4.0.4
* [The vagrant base box](http://download.dotless.de/vagrant/lucid64_404.box) will be download automatically 

Third-Party stuff
==================

* The main recipes are provided by Opscode: [Opscode Public Cookbooks for Chef](https://github.com/opscode/cookbooks). 
  Opscode cookbooks are distributed under the Apache 2 Software License.
* The cookbook for NFS-(Server-)Support is taken from the [37signals cookbooks](https://github.com/37signals/37s_cookbooks). 
  37signals dit not provide any License Information in their repository.
* The [chef-rvm](https://github.com/fnichol/chef-rvm) cookbook is developed by Fletcher Nichol and "Licensed under the Apache License, Version 2.0"

