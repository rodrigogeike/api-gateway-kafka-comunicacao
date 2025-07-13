# Base image
FROM node:22-alpine

# Create app directory
WORKDIR  /usr/src/app

# Instalar dependências globais necessárias
RUN npm install -g @nestjs/cli nodemon

# A wildcard is used to ensure both package.json AND package-lock.json are copied
COPY package*.json ./

# Instalar dependências
RUN npm install

# Install app dependencies
RUN npm i --save @nestjs/cli
RUN npm i --save @nestjs/core @nestjs/common
RUN npm i --save typeorm @nestjs/typeorm pg
RUN npm i --save bcrypt
RUN npm i --save class-validator class-transformer
RUN npm i --save kafkajs
RUN npm install @nestjs/microservices




# Bundle app source
COPY . .

# Creates a "dist" folder with the production build
EXPOSE 3000

# Start the server using the production build

CMD ["npm", "run", "start:dev"] 

