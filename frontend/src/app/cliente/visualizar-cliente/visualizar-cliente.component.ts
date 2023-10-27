import { Component, OnInit } from '@angular/core';
import { ActivatedRoute, Router } from "@angular/router";

import { ClienteService } from "../services/cliente.service";
import { Cliente } from "../../shared/models/cliente.model";

@Component({
  selector: 'app-visualizar-cliente',
  templateUrl: './visualizar-cliente.component.html',
  styleUrls: ['./visualizar-cliente.component.css']
})
export class VisualizarClienteComponent implements OnInit {

  cliente!: Cliente;

  constructor(
    private clienteService: ClienteService,
    private route: ActivatedRoute,
    private router: Router
  ) {
  }

  ngOnInit(): void {
    let cpf = this.route.snapshot.params['cpf'];
    this.clienteService.buscarPorCpf(cpf).subscribe(cliente => {
      this.cliente = cliente
    });
  }  

  remover($event: any, cliente: Cliente): void {
    $event.preventDefault();
    if (confirm(`Deseja realmente remover o cliente ${cliente.nome}?`)) {
      this.clienteService.remover(cliente.idCliente!);
      this.router.navigate(['/cliente/listar']);
    }
  }
}
