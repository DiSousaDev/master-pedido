import { NgModule } from '@angular/core';
import { CommonModule } from '@angular/common';
import { RouterModule } from '@angular/router';
import { FormsModule } from "@angular/forms";

import { InserirPedidoComponent } from './inserir-pedido';
import { PesquisarPedidoComponent } from './pesquisar-pedido';
import { VisualizarPedidoComponent } from './visualizar-pedido';
import { ModalVisualizarPedidoComponent } from './modal-visualizar-pedido/modal-visualizar-pedido.component';

import { PedidoService } from './services/pedido.service';
import { ValidaNumeroNegativoDirective } from "../shared/directives/valida-numero-negativo.directive";

@NgModule({
  declarations: [
    InserirPedidoComponent,
    ModalVisualizarPedidoComponent,
    PesquisarPedidoComponent,
    VisualizarPedidoComponent,
    ValidaNumeroNegativoDirective
  ],
  imports: [
    CommonModule,
    RouterModule,
    FormsModule
  ],
  providers: [
    PedidoService
  ],
  exports: [
    ValidaNumeroNegativoDirective
  ]
})
export class PedidoModule { }
