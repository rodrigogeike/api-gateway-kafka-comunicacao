import { Module } from '@nestjs/common';
import { TypeOrmModule } from '@nestjs/typeorm';
import { Category } from './entities/category.entity';
import { CategoryApplication } from './application/category.application';
import { CategoryPresentation } from './presentation/category.presatation';
import { CategoryRepository } from './infra/category.repository';


@Module({
    imports: [TypeOrmModule.forFeature([Category])],
    providers: [CategoryApplication, CategoryRepository],
    controllers: [CategoryPresentation]
})
export class CategoryModule {}
