import { NgModule } from '@angular/core';
import { CommonModule } from '@angular/common';
import { RouterModule } from '@angular/router';

import { ListarProdutoComponent } from './listar-produto/listar-produto.component';

@NgModule({
  declarations: [
    ListarProdutoComponent
  ],
  imports: [
    CommonModule,
    RouterModule
  ]
})
export class ProdutoModule { }
