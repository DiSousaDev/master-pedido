import { Component } from '@angular/core';

import { NgbModal } from '@ng-bootstrap/ng-bootstrap';
import { ModalVisualizarPedidoComponent } from '../modal-visualizar-pedido/modal-visualizar-pedido.component';

@Component({
  selector: 'app-pesquisar-pedido',
  templateUrl: './pesquisar-pedido.component.html',
  styleUrls: ['./pesquisar-pedido.component.css']
})

export class PesquisarPedidoComponent {
  constructor(private modalService: NgbModal) { }

  abrirModalPedido() {
    const modalRef = this.modalService.open(ModalVisualizarPedidoComponent);
   }
}
