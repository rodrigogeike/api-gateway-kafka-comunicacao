import { Controller, Get, Post, Put, Delete, Body, Param } from '@nestjs/common';
import { CategoryApplication } from '../application/category.application';
import { Category } from '../domain/entities/category.entity';

@Controller('categories')
export class CategoryPresentation {
    constructor(private readonly categoryApplication: CategoryApplication) {}

    @Post()
    async create(@Body('name') name: string): Promise<Category> {
        return await this.categoryApplication.create(name);
    }

    @Get()
    async findAll(): Promise<Category[]> {
        return await this.categoryApplication.findAll();
    }

    @Get(':id')
    async findById(@Param('id') id: number): Promise<Category> {
        const category = await this.categoryApplication.findById(id);
        if (!category) {
            throw new Error('Categoria não encontrada');
        }
        return category;
    }

    @Put(':id')
    async update(
        @Param('id') id: number,
        @Body('name') name: string
    ): Promise<Category> {
        return await this.categoryApplication.update(id, name);
    }

    @Delete(':id')
    async delete(@Param('id') id: number): Promise<void> {
        await this.categoryApplication.delete(id);
    }
}
