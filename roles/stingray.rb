name "stingray"
description <<-DESC
  Base role for an 'Stingray'-friendly development environment.
  Stingray is the "community version" of the exozet r4 cms framework. And it hase some crazy-shit dependencies:
  http://stingray-redmine.exozet.com/wiki/stingray
DESC

run_list(
  "recipe[apt]",
  "recipe[git]",
  "recipe[subversion]",
  "recipe[nfs::server]",
  "recipe[mysql::client]",
  "recipe[mysql::server]",
  "recipe[php::source]",
  "recipe[nginx]",
  "recipe[memcached]",
  "recipe[imagemagick]"
)


default_attributes(
  :mysql => {
    :server_root_password => 'mysql',
    :server_repl_password => 'mysql',
    :server_debian_password => 'mysql',
    :bind_address => '0.0.0.0'
  },
  
  :nfs => {
    :exports => {
      '/home/vagrant' => { :nfs_options => '192.168.0.0/16(anonuid=1000,anongid=1000,no_subtree_check,rw,insecure,all_squash)' }
    }
  }
  
)