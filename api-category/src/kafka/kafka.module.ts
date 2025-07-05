import { Module } from "@nestjs/common";
import { ClientsModule, Transport } from "@nestjs/microservices";
import { KafkaProducerRepository } from "./infra/kafka.repository";

@Module({
    imports: [
      ClientsModule.register([
        {
          name: 'CATEGORY_SERVICE',
          transport: Transport.KAFKA,
          options: {
            client: {
              clientId: 'category',
              brokers: ['localhost:9092'],
            },
            consumer: {
              groupId: 'category-consumer'
            }
          }
        },
      ]),
    ],
    providers: [KafkaProducerRepository],
    exports: [KafkaProducerRepository]
  })
  export class KafkaModule {}