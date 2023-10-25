import { NgModule } from '@angular/core';
import { CommonModule } from '@angular/common';
import { RouterModule, Routes } from '@angular/router';

import { InserirClienteComponent, EditarClienteComponent, ListarClienteComponent } from './cliente';
import { InserirPedidoComponent, PesquisarPedidoComponent } from './pedido';
import { ListarProdutoComponent, EditarProdutoComponent,InserirProdutoComponent } from './produto';

const routes: Routes = [
  { path: '', redirectTo: 'cliente/listar', pathMatch: 'full' },
  { path: 'cliente', redirectTo: 'cliente/listar' },
  { path: 'cliente/editar', component: EditarClienteComponent },
  { path: 'cliente/inserir', component: InserirClienteComponent },
  { path: 'cliente/listar', component: ListarClienteComponent },

  { path: 'pedido', redirectTo: 'pedido/pesquisar' },
  { path: 'pedido/inserir', component: InserirPedidoComponent },
  { path: 'pedido/pesquisar', component: PesquisarPedidoComponent },
  { path: 'pedido/pesquisar/:cpf', component: PesquisarPedidoComponent },

  { path: 'produto', redirectTo: 'produto/listar' },
  { path: 'produto/listar', component: ListarProdutoComponent },
  { path: 'produto/editar/:id', component: EditarProdutoComponent },
  { path: 'produto/inserir', component: InserirProdutoComponent },
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
