# -*- mode: ruby -*-
# vi: set ft=ruby :

# Vagrantfile API/syntax version. Don't touch unless you know what you're doing!
VAGRANTFILE_API_VERSION = "2"

Vagrant.configure(VAGRANTFILE_API_VERSION) do |config|

  config.vm.box = "chef/fedora-20"

  if Vagrant.has_plugin?("vagrant-proxyconf") && false
    # use with polipo statusbar
    config.yum_proxy.http  = "http://10.0.2.2:3128"
    config.proxy.http  = "http://10.0.2.2:3128"
    config.proxy.no_proxy = "localhost,127.0.0.1,10.0.2.2"
  end

end
