import { Injectable } from '@nestjs/common';
import { InjectRepository } from '@nestjs/typeorm';
import { Repository } from 'typeorm';
import { Category } from '../domain/entities/category.entity';

@Injectable()
export class CategoryRepository {
    constructor(
        @InjectRepository(Category)
        private readonly repository: Repository<Category>,
    ) {}

    async create(category: Partial<Category>): Promise<Category> {
        const newCategory = this.repository.create(category);
        return await this.repository.save(newCategory);
    }

    async findAll(): Promise<Category[]> {
        return await this.repository.find();
    }

    async findById(id: number): Promise<Category | null> {
        return await this.repository.findOne({ where: { id } });
    }

    async update(id: number, category: Partial<Category>): Promise<Category | null> {
        await this.repository.update(id, category);
        return await this.findById(id);
    }

    async delete(id: number): Promise<void> {
        await this.repository.delete(id);
    }
}
