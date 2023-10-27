import { Component } from '@angular/core';
import { ClienteService } from "../services/cliente.service";
import { Cliente } from "../../shared/models/cliente.model";
import { PageRequest } from "../../shared/models/page-request.model";

@Component({
  selector: 'app-listar-cliente',
  templateUrl: './listar-cliente.component.html',
  styleUrls: ['./listar-cliente.component.css']
})
export class ListarClienteComponent {

  clientes: Cliente[] = [];
  pageClientes!: PageRequest<Cliente>;

  constructor(
    private clienteService : ClienteService
  ) {
  }

  ngOnInit(): void {
    this.listarTodos(36, 0, '');
  }

  listarTodos(size: number, page: number, valueSearch: string) {
    this.clienteService.listarTodosPaginado(size, page, valueSearch).subscribe(resp => {
      this.pageClientes = resp;
      this.clientes = resp.content;
    });
  }

  filtrarCpf(cpf: any) {
    this.clienteService.listarFiltrados(cpf).subscribe(resp => {
      console.log("Buscando clientes", resp)
      this.clientes = resp;
    });
  }

  remover($event: any, cliente: Cliente): void {
    $event.preventDefault();
    if (confirm(`Deseja realmente remover o cliente ${cliente.nome}?`)) {
      this.clienteService.remover(cliente.idCliente!).subscribe(() => {
        this.listarTodos(36, 0, '');
      })
    }
  }
}
