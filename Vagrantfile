Vagrant.configure("2") do |config|
  config.vm.box = "bento/centos-8.2"
  config.vm.hostname = "MoleculeTesting"
  config.vm.box_check_update = false
  config.vm.network "private_network", ip: "192.168.50.100"
  config.vm.synced_folder ".", "/vagrant", type: "rsync"
  config.vm.provision "shell", path: "Scripts/bootstrap.sh"
  config.vm.provision "shell", path: "Scripts/docker.sh"
  config.vm.provision "shell", path: "Scripts/ansible.sh"
end
