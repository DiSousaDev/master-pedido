import { Component, Input } from '@angular/core';
import { NgbActiveModal } from '@ng-bootstrap/ng-bootstrap'
import { Pedido } from "../../shared/models/pedido.model";

@Component({
  selector: 'app-modal-visualizar-pedido',
  templateUrl: './modal-visualizar-pedido.component.html',
  styleUrls: ['./modal-visualizar-pedido.component.css']
})

export class ModalVisualizarPedidoComponent {

  @Input() pedido!: Pedido;
  constructor(public activeModal: NgbActiveModal) {}
  ngOnInit(): void {
  }

}
