# MjolnirOS — config fish du live (root)

# Pas de message d'accueil fish : le motd suffit
set -g fish_greeting

if status is-login
    # Garde le support releng du paramètre noyau script= (tty1 uniquement)
    ~/.automated_script.sh
end

if status is-interactive
    alias ll 'ls -lah --color=auto'
    fastfetch
end
