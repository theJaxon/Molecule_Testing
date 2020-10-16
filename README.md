# Molecule_Testing
Creating ansible roles using molecules to support different platforms.

* It's recommended to **`vagrant reload`** after the first `vagrant up` in order to use docker without having to type sudo before any docker command.

### Molecule basic commands:
```bash
# Create a new role
molecule init role <name>

# Used for Continious Integration purposes
molecule test 

# Debug issues 
molecule --debug <test | converge>

```