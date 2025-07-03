import { Module } from "@nestjs/common";
import { ClientsModule, Transport } from "@nestjs/microservices";

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
    ]
    
  })
  export class KafkaModule {}