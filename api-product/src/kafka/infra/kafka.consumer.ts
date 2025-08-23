import { Controller, Injectable } from '@nestjs/common';
import { MessagePattern, Payload, KafkaContext } from '@nestjs/microservices';
import { InjectRepository } from '@nestjs/typeorm';
import { Category } from 'src/category/entities/category.entity';
import { Repository } from 'typeorm';

@Controller()
export class KafkaConsumerRepository {
 

  constructor(
    @InjectRepository(Category)
    private readonly categoryRepository: Repository<Category>,
) {}
    
    @MessagePattern('category-created')
    async consumerMensagem(@Payload() mensagem: any, context: KafkaContext) {
      console.log('Mensagem recebida kafka:', mensagem);
      const newCategory = this.categoryRepository.create({name : mensagem.name})
      await this.categoryRepository.save(newCategory);
      
    }
}


     

