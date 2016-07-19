# -*- mode: ruby -*-
# vi: set ft=ruby :

Vagrant.configure("2") do |config|
  host = RbConfig::CONFIG['host_os']

  if host =~ /darwin/
    cpus = `sysctl -n hw.ncpu`.to_i
  elsif host =~ /mswin|mingw|cygwin/
    cpus = `wmic computersystem Get NumberOfLogicalProcessors`.split[1].to_i
  elsif host =~ /linux/
    cpus = `nproc`.to_i
  else
    cpus = 1
  end

  config.vm.box = "debian/contrib-jessie64"

  config.vm.network "forwarded_port", guest: 8000, host: 8001
  config.vm.synced_folder ".", "/home/vagrant/django_mysql_fields", owner: 'vagrant', group: 'vagrant'

  config.ssh.forward_agent = true

  config.vm.provision :shell, :path => "_vagrant/vagrant_install.sh"
  config.vm.provision :shell, :privileged => false, :path => "_vagrant/django_install.sh"

  config.vm.provider :virtualbox do |virtualbox|
    virtualbox.customize ["modifyvm", :id, "--memory", "2048"]
    virtualbox.customize ["modifyvm", :id, "--cpus", cpus]
    virtualbox.customize ["modifyvm", :id, "--nictype1", "virtio"]
  end
end
