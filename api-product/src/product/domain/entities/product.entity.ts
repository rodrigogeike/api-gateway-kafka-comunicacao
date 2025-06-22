import { Entity, Column, PrimaryGeneratedColumn } from 'typeorm';



@Entity('products')
export class Product {

    @PrimaryGeneratedColumn()
    id: number;


    @Column({ nullable: true })
    description: string;

   
    @Column({ type: 'timestamp', default: () => 'CURRENT_TIMESTAMP' })
    createdAt: Date;

    @Column({ type: 'timestamp', default: () => 'CURRENT_TIMESTAMP', onUpdate: 'CURRENT_TIMESTAMP' })
    updatedAt: Date;

}