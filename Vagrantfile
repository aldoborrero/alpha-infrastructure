# -*- mode: ruby -*-
# vi: set ft=ruby :

Vagrant::Config.run do |config|  
  config.vm.box = "quantal64-server"
  config.vm.box_url = "https://github.com/downloads/roderik/VagrantQuantal64Box/quantal64.box"
  config.vm.host_name = 'alpha'
  config.vm.network :bridged

  config.vm.provision :chef_solo do |chef|
      chef.cookbooks_path = "cookbooks"
      chef.roles_path = "roles"
      chef.data_bags_path = "data_bags"
      
      #chef.environment = "dev"
      chef.add_role "base"
      #chef.add_role "webserver"
      #chef.add_role "cache"
      #chef.add_role "database"
  
      # You may also specify custom JSON attributes:
      # chef.json = { :mysql_password => "foo" }
  end
end
