name "ruby_devel"
description "Set up a Ruby-Development-Server based on RVM."

run_list(
  "role[default]",
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
  }
)