Vagrant.configure("2") do |config|
  config.vm.box = "bento/almalinux-8"
  config.vm.hostname = "Molecule"
  config.vm.box_check_update = false
  config.vm.network "private_network", ip: "192.168.50.100"
  config.vm.synced_folder ".", "/vagrant", type: "rsync"
  config.vm.provision "shell", path: "Scripts/bootstrap.sh"
end
