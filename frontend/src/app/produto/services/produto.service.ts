import { Injectable } from '@angular/core';
import { Produto } from "../../shared/models/produto.model";
import { environment } from "../../../environments/environment";
import { PageRequest } from "../../shared/models/page-request.model";
import { Observable } from "rxjs";
import { HttpClient, HttpParams } from "@angular/common/http";

const LS_CHAVE: string = "produtos";

@Injectable({
  providedIn: 'root'
})
export class ProdutoService {

  private url = `${environment.api}/produtos`;

  constructor(
    private httpClient: HttpClient
  ) { }

  listarTodos(): Produto[] {
    const produtos = localStorage[LS_CHAVE];
    return produtos ? JSON.parse(produtos) : [];
  }

  listarTodosPaginado(size: number, page: number, valueSearch: string): Observable<PageRequest<Produto>> {
    const options = {
      params: new HttpParams()
        .set('size', size)
        .set('page', page)
        .set('name', valueSearch)
    };
    return this.httpClient.get<any>(this.url, options);
  }

  // inserir(produto: Produto): void {
  //   const produtos = this.listarTodos();
  //   // @ts-ignore
  //   produtos.sort((a, b) => a.id - b.id);
  //   const lastItem = produtos[produtos.length - 1];
  //   // @ts-ignore
  //   produto.id = produtos.length > 0 ? lastItem.id + 1 : 1;
  //   produtos.push(produto);
  //   localStorage[LS_CHAVE] = JSON.stringify(produtos);
  // }

  inserir(produto: Produto): Observable<Produto> {
    return this.httpClient.post<Produto>(this.url, produto);
  }

  buscarPorId(id: string): Produto | undefined {
    const produtos = this.listarTodos();
    // @ts-ignore
    return produtos.find(produto => produto.id == id);
  }


  atualizar(produto: Produto): Observable<Produto> {
    const url = `${this.url}/${produto.id}`
    return this.httpClient.put<Produto>(url, produto)
  }


  remover(id: number): void {
    let produtos = this.listarTodos();
    // @ts-ignore
    produtos = produtos.filter(produto => produto.id !== id);
    localStorage[LS_CHAVE] = JSON.stringify(produtos);
  }

}
