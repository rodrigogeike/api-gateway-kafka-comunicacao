import { Module } from '@nestjs/common';
import { TypeOrmModule } from '@nestjs/typeorm';
import { Category } from './entities/category.entity';
import { CategoryApplication } from './application/category.application';
import { CategoryPresentation } from './presentation/category.presatation';
import { CategoryRepository } from './infra/category.repository';
import { KafkaProducerRepository } from 'src/kafka/infra/kafka.repository';
import { KafkaModule } from 'src/kafka/kafka.module';


@Module({
    imports: [TypeOrmModule.forFeature([Category]), KafkaModule],
    providers: [CategoryApplication, CategoryRepository],
    controllers: [CategoryPresentation]
})
export class CategoryModule {}
