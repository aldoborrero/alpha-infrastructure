# -*- mode: ruby -*-
# vi: set ft=ruby :

Vagrant::Config.run do |config|  
  config.vm.box = "quantal64"
  config.vm.box_url = "http://static.aldoborrero.com/vagrant/quantal64.box"
  config.vm.host_name = 'alpha-vm'
  config.vm.network :bridged
  
  # Comment this or adapt it to your chef-server settings
  config.vm.provision :chef_client do |chef|
    ORGNAME = "kmiin"
    
    chef.chef_server_url = "https://api.opscode.com/organizations/#{ORGNAME}"
    
    chef.validation_key_path = ".chef/#{ORGNAME}-validator.pem"
    chef.validation_client_name = "#{ORGNAME}-validator"
    
    #chef.encrypted_data_bag_secret_key_path = ".chef/encrypted_data_bag_secret"
    
    chef.node_name = "#{config.vm.host_name}"
    chef.provisioning_path = "/etc/chef"

    chef.log_level = :debug or :info
    
    chef.environment = "dev"
      
    chef.add_role "base"
    chef.add_role "cache"
    chef.add_role "database"
    chef.add_role "webserver"
  end
  
  # Comment above and uncomment this to use chef-solo
  # config.vm.provision :chef_solo do |chef|
  #     chef.cookbooks_path = "cookbooks"
  #     chef.roles_path = "roles"
  #     chef.data_bags_path = "data_bags"
  #     chef.log_level = :debug
  #     
  #     chef.add_role "base"
  #     chef.add_role "cache"
  #     chef.add_role "database"
  #     chef.add_role "webserver"
  #   end
end
