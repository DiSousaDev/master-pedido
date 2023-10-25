import { Injectable } from '@angular/core';
import { Cliente } from "../../shared/models/cliente.model";
import { Observable } from "rxjs";
import { PageRequest } from "../../shared/models/page-request.model";
import { HttpClient, HttpParams } from "@angular/common/http";
import { environment } from "../../../environments/environment";

const LS_CHAVE: string = "clientes";

@Injectable({
  providedIn: 'root'
})
export class ClienteService {

  private url = `${environment.api}/clientes`;

  constructor(
    private httpClient: HttpClient
  ) { }

  listarTodos(): Cliente[] {
    const clientes = localStorage[LS_CHAVE];
    return clientes ? JSON.parse(clientes) : [];
  }

  inserir(cliente: Cliente): Observable<Cliente> {
    return this.httpClient.post<Cliente>(this.url, cliente);
  }

  atualizar(cliente: Cliente): Observable<Cliente> {
    const url = `${this.url}/${cliente.idCliente}`
    return this.httpClient.put<Cliente>(url, cliente)

  }

  remover(id: number): void {
    let clientes = this.listarTodos();
    // @ts-ignore
    clientes = clientes.filter(cliente => cliente.id !== id);
    localStorage[LS_CHAVE] = JSON.stringify(clientes);
  }

  listarTodosPaginado(size: number, page: number, valueSearch: string): Observable<PageRequest<Cliente>> {
    const options = {
      params: new HttpParams()
        .set('size', size)
        .set('page', page)
        .set('name', valueSearch)
    };
    return this.httpClient.get<any>(this.url, options);
  }

  buscarPorId(id: number): Observable<Cliente> {
    const url = `${this.url}/${id}`
    return this.httpClient.get<Cliente>(url)
  }

}
