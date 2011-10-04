Vagrant::Config.run do |config|
  config.vm.box = "neatline"
  config.vm.box_url = "http://files.vagrantup.com/lucid32.box"

  config.vm.network "33.33.33.11"
  config.vm.provision :chef_solo do |chef|
    chef.cookbooks_path = [
      'cookbooks/opscode',
      'cookbooks/slab',
    ]

    # chef.add_recipe 'TODO'

    chef.add_recipe 'tmux'
    chef.add_recipe 'vim'

    chef.json.merge!({
      :omeka => {
        :version => 'stable-1.4',
      },
      :vim => {
        :extra_packages => %w{vim-scripts exuberant-ctags ack-grep htop}
      },
      :domain => [],
      :openldap => {}
    })
  end

end
