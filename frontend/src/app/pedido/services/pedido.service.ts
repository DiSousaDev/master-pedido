import { Injectable } from '@angular/core';
import { Pedido } from "../../shared/models/pedido.model";
import { Observable } from "rxjs";
import { environment } from "../../../environments/environment";
import { HttpClient } from "@angular/common/http";
import { CpfRequest } from "../../shared/models/cpf-request.model";
import { PedidoResponse } from "../../shared/models/pedido-response.model";

const LS_CHAVE: string = "pedidos";

@Injectable({
  providedIn: 'root'
})
export class PedidoService {

  private url = `${environment.api}/pedidos`;

  constructor(
    private httpClient: HttpClient
  ) { }

  listarTodos(): Pedido[] {
    const pedidos = localStorage[LS_CHAVE];
    return pedidos ? JSON.parse(pedidos) : [];
  }

  inserir(pedido: Pedido): void {
    const pedidos = this.listarTodos();
    // @ts-ignore
    pedidos.sort((a, b) => a.id - b.id);
    const lastItem = pedidos[pedidos.length - 1];
    // @ts-ignore
    pedido.id = pedidos.length > 0 ? lastItem.id + 1 : 1;
    pedidos.push(pedido);
    localStorage[LS_CHAVE] = JSON.stringify(pedidos);
  }

  buscarPorCpf(cpfRequest: CpfRequest): Observable<PedidoResponse> {
    const url = `${this.url}/${cpfRequest.cpf}`
    return this.httpClient.get<PedidoResponse>(url);
  }

  buscarPorId(id: string): Pedido | undefined {
    const pedidos = this.listarTodos();
    // @ts-ignore
    return pedidos.find(pedido => pedido.id == id);
  }

  atualizar(pedido: Pedido): void {
    const pedidos = this.listarTodos();

    pedidos.forEach((obj, index, objs) => {
      if (pedido.idPedido == obj.idPedido) {
        objs[index] = pedido;
      }
    });
    localStorage[LS_CHAVE] = JSON.stringify(pedidos);
  }

  remover(id: number): void {
    let pedidos = this.listarTodos();
    // @ts-ignore
    pedidos = pedidos.filter(pedido => pedido.id !== id);
    localStorage[LS_CHAVE] = JSON.stringify(pedidos);
  }

}
