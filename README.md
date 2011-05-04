Introduction
==================



Usage
==================

1. `git clone git://github.com/fnordfish/vagrant-soup.git my_new_vagrant_project`
2. cd my_new_vagrant_project
3. Edit the `Vagrantfile` to match your needs (e.g. add or remove a role and/or recipes)
4. `vagrant up`
5. enjoy

Adding Cookbooks
------------------

Simply put your new Cookbook into the `cookbooks` path and `chef.add_recipe("new_one")` within the `config.vm.provision`-block of your `Vagrantfile`.

Downloading Cookbooks from the [Chef Community](http://community.opscode.com/) is fairly simple and described in the [Opscode Wiki - Working with Git and Cookbooks](http://wiki.opscode.com/display/chef/Working+with+Git+and+Cookbooks#WorkingwithGitandCookbooks-DownloadCookbook).

In short: Say you want to install `couchdb`

``` shell
knife cookbook site vendor "couchdb" -d -o $PWD/cookbooks
```

The `knife` command comes with the `chef` gem. So you may need to `gem install chef` on your local machine.

A good overview of available Cookbooks by Opscode may be found in their [github repository](https://github.com/opscode/cookbooks). However, it is not recommended by Opscode to simply include all Cookbooks. Doing so may lead into strange errors regarding not even used Cookbooks.

Roles
==================

My Roles combines Cookbooks and configurations to provide a basic setup for development machines.

All of them include the `default` Role, which makes developing on the "remote-vm" easier. Basically it includes `git` and `subversion` so we can fetch remote sources and an `nfs-server` to get a fast remote connection into the VM.

Available Roles
------------------

* `default` : `git`, `subversion`, `nfs::server`
* `ruby_devel` : `rvm`



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

