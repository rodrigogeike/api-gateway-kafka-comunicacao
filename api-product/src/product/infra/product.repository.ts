import { Injectable } from '@nestjs/common';
import { InjectRepository } from '@nestjs/typeorm';
import { Repository } from 'typeorm';
import { Product } from '../domain/entities/product.entity';

@Injectable()
export class ProductRepository {
    constructor(
        @InjectRepository(Product)
        private readonly repository: Repository<Product>,
    ) {}

    async create(product: Partial<Product>): Promise<Product> {
        const novoProduto = this.repository.create(product);
        return await this.repository.save(novoProduto);
    }

    async findAll(): Promise<Product[]> {
        return await this.repository.find();
    }

    async findById(id: number): Promise<Product | null> {
        return await this.repository.findOne({ where: { id } });
    }

    async update(id: number, product: Partial<Product>): Promise<Product | null> {
        await this.repository.update(id, product);
        return await this.findById(id);
    }

    async delete(id: number): Promise<void> {
        await this.repository.delete(id);
    }
}
