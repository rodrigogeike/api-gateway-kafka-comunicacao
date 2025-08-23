#!/bin/bash

echo "🚀 Iniciando ambiente de desenvolvimento..."

# Verificar se a rede Docker existe
if ! docker network ls | grep -q "category01"; then
    echo "📡 Criando rede Docker 'category01'..."
    docker network create category01
fi

# Parar containers existentes se estiverem rodando
echo "🛑 Parando containers existentes..."
docker-compose -f docker-compose.dev.yml down

# Construir e iniciar containers
echo "🔨 Construindo e iniciando containers..."
docker-compose -f docker-compose.dev.yml up --build

echo "✅ Ambiente de desenvolvimento iniciado!"
echo "📱 API disponível em: http://localhost:3010"
echo "🗄️  Adminer disponível em: http://localhost:8080"
echo "🐘 PostgreSQL disponível em: localhost:5432" 