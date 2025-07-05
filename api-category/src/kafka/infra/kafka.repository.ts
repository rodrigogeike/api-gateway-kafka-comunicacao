import { Inject, Injectable } from "@nestjs/common";
import { ClientKafka } from "@nestjs/microservices";


@Injectable()
export class KafkaProducerRepository {

    constructor(
        @Inject('CATEGORY_SERVICE')
        private readonly kafkaClient: ClientKafka,
      ) {}
    
      async sendMessage(topic: string, message: any) {
        return this.kafkaClient.emit(topic, message);
      }


    
}