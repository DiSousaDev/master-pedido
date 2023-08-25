import { NgModule } from '@angular/core';
import { CommonModule } from '@angular/common';
import { RouterModule, Routes } from '@angular/router';

import { InserirClienteComponent, EditarClienteComponent, ListarClienteComponent } from './cliente';
import { InserirPedidoComponent, EditarPedidoComponent, ListarPedidoComponent } from './pedido';
import { InserirProdutoComponent, EditarProdutoComponent, ListarProdutoComponent } from './produto';

const routes: Routes = [
  { path: '', redirectTo: 'cliente/listar', pathMatch: 'full' },
  { path: 'cliente', redirectTo: 'cliente/listar' },
  { path: 'cliente/listar', component: ListarClienteComponent },
  { path: 'cliente/inserir', component: InserirClienteComponent },
  { path: 'cliente/editar', component: EditarClienteComponent },
  
  { path: 'produto', redirectTo: 'produto/listar' },
  { path: 'produto/listar', component: ListarProdutoComponent },
  { path: 'produto/inserir', component: InserirProdutoComponent },
  { path: 'produto/editar', component: EditarProdutoComponent },
  
  { path: 'pedido', redirectTo: 'pedido/listar' },
  { path: 'pedido/listar', component: ListarPedidoComponent },
  { path: 'pedido/inserir', component: InserirPedidoComponent },
  { path: 'pedido/editar', component: EditarPedidoComponent }
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
