# Base image
FROM node:22

# Create app directory
WORKDIR  /usr/src/app

RUN npm i -g @nestjs/cli

# A wildcard is used to ensure both package.json AND package-lock.json are copied
COPY package*.json ./

# Install app dependencies
RUN npm i --save @nestjs/cli
RUN npm i --save @nestjs/core @nestjs/common
RUN npm i --save typeorm @nestjs/typeorm pg
RUN npm i --save bcrypt
RUN npm i --save class-validator class-transformer

RUN npm install


# Bundle app source
COPY . .

# Creates a "dist" folder with the production build
EXPOSE 3000

# Start the server using the production build
CMD ["sh", "-c", "npm install && tail -f /dev/null"]