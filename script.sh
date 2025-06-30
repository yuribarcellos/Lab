#!/bin/bash

# Nome da rede
NETWORK_NAME=net_infra

# Cria a rede se ela não existir
if ! docker network ls --format '{{.Name}}' | grep -q "^${NETWORK_NAME}$"; then
  echo "🔧 Criando rede Docker: ${NETWORK_NAME}"
  docker network create --driver bridge ${NETWORK_NAME}
else
  echo "✅ Rede '${NETWORK_NAME}' já existe."
fi

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

echo "🏁 Todos os serviços foram iniciados."
