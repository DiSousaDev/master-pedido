import { Component, OnInit } from '@angular/core';
import { ProdutoService } from "../services/produto.service";
import { Produto } from "../../shared/models/produto.model";

@Component({
  selector: 'app-listar-produto',
  templateUrl: './listar-produto.component.html',
  styleUrls: ['./listar-produto.component.css']
})
export class ListarProdutoComponent implements OnInit {

  produtos: Produto[] = [];

  constructor(
    private produtoService : ProdutoService
  ) {
  }

  ngOnInit(): void {
    this.produtos = this.listarTodos();
  }

  listarTodos(): Produto[] {
    return this.produtoService.listarTodos();
  }

  remover($event: any, produto: Produto): void {
    $event.preventDefault();
    if (confirm(`Deseja realmente remover o produto ${produto.descricao}?`)) {
      this.produtoService.remover(produto.id!);
      this.produtos = this.listarTodos();
    }
  }

}
