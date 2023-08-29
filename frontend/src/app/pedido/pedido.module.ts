import { NgModule } from '@angular/core';
import { CommonModule } from '@angular/common';
import { RouterModule } from '@angular/router';

import { InserirPedidoComponent } from './inserir-pedido/inserir-pedido.component';
import { PesquisarPedidoComponent } from './pesquisar-pedido/pesquisar-pedido.component';
import { VisualizarPedidoComponent } from './visualizar-pedido/visualizar-pedido.component';

@NgModule({
  declarations: [
    InserirPedidoComponent,
    PesquisarPedidoComponent,
    VisualizarPedidoComponent
  ],
  imports: [
    CommonModule,
    RouterModule
  ]
})
export class PedidoModule { }
