import { Module } from '@nestjs/common';
import { TypeOrmModule } from '@nestjs/typeorm';
import { Product } from './domain/entities/product.entity';
import { ProductApplication } from './application/product.application';
import { ProductRepository } from './infra/product.repository';
import { ProductPresentation } from './presentation/product.presentation';


@Module({
    imports: [TypeOrmModule.forFeature([Product])],
    providers: [ProductApplication, ProductRepository],
    controllers: [ProductPresentation]
})
export class ProductModule {}