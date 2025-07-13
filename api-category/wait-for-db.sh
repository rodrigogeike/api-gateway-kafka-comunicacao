#!/bin/bash

echo "⏳ Aguardando PostgreSQL estar pronto..."

# Aguardar até o PostgreSQL estar disponível
until pg_isready -h pgsql-category01 -p 5432 -U pguser -d nestjs; do
  echo "📡 PostgreSQL ainda não está pronto. Aguardando..."
  sleep 2
done

echo "✅ PostgreSQL está pronto!"

# Executar o comando passado como argumento
exec "$@" 