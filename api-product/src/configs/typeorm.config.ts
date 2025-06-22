import { TypeOrmModuleOptions } from '@nestjs/typeorm';

export const typeOrmConfig: TypeOrmModuleOptions = {
  type: 'postgres',
  host: 'localhost',
  port: 5435,
  username: 'pguser',
  password: 'pgpassword',
  database: 'products',
  entities: [__dirname + '/../**/*.entity.{js,ts}'],
  synchronize: true,
};



