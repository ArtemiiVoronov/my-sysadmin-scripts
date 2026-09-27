# Dockerfile — multi-stage build + HTTP-сервер

# ===== Stage 1: Builder =====
FROM ubuntu:24.04 AS builder

# Копируем скрипт
COPY script.sh /usr/local/bin/script.sh

# Проверяем синтаксис
RUN bash -n /usr/local/bin/script.sh

# ===== Stage 2: Final =====
FROM alpine:3.20

# Устанавливаем bash и python3
RUN apk add --no-cache bash python3

# Копируем скрипт из builder
COPY --from=builder /usr/local/bin/script.sh /usr/local/bin/script.sh

# Делаем исполняемым
RUN chmod +x /usr/local/bin/script.sh

# Рабочая директория (откуда python будет отдавать файлы)
WORKDIR /tmp/setup-script

# Запускаем скрипт в фоне + HTTP-сервер на 8080
CMD ["/bin/bash", "-c", "/usr/local/bin/script.sh docker-user & python3 -m http.server 8080"]
