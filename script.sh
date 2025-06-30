#!/bin/bash

# Lista de diretórios com docker-compose.yml
COMPOSE_PATHS=(
  "/root/Lab/apps/zabbix"
  "/root/Lab/apps/grafana"
  "/root/Lab/apps/glpi"
)

echo "🚀 Iniciando serviços Docker Compose..."

for path in "${COMPOSE_PATHS[@]}"; do
  echo "➡️ Subindo serviço em: $path"
  (cd "$path" && docker-compose up -d)
done

echo "✅ Todos os serviços foram iniciados."
