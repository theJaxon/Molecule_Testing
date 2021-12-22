# Molecule_Testing
Creating ansible roles using molecules to support different platforms.

### Prerequesites
```bash
# Inslucded in bootstrap.sh script
yum install -y python3 python3-virtualenv podman 

# Create a new python Virtual Env
virtualenv molecule 

# Start using the new VENV 
source molecule/bin/activate

python3 -m pip install molecule ansible-core ansible-lint podman

python3 -m pip install "molecule[lint,podman]"

mol init role <name> --driver-name podman
```

### Changing Molecule config files 
```yaml
vi molecule/default/molecule.yml

# Enable linting 
lint: |
  set -e
  yamllint .
  ansible-lint .
```

### Frequently used commands

```bash
# Role linting
mol lint

# List Instance status 
mol list

# Use Podman to launch the configured instance
mol create

# Destroy running containers 
mol destroy

# Login inside the container 
mol login -h <name>

# Configures the instances as desired
mol converge
```

### Facts Gathering 
```yaml
# Print ansible facts related to the container 
- name: Display ansible facts
  debug: var=ansible_facts
```

```bash
# Adhoc setup module with filter
ansible <host> -m setup -a "filter=default_ipv4" -u vagrant
```

### [Working with Inventory](https://blog.emedeiros.me/archives/2019/09/20/molecule-working-with-inventory.html) 
```yaml
vi molecule/default/molecule.yml

provisioner:
  name: ansible
  inventory:
    links:
      # The file being refernced is located in molecule/default/inventory
      hosts: inventory
```


### Useful resources
- [Testing with Ansible Molecule - theurbanpenguin](https://www.youtube.com/watch?v=e3FFxKsfdSo)
- [Test Ansible Roles using Molecule and Podman](https://redhatnordicssa.github.io/test-ansible-role-molecule-podman)
- [Using Molecule for Testing Ansible Roles](https://rdbreak.com/?p=164)
- Containers used with Molecule for testing
  - [geerlingguy/docker-centos8-ansible](https://github.com/geerlingguy/docker-centos8-ansible)
  - [geerlingguy/docker-ubuntu2004-ansible](https://github.com/geerlingguy/docker-ubuntu2004-ansible)