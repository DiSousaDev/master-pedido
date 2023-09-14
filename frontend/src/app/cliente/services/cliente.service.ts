import { Injectable } from '@angular/core';
import { Cliente } from "../../shared/models/cliente.model";

const LS_CHAVE: string = "clientes";

@Injectable({
  providedIn: 'root'
})
export class ClienteService {

  constructor() { }

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

}
