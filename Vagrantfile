# -*- mode: ruby -*-
# vi: set ft=ruby :

VAGRANTFILE_API_VERSION = "2"

Vagrant.configure(VAGRANTFILE_API_VERSION) do |config|
  config.vm.box = "chef/ubuntu-14.04"
  config.vm.network "private_network", ip: "33.33.33.7"

  config.vm.provision :ansible do |ansible|
    ansible.playbook = "playbooks/playbook.yml"
    ansible.extra_vars = {
      :omekadir     => '/var/www/omeka',
      :omekaversion => '2.1-stable',
      :debug        => false,
      :hostname     => 'localhost',
    }
  end
end
