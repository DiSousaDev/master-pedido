import { Injectable } from '@angular/core';
import { HttpClient, HttpParams } from "@angular/common/http";
import { Observable, throwError } from 'rxjs';
import { catchError } from 'rxjs/operators';

import { environment } from "../../../environments/environment";

import { Produto } from "../../shared/models/produto.model";
import { PageRequest } from "../../shared/models/page-request.model";

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

  listarTodosProdutos(): Observable<Produto[]> {
    const url = `${this.url}/all`
    return this.httpClient.get<Produto[]>(url)
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
    return this.httpClient.delete<void>(url).pipe(
      catchError((error: any) => {

        if (error.status === 400) {
          alert("O produto não pôde ser removido pois está atrelado a um ou mais pedidos");
        } else {
          alert("Erro ao excluir produto");
        }

        return throwError('Erro ao excluir produto');
      })
    );
  }

}
