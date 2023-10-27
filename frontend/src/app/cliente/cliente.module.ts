import { NgModule } from '@angular/core';
import { CommonModule } from '@angular/common';
import { RouterModule } from '@angular/router';

import { InserirClienteComponent } from './inserir-cliente/inserir-cliente.component';
import { ListarClienteComponent } from './listar-cliente/listar-cliente.component';
import { EditarClienteComponent } from './editar-cliente/editar-cliente.component';
import { VisualizarClienteComponent } from './visualizar-cliente/visualizar-cliente.component';
import { FormsModule } from "@angular/forms";

@NgModule({
  declarations: [
    InserirClienteComponent,
    ListarClienteComponent,
    EditarClienteComponent,
    VisualizarClienteComponent
  ],
  imports: [
    CommonModule,
    RouterModule,
    FormsModule
  ]
})
export class ClienteModule { }
