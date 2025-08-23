import { Module } from '@nestjs/common';
import { ClientsModule, Transport } from '@nestjs/microservices';
import { TypeOrmModule } from '@nestjs/typeorm';
import { CategoryModule } from 'src/category/category.module';
import { Category } from 'src/category/entities/category.entity';
import { KafkaConsumerRepository } from './infra/kafka.consumer';



@Module({
  imports: [
    ClientsModule.register([
      {
        name: 'PRODUCT_CONSUMER',
        transport: Transport.KAFKA,
        options: {
          client: {
            brokers: ['localhost:9092'], // ajuste para seu broker
          },
          consumer: {
            groupId: 'category-consumer', // ajuste para seu grupo
          },
          producer: {
            createPartitioner: 'LegacyPartitioner'
          } as any
        },
      },
    ]),
    TypeOrmModule.forFeature([Category]),
    CategoryModule,
  ],
  controllers: [KafkaConsumerRepository],
})
export class KafkaModule {}