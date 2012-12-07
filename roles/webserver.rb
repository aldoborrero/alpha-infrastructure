name "webserver"
description "Web server role."

all_env = [ 
  "role[base]",
  "recipe[nginx]",
  "recipe[php]",
  "recipe[php::module_mysql]",
  "recipe[php::module_apc]",
  "recipe[php::module_curl]",
]

run_list(all_env)

env_run_lists(
  "_default" => all_env, 
  "prod" => all_env,
  #"dev" => all_env + ["recipe[php:module_xdebug]"],
  "dev" => all_env,
)