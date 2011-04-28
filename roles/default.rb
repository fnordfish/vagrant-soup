name "default"
description "Default reciepes we want to use on all systems"

run_list(
  "recipe[apt]",
  "recipe[git]",
  "recipe[subversion]",
  "recipe[nfs::server]"
)


default_attributes(
  :nfs => {
    :exports => {
      '/home/vagrant' => { :nfs_options => '192.168.0.0/16(anonuid=1000,anongid=1000,no_subtree_check,rw,insecure,all_squash)' }
    }
  }
  
)