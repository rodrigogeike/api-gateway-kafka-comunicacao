Write-Host "🚀 Iniciando ambiente de desenvolvimento..." -ForegroundColor Green

# Verificar se a rede Docker existe
if (-not (docker network ls | Select-String "category01")) {
    Write-Host "📡 Criando rede Docker 'category01'..." -ForegroundColor Yellow
    docker network create category01
}

# Parar containers existentes se estiverem rodando
Write-Host "🛑 Parando containers existentes..." -ForegroundColor Yellow
docker-compose -f docker-compose.dev.yml down

# Construir e iniciar containers
Write-Host "🔨 Construindo e iniciando containers..." -ForegroundColor Yellow
docker-compose -f docker-compose.dev.yml up --build

Write-Host "✅ Ambiente de desenvolvimento iniciado!" -ForegroundColor Green
Write-Host "📱 API disponível em: http://localhost:3010" -ForegroundColor Cyan
Write-Host "🗄️  Adminer disponível em: http://localhost:8080" -ForegroundColor Cyan
Write-Host "🐘 PostgreSQL disponível em: localhost:5432" -ForegroundColor Cyan 