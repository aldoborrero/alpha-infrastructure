# -*- mode: ruby -*-
# vi: set ft=ruby :

Vagrant::Config.run do |config|  
  config.vm.box = "quantal64"
  config.vm.box_url = "http://static.aldoborrero.com/vagrant/quantal64.box"
  config.vm.host_name = 'alpha'
  config.vm.network :bridged
  
  # config.vm.provision :chef_client do |chef|
  #   orgname = "kmiin"
  #   
  #   chef.chef_server_url = "https://api.opscode.com/organizations/#{orgname}"
  #   chef.validation_key_path = ".chef/#{orgname}-validator.pem"
  #   chef.validation_client_name = "#{orgname}-validator"
  #   #chef.encrypted_data_bag_secret_key_path = ".chef/encrypted_data_bag_secret"
  #   chef.node_name = "#{config.vm.host_name}-vm"
  #   chef.provisioning_path = "/etc/chef"
  #   chef.log_level = :debug
  #   #chef.log_level = :info
  # 
  #   chef.environment = "dev"
  #   chef.add_role "base"
  #   #chef.add_role "webserver"
  #   #chef.add_role "cache"
  #   #chef.add_role "database"
  #     
  #   # You may also specify custom JSON attributes:
  #   # chef.json = { :mysql_password => "foo" }
  # end
  
  config.vm.provision :chef_solo do |chef|
    chef.cookbooks_path = "cookbooks"
    chef.roles_path = "roles"
    chef.data_bags_path = "data_bags"
    chef.log_level = :debug
    
    chef.add_role "base"
    chef.add_role "cache"
    chef.add_role "database"
    chef.add_role "webserver"
    
    chef.json = {
      :mysql => {
        :server_root_password => "123",
        :server_debian_password => "123",
        :server_repl_password => "123"
      },
      :php => {
        :conf_dir => "/etc/php5",
        :directives => {
          "test" => "test",
        }
      }
    }
  end
end
