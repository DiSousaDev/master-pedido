import { Component, OnInit } from '@angular/core';
import { ProdutoService } from "../services/produto.service";
import { Produto } from "../../shared/models/produto.model";
import { PageRequest } from "../../shared/models/page-request.model";

@Component({
  selector: 'app-listar-produto',
  templateUrl: './listar-produto.component.html',
  styleUrls: ['./listar-produto.component.css']
})
export class ListarProdutoComponent implements OnInit {

  produtos: Produto[] = [];
  pageProdutos!: PageRequest<Produto>;

  constructor(
    private produtoService : ProdutoService
  ) {
  }

  ngOnInit(): void {
    this.listarTodos(36, 0, '');
  }

  listarTodos(size: number, page: number, valueSearch: string) {
    this.produtoService.listarTodosPaginado(size, page, valueSearch).subscribe(resp => {
      this.pageProdutos = resp;
      this.produtos = resp.content;
    });
  }

  remover($event: any, produto: Produto): void {
    $event.preventDefault();
    if (confirm(`Deseja realmente remover o produto ${produto.descricao}?`)) {
      this.produtoService.remover(produto.id!);
//      this.produtos = this.listarTodos();
    }
  }

}
