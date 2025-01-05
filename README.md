# Ansible Role: fish shell

[![CI](https://github.com/pluggero/ansible-role-fish/actions/workflows/ci.yml/badge.svg)](https://github.com/pluggero/ansible-role-fish/actions/workflows/ci.yml) [![Ansible Galaxy downloads](https://img.shields.io/ansible/role/d/pluggero/fish?label=Galaxy%20downloads&logo=ansible&color=%23096598)](https://galaxy.ansible.com/ui/standalone/roles/pluggero/fish)

An Ansible Role that installs a basic configuration of fish shell.

## Requirements

None.

## Role Variables

Available variables are listed below, along with default values (see `defaults/main.yml`):

```yaml
fish_env_variables_host:
  - variable:
    name: example
    value: "example"
```

Set environment variables for the fish shell with the `fish_env_variables_host` variable.

```yaml
fish_abbreviations_host:
  - abbreviation:
    name: example
    value: "example"
```

Set abbreviations for the fish shell with the `fish_abbreviations_host` variable.

```yaml
fish_aliases_host:
  - alias:
    name: example
    value: "example"
```

Set aliases for the fish shell with the `fish_aliases_host` variable.

```yaml
fish_keybindings_host:
  - keybinding:
    key: \co
    function: "example"
```

Set keybindings for the fish shell with the `fish_keybindings_host` variable.

```yaml
fish_functions:
  - function:
    name: example
    description: "example"
    command: "example"
```

Set functions for the fish shell with the `fish_functions` variable.

## Dependencies

None.

## Example Playbook

```yaml
- hosts: all
  roles:
    - pluggero.fish
```

## License

MIT / BSD

## Author Information

This role was created in 2025 by Robin Plugge.
