bash
#!/bin/bash

# Caminhos dos arquivos docker-compose.yml
ZABBIX_COMPOSE=/apps/zabbix/docker-compose.yml
GLPI_COMPOSE=/apps/glpi/docker-compose.yml
GRAFANA_COMPOSE=/apps/grafana/docker-compose.yml

# Função para subir os contêineres
subir_containers() {
  echo "Subindo contêineres..."
  
  # Zabbix
  echo "Subindo Zabbix..."
  docker-compose -f $ZABBIX_COMPOSE up -d
  
  # GLPI
  echo "Subindo GLPI..."
  docker-compose -f $GLPI_COMPOSE up -d
  
  # Grafana
  echo "Subindo Grafana..."
  docker-compose -f $GRAFANA_COMPOSE up -d
  
  echo "Todos os contêineres foram iniciados."
}

# Chamar a função
subir_containers
