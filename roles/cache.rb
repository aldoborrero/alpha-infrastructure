name "cache_server"
description "Varnish cache server"

all_env = [
  "role[base]", 
  "recipe[varnish]"
] 

run_list(all_env)

env_run_lists(
  "_default" => all_env,
  "prod" => all_env,
  "dev" => all_env,
)