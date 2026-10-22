# MjolnirOS

MjolnirOS est une ISO live basée sur Arch Linux, construite de zéro avec
[archiso](https://wiki.archlinux.org/title/Archiso) à partir du profil officiel `releng`.
Le projet est reproductible : tout ce qui compose l'ISO est versionné dans ce dépôt.

> v0.1 — ISO live en ligne de commande, testée en VM UEFI sous Proxmox VE.

## Ce que MjolnirOS change par rapport à `releng`

| Élément | releng | MjolnirOS |
|---|---|---|
| Nom / label | `archlinux` / `ARCH_AAAAMM` | `mjolnir` / `MJOLNIR_AAAAMM` |
| Menus de boot | Arch Linux install medium | MjolnirOS live |
| Hostname | `archiso` | `mjolnir` |
| Shell root | zsh | fish (+ fastfetch au login) |
| Clavier console | US | FR (AZERTY) |
| Paquets ajoutés | — | fish, git, snapper, fastfetch, htop |
| motd | guide d'installation Arch | bannière MjolnirOS |

L'historique Git commence par l'import brut de `releng` (archiso 91), donc
`git diff` depuis le premier commit montre exactement toutes les personnalisations.

## Construire l'ISO

Sur une machine Arch Linux, en root :

```fish
pacman -S --needed archiso git
git clone https://github.com/paulpuxeddu1944-ops/mjolnir-iso.git
cd mjolnir-iso
mkarchiso -v -w /tmp/mjolnir-work -o out .
```

L'ISO sort dans `out/mjolnir-AAAA.MM.JJ-x86_64.iso`. Le répertoire de travail
`/tmp/mjolnir-work` peut être supprimé après le build.

## Tester

L'ISO boote en UEFI (systemd-boot) et en BIOS (syslinux). Environnement de test
utilisé : VM Proxmox VE, machine `q35`, firmware OVMF, Secure Boot désactivé.

## Environnement de build

Une VM Arch dédiée (`forge-mjolnir`) sur un hôte Proxmox VE :
q35 + OVMF, 4 vCPU, 4 Go de RAM, disque 40 Go Btrfs.

## Feuille de route

- **v0.1** : ISO live CLI qui boote en VM UEFI
- **v0.2** : installeur par profils (config JSON d'archinstall), build automatique via GitHub Actions
- **Plus tard** : variante durcie (`linux-hardened`, AppArmor), profils de bureau XFCE / KDE, tests sur matériel réel

## Licence

Profil dérivé de `releng` d'[archiso](https://gitlab.archlinux.org/archlinux/archiso) (GPL-3.0-or-later).
