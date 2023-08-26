import { NgModule } from '@angular/core';
import { CommonModule } from '@angular/common';
import { RouterModule } from '@angular/router';

import { InserirPedidoComponent } from './inserir-pedido/inserir-pedido.component';
import { ListarPedidoComponent } from './listar-pedido/listar-pedido.component';
import { EditarPedidoComponent } from './editar-pedido/editar-pedido.component';

@NgModule({
  declarations: [
    InserirPedidoComponent,
    ListarPedidoComponent,
    EditarPedidoComponent
  ],
  imports: [
    CommonModule,
    RouterModule
  ]
})
export class PedidoModule { }
