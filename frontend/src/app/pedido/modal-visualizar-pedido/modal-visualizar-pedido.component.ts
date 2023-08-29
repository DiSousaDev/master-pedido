import { Component } from '@angular/core';

import { NgbActiveModal } from '@ng-bootstrap/ng-bootstrap'

@Component({
  selector: 'app-modal-visualizar-pedido',
  templateUrl: './modal-visualizar-pedido.component.html',
  styleUrls: ['./modal-visualizar-pedido.component.css']
})

export class ModalVisualizarPedidoComponent {
  // @Input() pessoa!: Pessoa;
  constructor(public activeModal: NgbActiveModal) {}
  ngOnInit(): void {
  }
}
