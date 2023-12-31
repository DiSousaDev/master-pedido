import { Component } from '@angular/core';
import { PedidoService } from "../services/pedido.service";
import { Pedido } from "../../shared/models/pedido.model";
import { NgForm } from "@angular/forms";
import { PedidoResponse } from "../../shared/models/pedido-response.model";
import { ModalVisualizarPedidoComponent } from "../modal-visualizar-pedido/modal-visualizar-pedido.component";
import { NgbModal } from "@ng-bootstrap/ng-bootstrap";

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

  buscarPedidoPorCpf(form: NgForm) {
    if (form.valid) {
      this.pedidoService.buscarPorCpf(form.value).subscribe(resp => {
        this.pedido = resp;
      })
    }
  }

}
