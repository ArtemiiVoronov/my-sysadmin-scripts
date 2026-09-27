# Dockerfile — multi-stage build

# ===== Stage 1: Builder =====
FROM ubuntu:24.04 AS builder

# Копируем скрипт
COPY script.sh /usr/local/bin/script.sh

# Проверяем синтаксис
RUN bash -n /usr/local/bin/script.sh

# ===== Stage 2: Final =====
FROM alpine:3.20

# Устанавливаем bash
RUN apk add --no-cache bash

# Копируем скрипт из builder
COPY --from=builder /usr/local/bin/script.sh /usr/local/bin/script.sh

# Делаем исполняемым
RUN chmod +x /usr/local/bin/script.sh

# Команда запуска
CMD ["/usr/local/bin/script.sh", "docker-user"]
