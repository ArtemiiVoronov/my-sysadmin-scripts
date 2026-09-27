# docker-lab

Docker-контейнер со скриптом автоматизации из ДЗ №1.

## Что делает

Скрипт создаёт директорию пользователя, файл `.bashrc` и пишет лог.

## Стек

- Docker (multi-stage build)
- Ubuntu 24.04 (builder)
- Alpine 3.20 (final)
- Bash

## Сборка

```bash
docker build -t my-script:v2 .
