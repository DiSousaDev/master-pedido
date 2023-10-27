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

  inserir(produto: Produto): Observable<Produto> {
    return this.httpClient.post<Produto>(this.url, produto);
  }

  buscarPorId(id: number): Observable<Produto> {
    const url = `${this.url}/${id}`
    return this.httpClient.get<Produto>(url)
  }

  atualizar(produto: Produto): Observable<Produto> {
    const url = `${this.url}/${produto.id}`;
    return this.httpClient.put<Produto>(url, produto);
  }

  remover(id: number): Observable<void> {
    const url = `${this.url}/${id}`;
    return this.httpClient.delete<void>(url);
  }

}
