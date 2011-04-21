name "ruby_rvm"
description "Example base role for a RVM / ruby development setup. Set ups a NFS-Server as well."

run_list(
  "recipe[apt]",
  "recipe[git]",
  "recipe[subversion]",
  "recipe[nfs::server]",
  "recipe[rvm]"
)


default_attributes(
  :rvm => {
    :version => "1.6.2",
    :rubies => ["1.9.2"],
    :global_gems => [
      { :name => "bundler" },
      { :name => "chef" },  
      { :name => "rake" }
    ],
    :rvmrc => {
      'rvm_gemset_create_on_use_flag' => 1,
      'rvm_trust_rvmrcs_flag'         => 1
    },
    :group_users => [ "vagrant" ]
  },
  
  :nfs => {
    :exports => {
      '/home/vagrant' => { :nfs_options => '192.168.0.0/16(anonuid=1000,anongid=1000,no_subtree_check,rw,insecure,all_squash)' }
    }
  }
  
)