# @MarauderXtreme local_system

This is a "small" ansible role to help me, set up my local system and make it configurable.

There are some configs and files baked (a.k.a hard-coded) into this role that I consider useful.
Please use this at your own discretion.
It is currently used for a KDE Neon system but should be usable against any debian-based system and easily adoptable for other distributions.

## Requirements

There is a chicken'n'egg flaw in the role.
The role [prepares][prepare] the system with `become: yes` but only in those tasks writes sudoers with `NOPASSWD:`.
You should prevent errors by editing sudoers or copying [sudoers][sudoers] to `/etc/sudoers`.

[prepare]: tasks/prepare.yml
[sudoers]: files/sudoers

## Role Variables

For all variables there are a [defaults/main/*][defaults] defined.
All variables are prefixed with the role name `local_system` to prevent overlaps in naming.
With overriding them in group or host vars it's possible to define own setups.

- [`main.yml`][main]
  - `nodejs_install_npm_user`
    - needed by `geerlingguy.nodejs`
    - set to `root`
  - `local_system_uppercase_folders`
    - list of uppercase folder names under `~` that need to be translated to lower-case
  - `local_system_projects_paths`
    - list of various project paths/directories
  - `local_system_paths_unshorten`
    - list of directories that should not be shortened by p10k path prompt
- [`packages.yml`][packages]
  - `local_system_general_packages`
    - list of packages that should be on every system
  - `local_system_debian_packages`
    - list of packages only relevant on debian-based systems
  - `local_system_ppa_packages`
    - list of useful packages that come from launchpad ppas only
- [`ppas.yml`][ppas]
  - `local_system_ppa`
    - list of launchpad ppas in the schema of `ppa:USER/PPA`
- [`extra_software.yml`][extra-software]
  - `local_system_ubuntu_keyserver: keyserver.ubuntu.com`
    - configurable ubuntu keyserver
  - `local_system_extra_software.ubuntu`
    - list of configuration for ppas not located at launchpad
    - Everything needs to be done manually
    - Two ways of setup
      - example entry for key from url

        ```yml
        - name: signal
          url: https://updates.signal.org/desktop/apt/keys.asc
          id: DBA36B5181D0C816F630E889D980A17457F6FB06
          repo: deb [arch=amd64] https://updates.signal.org/desktop/apt xenial main
          package: signal-desktop
        ```

      - example entry key from keyserver

        ```yml
        - name: teamviewer
          keyserver: "{{ local_system_ubuntu_keyserver }}"
          id: 8CAE012EBFAC38B17A937CD8C5E224500C1289C0
          repo: deb http://linux.teamviewer.com/deb
          package: teamviewer
        ```

- [`git.yml`][git]
  - `local_system_gitconfig`
    - list of useful general gitconfig
  - `local_system_diff_so_fancy_gitconfig`
    - list of gitconfig for diff-so-fancy
- [`pip.yml`][pip]
  - `local_system_pip`
    - list of pip packages that are installed to the user dir
    - currently `thefuck` and `powerline-status`
- [`versions.yml`][versions]
  - nearly all those variables act as control mechanism
  - set them to false if you don't want to install/use certain things
  - I'm watching all those repos via gitpunch to update them
  - `local_system_omz`
    - [oh-my-zsh][omz] branch/tag/version
  - `local_system_omz_p10k`
    - [powerlevel10k][p10k] branch/tag/version
  - `local_system_omz_autosuggests`
    - [fish-like autosuggestions for zsh][as] branch/tag/version
  - `local_system_bat`
    - [bat][bat] branch/tag/version
  - `local_system_dsf`
    - [diff-so-fancy][dsf] branch/tag/version
  - `local_system_fzf`
    - [fzf][fzf] branch/tag/version
  - `local_system_genact`
    - [genact][genact] branch/tag/version
  - `local_system_prettyping`
    - [prettyping][prettyping] branch/tag/version
  - `local_system_firacode`
    - [firacode][firacode] branch/tag/version or `"package"` for distro release
  - `local_system_iosevka`
    - [iosevka][iosevka] tag/version
  - `local_system_unifraktur`
    - [Unifraktur Maguntia][unifraktur] version
  - `local_system_nerdfonts`
    - list of [nerdfonts][nerdfonts] to install
  - `local_system_rambox`
    - either `pro` or `ce` depending what you want
  - `local_system_ramboxce`
    - [Rambox Community Edition][ramboxce] tag/version
  - `local_system_ramboxpro`
    - [Rambox Pro][ramboxpro] tag/version

[defaults]: defaults/main
[extra-software]: defaults/main/extra_software.yml
[git]: defaults/main/git.yml
[main]: defaults/main/main.yml
[packages]: defaults/main/packages.yml
[pip]: defaults/main/pip.yml
[ppas]: defaults/main/ppas.yml
[versions]: defaults/main/versions.yml
[omz]: https://github.com/ohmyzsh/ohmyzsh
[p10k]: https://github.com/romkatv/powerlevel10k
[as]: https://github.com/zsh-users/zsh-autosuggestions
[bat]: https://github.com/sharkdp/bat
[dsf]: https://github.com/so-fancy/diff-so-fancy
[fzf]: https://github.com/junegunn/fzf
[genact]: https://github.com/svenstaro/genact
[prettyping]: https://github.com/denilsonsa/prettyping
[firacode]: https://github.com/tonsky/FiraCode
[iosevka]: https://github.com/be5invis/Iosevka
[unifraktur]: https://sourceforge.net/projects/unifraktur
[nerdfonts]: https://github.com/ryanoasis/nerd-fonts
[ramboxce]: https://github.com/ramboxapp/community-edition
[ramboxpro]: https://github.com/ramboxapp/download

## Example Playbook

```yml
- hosts: localhost
  roles:
      - local_system
```

## License

MIT

## Author Information

Christoph Kepler <development@kepler.international>

## Is it any good

[Yes][any-good]

[any-good]: https://news.ycombinator.com/item?id=3067434
