import { Component } from '@angular/core';
import { NgbModal } from '@ng-bootstrap/ng-bootstrap';
import { ModalVisualizarPedidoComponent } from '../modal-visualizar-pedido/modal-visualizar-pedido.component';
import { PedidoService } from "../services/pedido.service";
import { Pedido } from "../../shared/models/pedido.model";
import { NgForm } from "@angular/forms";
import { PedidoResponse } from "../../shared/models/pedido-response.model";

@Component({
  selector: 'app-pesquisar-pedido',
  templateUrl: './pesquisar-pedido.component.html',
  styleUrls: ['./pesquisar-pedido.component.css']
})
export class PesquisarPedidoComponent {

  pedido!: PedidoResponse;

  constructor(
    private modalService: NgbModal,
    private pedidoService: PedidoService
  ) { }

  abrirModalPedido(pedido: Pedido) {
    const modalRef = this.modalService.open(ModalVisualizarPedidoComponent);
    modalRef.componentInstance.pedido = pedido;
  }

  //acredito que seja necessario mudar para este quando for sendo implementada as dmais logicas
  // abrirModalPedido(pedidoId: number) {
  //   const modalRef = this.modalService.open(ModalVisualizarPedidoComponent);
  //   modalRef.componentInstance.pedidoId = pedidoId;
  // }

  buscarPedidoPorCpf(form: NgForm) {
    if (form.valid) {
      this.pedidoService.buscarPorCpf(form.value).subscribe(resp => {
        this.pedido = resp;
      })
    }
  }

}
