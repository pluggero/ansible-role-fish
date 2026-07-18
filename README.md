# Ansible Role: fish shell

[![CI](https://github.com/pluggero/ansible-role-fish/actions/workflows/ci.yml/badge.svg)](https://github.com/pluggero/ansible-role-fish/actions/workflows/ci.yml) [![Ansible Galaxy downloads](https://img.shields.io/ansible/role/d/pluggero/fish?label=Galaxy%20downloads&logo=ansible&color=%23096598)](https://galaxy.ansible.com/ui/standalone/roles/pluggero/fish)

An Ansible Role that installs a basic configuration of fish shell.

## Requirements

None.

## Role Variables

Available variables are listed below, along with default values (see `defaults/main.yml`):

```yaml
fish_version: "x.x"
```

The version of fish to install can be defined in the variable `fish_version`.

```yaml
fish_install_method: "dynamic"
```

The method used to install fish can be defined in the variable `fish_install_method`.
The following methods are available:

- `source`: Installs fish from source
- `package`: Installs fish from the package manager of the distribution
  - **NOTE**: This method installs the latest version available in the package manager and not the version defined in `fish_version`.
- `dynamic`: Installs fish from package manager if available in the correct version, otherwise installs from source

```yaml
fish_env_files:
  - "{{ ansible_env.HOME }}/.env_vars"
```

Set environment files for the fish shell that are sourced with the `fish_env_files` variable.

```yaml
fish_env_variables:
  - name: example
    value: "example"
```

Set environment variables for the fish shell with the `fish_env_variables` variable.

```yaml
fish_abbreviations:
  - name: example
    value: "example"
```

Set abbreviations for the fish shell with the `fish_abbreviations` variable.

```yaml
fish_aliases:
  - name: example
    value: "example"
```

Set aliases for the fish shell with the `fish_aliases` variable.

```yaml
fish_colors:
  - name: fish_color_command
    value: "blue"
```

Set fish color variables with the `fish_colors` variable (`name` is the full variable name, e.g. `fish_color_command` or `fish_pager_color_prefix`). See `defaults/main.yml` for the full list of available `fish_color_*` / `fish_pager_color_*` variables. The template does not validate `name` — any variable fish recognizes (including future ones) works without role changes.

```yaml
fish_enable_vim_mode: false
```

Enable vim mode for the fish shell with the `fish_enable_vim_mode` variable.

```yaml
fish_keybindings:
  - key: \co
    function: "example"
```

Set keybindings for the fish shell with the `fish_keybindings` variable.

```yaml
fish_functions:
  - name: example
    description: "example"
    command: "example"
```

Set functions for the fish shell with the `fish_functions` variable.

```yaml
fish_prompt_enabled: true
```

Enable or disable the custom fish prompt with the `fish_prompt_enabled` variable. When `false`, no `fish_prompt.fish` is deployed and fish falls back to its own built-in prompt.

```yaml
fish_prompt_custom: |
  echo -n "> "
```

Set the body of the `fish_prompt` function with the `fish_prompt_custom` variable. The role has no default prompt of its own — when left empty, fish uses its own built-in prompt.

```yaml
fish_login_shell_commands:
  - exec /usr/bin/sway
```

Set login shell commands for the fish shell with the `fish_login_shell_commands` variable.

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
