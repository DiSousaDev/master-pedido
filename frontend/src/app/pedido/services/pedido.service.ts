import { Injectable } from '@angular/core';
import { Pedido } from "../../shared/models/pedido.model";

const LS_CHAVE: string = "pedidos";

@Injectable({
  providedIn: 'root'
})
export class PedidoService {

  constructor() { }

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

  buscarPorId(id: number): Pedido | undefined {
    const pedidos = this.listarTodos();
    return pedidos.find(pedido => pedido.id === id);
  }

  buscarPorCpf(cpf: string): Pedido | undefined {
    const pedidos = this.listarTodos();
    return pedidos.find(pedido => pedido.cpf === cpf);
  }

  atualizar(pedido: Pedido): void {
    const pedidos = this.listarTodos();

    pedidos.forEach((obj, index, objs) => {
      if (pedido.id == obj.id) {
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
