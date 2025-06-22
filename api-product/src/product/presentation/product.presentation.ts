import { Body, Controller, Delete, Get, Param, Post, Put } from "@nestjs/common";
import { ProductApplication } from "../application/product.application";
import { Product } from "../domain/entities/product.entity";


@Controller('product')
export class ProductPresentation {
    constructor(private readonly productApplication: ProductApplication) {}

    @Post()
    async create(@Body() dados: Partial<Product>): Promise<Product> {
        return await this.productApplication.criarProduto(dados);
    }

    // @Get()
    // async listar(): Promise<Product[]> {
    //     return await this.productApplication.listarProdutos();
    // }

    // @Get(':id')
    // async buscarPorId(@Param('id') id: number): Promise<Product> {
    //     const produto = await this.productApplication.buscarProdutoPorId(Number(id));
    //     if (!produto) {
    //         throw new Error('Produto não encontrado');
    //     }
    //     return produto;
    // }

    @Put(':id')
    async atualizar(
        @Param('id') id: number,
        @Body() dados: Partial<Product>
    ): Promise<Product> {
        const produtoAtualizado = await this.productApplication.atualizarProduto(Number(id), dados);
        if (!produtoAtualizado) {
            throw new Error('Produto não encontrado para atualizar');
        }
        return produtoAtualizado;
    }

    @Delete(':id')
    async deletar(@Param('id') id: number): Promise<void> {
        await this.productApplication.deletarProduto(Number(id));
    }
}