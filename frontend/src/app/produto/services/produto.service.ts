import { Injectable } from '@angular/core';
import { Produto } from "../../shared/models/produto.model";

const LS_CHAVE: string = "produtos";

@Injectable({
  providedIn: 'root'
})
export class ProdutoService {

  constructor() { }

  listarTodos(): Produto[] {
    const produtos = localStorage[LS_CHAVE];
    return produtos ? JSON.parse(produtos) : [];
  }

  inserir(produto: Produto): void {
    const produtos = this.listarTodos();
    // @ts-ignore
    produtos.sort((a, b) => a.id - b.id);
    const lastItem = produtos[produtos.length - 1];
    // @ts-ignore
    produto.id = produtos.length > 0 ? lastItem.id + 1 : 1;
    produtos.push(produto);
    localStorage[LS_CHAVE] = JSON.stringify(produtos);
  }

  buscarPorId(id: string): Produto | undefined {
    const produtos = this.listarTodos();
    // @ts-ignore
    return produtos.find(produto => produto.id == id);
  }

  atualizar(produto: Produto): void {
    const produtos = this.listarTodos();

    produtos.forEach((obj, index, objs) => {
      if (produto.id == obj.id) {
        objs[index] = produto;
      }
    });
    localStorage[LS_CHAVE] = JSON.stringify(produtos);
  }

  remover(id: number): void {
    let produtos = this.listarTodos();
    // @ts-ignore
    produtos = produtos.filter(produto => produto.id !== id);
    localStorage[LS_CHAVE] = JSON.stringify(produtos);
  }

}
