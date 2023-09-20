import { Component } from '@angular/core';
import { NgbActiveModal } from '@ng-bootstrap/ng-bootstrap'
import { PedidoService } from "../services/pedido.service";
import { Pedido } from "../../shared/models/pedido.model";

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

  //acredito que o codigo abaixo tbm vai ser necessario para implementar a visualizacao 
  // export class ModalVisualizarPedidoComponent implements OnInit {
  //   @Input() pedidoId: number; // Receba o ID do pedido como entrada
  //   pedido: Pedido | undefined;
    
  //   constructor(public activeModal: NgbActiveModal, private pedidoService: PedidoService) {}
  
  //   ngOnInit(): void {
  //     // No ngOnInit, chame a função buscarPedidoPorId para obter o pedido com base no ID
  //     this.buscarPedidoPorId(this.pedidoId);
  //   }
  
  //   buscarPedidoPorId(id: number) {
  //     this.pedido = this.pedidoService.buscarPorId(id.toString()); 
  //   }
  // }
}
