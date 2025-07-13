import { Inject, Injectable } from "@nestjs/common";
import { ClientKafka } from "@nestjs/microservices";
import { json } from "stream/consumers";


@Injectable()
export class KafkaProducerRepository {

    constructor(
        @Inject('CATEGORY_SERVICE')
        private readonly kafkaClient: ClientKafka,
      ) {}
    
      async sendMessage(topic: string, message: any) {
        return this.kafkaClient.emit(topic, JSON.stringify(message));
      }


    
}