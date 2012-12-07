name "database"
description "Database server"

all_env = [
  "role[base]", 
  "recipe[mysql::server]"
] 

run_list(all_env)

env_run_lists(
  "_default" => all_env,
  "prod" => all_env,
  "dev" => all_env,
)