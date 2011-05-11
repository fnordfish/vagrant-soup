name "ruby_devel"
description "Set up a Ruby-Development-Server based on RVM."

run_list(
  "role[default]",
  "recipe[rvm::vagrant]",
  "recipe[rvm]"
)

default_attributes(
  :rvm => {
    :version => "1.6.5",
    :rubies => ["1.9.2"],
    :rvmrc => {
      'rvm_gemset_create_on_use_flag' => 1,
      'rvm_trust_rvmrcs_flag'         => 1,
      'rvm_project_rvmrc'             => 1,
      'rvm_project_rvmrc_default'     => 1
    },
    :group_users => [ "vagrant" ]
  }
)