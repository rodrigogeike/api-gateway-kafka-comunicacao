import { TypeOrmModuleOptions } from '@nestjs/typeorm';

export const typeOrmConfig: TypeOrmModuleOptions = {
  type: 'postgres',
  host: 'localhost',
  port:  5432,
  username: process.env.DB_USERNAME || 'pguser',
  password: process.env.DB_PASSWORD || 'pgpassword',
  database: process.env.DB_DATABASE || 'nestjs',
  entities: [__dirname + '/../**/*.entity.{js,ts}'],
  synchronize: false,
  logging: process.env.NODE_ENV === 'development',
  retryAttempts: 10,
  retryDelay: 3000,
};



