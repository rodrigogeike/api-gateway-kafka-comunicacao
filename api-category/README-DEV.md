# 🚀 Ambiente de Desenvolvimento

Este documento explica como configurar e executar o ambiente de desenvolvimento da API de Categorias.

## 📋 Pré-requisitos

- Docker Desktop instalado e rodando
- Docker Compose instalado
- Git instalado

## 🛠️ Configuração Inicial

### 1. Clone o repositório
```bash
git clone <url-do-repositorio>
cd api-category
```

### 2. Criar rede Docker (se não existir)
```bash
docker network create category01
```

## 🚀 Iniciando o Ambiente

### Opção 1: Script Automático (Recomendado)

**Linux/Mac:**
```bash
chmod +x start-dev.sh
./start-dev.sh
```

**Windows (PowerShell):**
```powershell
.\start-dev.ps1
```

### Opção 2: Comandos Manuais

```bash
# Construir e iniciar containers
docker-compose -f docker-compose.dev.yml up --build

# Para executar em background
docker-compose -f docker-compose.dev.yml up --build -d
```

## 📱 Acessos

- **API NestJS**: http://localhost:3010
- **Adminer (Banco de dados)**: http://localhost:8080
- **PostgreSQL**: localhost:5432

### Credenciais do Banco
- **Database**: nestjs
- **Usuário**: pguser
- **Senha**: pgpassword

## 🔧 Comandos Úteis

### Parar o ambiente
```bash
docker-compose -f docker-compose.dev.yml down
```

### Ver logs
```bash
docker-compose -f docker-compose.dev.yml logs -f app-category-dev
```

### Acessar container da aplicação
```bash
docker-compose -f docker-compose.dev.yml exec app-category-dev sh
```

### Reinstalar dependências
```bash
docker-compose -f docker-compose.dev.yml exec app-category-dev npm install
```

## 🔄 Hot Reload

O ambiente de desenvolvimento está configurado com hot reload. Qualquer alteração no código fonte será automaticamente refletida na aplicação.

## 🐛 Debugging

Para debugar a aplicação, você pode:

1. Acessar os logs em tempo real:
```bash
docker-compose -f docker-compose.dev.yml logs -f app-category-dev
```

2. Verificar o status dos containers:
```bash
docker-compose -f docker-compose.dev.yml ps
```

## 📁 Estrutura de Volumes

- `.:/usr/src/app` - Código fonte (hot reload)
- `/usr/src/app/node_modules` - Dependências do Node.js
- `./.docker/pgsql/dbdata:/var/lib/postgresql/data` - Dados do PostgreSQL

## 🚨 Solução de Problemas

### Erro de Conexão com Banco de Dados
Se você ver o erro `ECONNREFUSED` ou `Unable to connect to the database`, isso significa que a aplicação está tentando conectar ao banco antes dele estar pronto. O ambiente já está configurado para resolver isso automaticamente com:
- Healthcheck do PostgreSQL
- Script de espera (`wait-for-db.sh`)
- Dependências configuradas corretamente

### Porta já em uso
Se a porta 3010 estiver em uso, altere no `docker-compose.dev.yml`:
```yaml
ports:
  - "3011:3000"  # Mude para outra porta
```

### Problemas de permissão (Linux/Mac)
```bash
sudo chown -R $USER:$USER .docker/
```

### Limpar cache do Docker
```bash
docker system prune -a
```

### Verificar logs do banco
```bash
docker-compose -f docker-compose.dev.yml logs pgsql-category01
```

## 📝 Notas

- O ambiente usa Node.js 22 Alpine para melhor performance
- Todas as dependências são instaladas automaticamente
- O hot reload está configurado para desenvolvimento
- O banco de dados PostgreSQL é persistido em `.docker/pgsql/dbdata` 