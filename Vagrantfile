Vagrant::Config.run do |config|
  config.vm.box = "neatline"
  config.vm.box_url = "http://files.vagrantup.com/lucid32.box"

  config.vm.network "33.33.33.11"
  config.vm.provision :chef_solo do |chef|
    chef.cookbooks_path = [
      'cookbooks/opscode',
      'cookbooks/slab',
    ]

    chef.add_recipe 'apt'
    chef.add_recipe 'omeka'
    chef.add_recipe 'geoserver'

    chef.add_recipe 'tmux'
    chef.add_recipe 'vim'

    chef.json.merge!({
      :omeka => {
        :site_title          => 'Neatline Cthulu Playground',
        :description         => 'This is a small Omeka site to play with Neatline.',
        :username            => 'neatline',
        :password            => 'neatline',
        :super_email         => 'erochest@virginia.edu',
        :administrator_email => 'erochest@virginia.edu',
        :copyright           => 'Rector and Visitors of the University of Virginia',
        :author              => 'Eric Rochester',
        :path_to_convert     => '/usr/bin',
        :version             => 'stable-1.4',
        :plugins             => [
          {:name => 'Neatline',     :url => 'git://github.com/scholarslab/Neatline.git'},
                                    # :revision => 'map'},
          {:name => 'NeatlineMaps', :url => 'git://github.com/scholarslab/NeatlineMaps.git'},
          {:name => 'NeatlineTime', :url => 'git://github.com/scholarslab/NeatlineTime.git'},
          # {:name => 'NeatlineFeatures',
                                    # :url => 'git://github.com/scholarslab/NeatlineFeatures.git'},
        ],
        # :phptools            => false,
      },
      :vim => {
        :extra_packages => %w{vim-scripts exuberant-ctags ack-grep htop}
      },
      :domain => [],
      :openldap => {}
    })
  end

end
