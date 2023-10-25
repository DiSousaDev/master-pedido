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

  inserir(cliente: Cliente): void {
    const clientes = this.listarTodos();
    // @ts-ignore
    clientes.sort((a, b) => a.id - b.id);
    const lastItem = clientes[clientes.length - 1];
    // @ts-ignore
    produto.id = clientes.length > 0 ? lastItem.id + 1 : 1;
    clientes.push(cliente);
    localStorage[LS_CHAVE] = JSON.stringify(clientes);
  }

  buscarPorId(id: string): Cliente | undefined {
    const clientes = this.listarTodos();
    // @ts-ignore
    return clientes.find(cliente => cliente.id == id);
  }

  atualizar(cliente: Cliente): void {
    const clientes = this.listarTodos();

    clientes.forEach((obj, index, objs) => {
      if (cliente.id == obj.id) {
        objs[index] = cliente;
      }
    });
    localStorage[LS_CHAVE] = JSON.stringify(clientes);
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

}
