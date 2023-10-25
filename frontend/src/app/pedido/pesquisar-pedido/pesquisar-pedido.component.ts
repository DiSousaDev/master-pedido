import { Component, OnInit } from '@angular/core';
import { NgbModal } from '@ng-bootstrap/ng-bootstrap';
import { ModalVisualizarPedidoComponent } from '../modal-visualizar-pedido/modal-visualizar-pedido.component';
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
    private modalService: NgbModal,
    private pedidoService: PedidoService
  ) { }

  abrirModalPedido() {
    const modalRef = this.modalService.open(ModalVisualizarPedidoComponent);
  }

  //acredito que seja necessario mudar para este quando for sendo implementada as dmais logicas
  // abrirModalPedido(pedidoId: number) {
  //   const modalRef = this.modalService.open(ModalVisualizarPedidoComponent);
  //   modalRef.componentInstance.pedidoId = pedidoId;
  // }
  

  buscarPedidoPorCpf(cpf: string) {
    this.pedido = this.pedidoService.buscarPorCpf(cpf); 
  }

}
