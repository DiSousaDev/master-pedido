import { NgModule } from '@angular/core';
import { RouterModule } from "@angular/router";
import { CommonModule } from '@angular/common';

import { ListarProdutoComponent } from './listar-produto';
import { InserirProdutoComponent } from './inserir-produto';
import { EditarProdutoComponent } from './editar-produto';
import { FormsModule } from "@angular/forms";
import { NgbPagination } from "@ng-bootstrap/ng-bootstrap";

@NgModule({
  declarations: [
    ListarProdutoComponent,
    InserirProdutoComponent,
    EditarProdutoComponent
  ],
    imports: [
        CommonModule,
        RouterModule,
        FormsModule,
        NgbPagination
    ]
})
export class ProdutoModule { }
