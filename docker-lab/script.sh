#!/bin/bash

# Setup-скрипт: создаёт директорию пользователя, .bashrc и пишет в лог

BASE_DIR="${SETUP_BASE_DIR:-/tmp/setup-script}"
USERNAME="$1"
USER_DIR="$BASE_DIR/$USERNAME"
LOG_FILE="$USER_DIR/setup.log"

# Проверяем, что имя передано

if [ -z "$USERNAME" ]
then
    echo "Ошибка: укажите имя пользователя"
    echo "Использование: $0 <username>"
    exit 1
fi

#Проверяем существование директории

if [ -d "$USER_DIR" ]
then
    echo "Ошибка: директория $USER_DIR уже существует"
    exit
fi

# Создаём базовую директорию
mkdir -p "$USER_DIR" || { echo "Ошибка: не удалось создать директори $USER_DIR"; exit1; }

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
