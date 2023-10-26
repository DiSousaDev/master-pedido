import { Component } from '@angular/core';
import { PedidoService } from "../services/pedido.service";
import { Pedido } from "../../shared/models/pedido.model";

@Component({
  selector: 'app-pesquisar-pedido',
  templateUrl: './pesquisar-pedido.component.html',
  styleUrls: ['./pesquisar-pedido.component.css']
})

export class PesquisarPedidoComponent {
  pedido: Pedido | undefined;

  constructor(
    private pedidoService: PedidoService
  ) { }  

  buscarPedidoPorCpf(cpf: string) {
    this.pedido = this.pedidoService.buscarPorCpf(cpf); 
  }

}
