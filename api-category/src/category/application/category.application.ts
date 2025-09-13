import { Injectable } from '@nestjs/common';
import { InjectRepository } from '@nestjs/typeorm';
import { Repository } from 'typeorm';
import { Category } from '../domain/entities/category.entity';
import { KafkaProducerRepository } from 'src/kafka/infra/kafka.repository';

@Injectable()
export class CategoryApplication {
    constructor(
        @InjectRepository(Category)
        private readonly categoryRepository: Repository<Category>,
        private readonly kafkaProducerRepository: KafkaProducerRepository
    ) {}

    async create(name: string): Promise<Category> {
        const category = this.categoryRepository.create({ name });
        const newCategory = await this.categoryRepository.save(category);
        await this.kafkaProducerRepository.sendMessage('category-created', category);
        return newCategory;
    }

    async findAll(): Promise<Category[]> {
        
        return await this.categoryRepository.find();
    }

    async findById(id: number): Promise<Category | null> {
        return await this.categoryRepository.findOne({ where: { id } });
    }

    async update(id: number, name: string): Promise<Category> {
        const category = await this.findById(id);
        if (!category) {
            throw new Error('Categoria não encontrada');
        }
        
        category.name = name;
        return await this.categoryRepository.save(category);
    }

    async delete(id: number): Promise<void> {
        const category = await this.findById(id);
        if (!category) {
            throw new Error('Categoria não encontrada');
        }
        
        await this.categoryRepository.remove(category);
    }
}
