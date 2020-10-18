#!/usr/bin/env bash

set -euo pipefail

/usr/bin/yakuake &

sleep 2

qdbus org.kde.yakuake /yakuake/sessions org.kde.yakuake.splitTerminalTopBottom 0
qdbus org.kde.yakuake /yakuake/sessions org.kde.yakuake.splitTerminalLeftRight 0
qdbus org.kde.yakuake /yakuake/sessions org.kde.yakuake.splitTerminalLeftRight 1

qdbus org.kde.yakuake /yakuake/sessions org.kde.yakuake.runCommandInTerminal 2 'ssh-add ~/.ssh/id_ed25519'
qdbus org.kde.yakuake /yakuake/sessions org.kde.yakuake.runCommandInTerminal 3 htop
