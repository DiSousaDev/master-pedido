import { NgModule } from '@angular/core';
import { CommonModule } from '@angular/common';
import { RouterModule, Routes } from '@angular/router';

import { InserirClienteComponent, EditarClienteComponent, ListarClienteComponent } from './cliente';
import { InserirPedidoComponent, ListarPedidoComponent, VisualizarPedidoComponent, } from './pedido';
import { ListarProdutoComponent } from './produto';

const routes: Routes = [
  { path: '', redirectTo: 'cliente/listar', pathMatch: 'full' },
  { path: 'cliente', redirectTo: 'cliente/listar' },
  { path: 'cliente/editar', component: EditarClienteComponent },
  { path: 'cliente/inserir', component: InserirClienteComponent },
  { path: 'cliente/listar', component: ListarClienteComponent },
  
  { path: 'produto', redirectTo: 'produto/listar' },
  { path: 'produto/listar', component: ListarProdutoComponent },

  { path: 'pedido', redirectTo: 'pedido/listar' },
  { path: 'pedido/editar', component: VisualizarPedidoComponent },
  { path: 'pedido/inserir', component: InserirPedidoComponent },
  { path: 'pedido/listar', component: ListarPedidoComponent }
];

@NgModule({
  declarations: [],
  imports: [
    CommonModule,
    RouterModule.forRoot(routes)

  ],
  exports: [RouterModule]

})
export class AppRoutingModule { }
