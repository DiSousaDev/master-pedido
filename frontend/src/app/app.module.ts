import { NgModule } from '@angular/core';
import { BrowserModule } from '@angular/platform-browser';

import { AppComponent } from './app.component';
import { AppRoutingModule } from './app-routing.module';
import { NgbModule } from '@ng-bootstrap/ng-bootstrap';

import { ClienteModule } from './cliente';
import { ProdutoModule } from './produto';
import { PedidoModule } from './pedido';
import { HttpClientModule } from "@angular/common/http";
import { FormsModule } from "@angular/forms";
import { CommonModule } from "@angular/common";

@NgModule({
  declarations: [
    AppComponent
  ],
  imports: [
    BrowserModule,
    AppRoutingModule,
    HttpClientModule,
    FormsModule,
    ClienteModule,
    ProdutoModule,
    PedidoModule,
    NgbModule,
    CommonModule
  ],
  bootstrap: [AppComponent]
})
export class AppModule { }
