import { NgModule } from '@angular/core';
import { CommonModule } from '@angular/common';
import { RouterModule } from '@angular/router';

import { ListarProdutoComponent } from './listar-produto/listar-produto.component';
import { EditarProdutoComponent } from './editar-produto/editar-produto.component';
import { InserirProdutoComponent } from './inserir-produto/inserir-produto.component';

@NgModule({
  declarations: [
    ListarProdutoComponent,
    EditarProdutoComponent,
    InserirProdutoComponent
  ],
  imports: [
    CommonModule,
    RouterModule
  ]
})
export class ProdutoModule { }
