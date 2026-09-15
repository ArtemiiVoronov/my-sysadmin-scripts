#!/bin/bash

# Setup-скрипт: создаёт директорию пользователя, .bashrc и пишет в лог

BASE_DIR="/tmp/setup-script"
USERNAME="$1"
USER_DIR="$BASE_DIR/$USERNAME"
LOG_FILE="setup.log"

# Создаём базовую директорию
mkdir -p "$USER_DIR"

# Создаём .bashrc с алиасами
cat > "$USER_DIR/.bashrc" << 'EOF'
alias ll='ls -la'
alias ..='cd ..'
export PS1='\u@\h:\w\$ '
EOF

# Приветствие
echo "==================================="
echo "Пользователь $USERNAME успешно создан!"
echo "Директория: $USER_DIR"
echo "==================================="

# Логируем
echo "$(date '+%Y-%m-%d %H:%M:%S') - Создан пользователь $USERNAME, директория: $USER_DIR" >> "$LOG_FILE"
