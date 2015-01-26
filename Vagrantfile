# -*- mode: ruby -*-
# vi: set ft=ruby :

VAGRANTFILE_API_VERSION = '2'

Vagrant.require_version '>= 1.5.0'

Vagrant.configure(VAGRANTFILE_API_VERSION) do |config|
  config.vm.hostname = 'mediawiki-berkshelf'

  if Vagrant.has_plugin?('vagrant-cachier')
    config.cache.auto_detect = true
    config.cache.scope = :box
  end
  config.hostmanager.enabled = true
  config.hostmanager.manage_host = true
  config.hostmanager.ignore_private_ip = false
  config.hostmanager.include_offline = true
  config.hostmanager.aliases = %w(local.dev mediawiki.dev)

  config.omnibus.chef_version = '11.16.4'
  config.vm.box = 'ubuntu-14.04-chef'
  config.vm.network :private_network, ip: '172.28.128.3'
  config.berkshelf.enabled = true

  config.vm.provision :chef_solo do |chef|
    chef.json = {
      mediawiki: {
        domain: 'mediawiki.dev',
        title: 'my_title',
        lang: 'en'
      }
    }

    chef.run_list = [
      'recipe[apt::default]',
      'recipe[mediawiki::database]',
      'recipe[mediawiki::apps]'
    ]
  end
end
