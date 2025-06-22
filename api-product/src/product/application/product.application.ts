import { Injectable } from "@nestjs/common";
import { Product } from "../domain/entities/product.entity";
import { InjectRepository } from "@nestjs/typeorm";
import { Repository } from "typeorm";

@Injectable()
export class ProductApplication {


    constructor(
        @InjectRepository(Product)
        private readonly productRepository: Repository<Product>,) {}

    async criarProduto(dados: Partial<any>): Promise<any> {
        return await this.productRepository.create(dados);
    }

    // async listarProdutos(): Promise<any[]> {
    //     return await this.productRepository.findAll();
    // }

    // async buscarProdutoPorId(id: number): Promise<any | null> {
    //     return await this.productRepository.findOne(id);
    // }

    async atualizarProduto(id: number, dados: Partial<any>): Promise<any | null> {
        return await this.productRepository.update(id, dados);
    }

    async deletarProduto(id: number): Promise<void> {
        await this.productRepository.delete(id);
    }
    
} 