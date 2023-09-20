import { Component, OnInit,ViewChild } from '@angular/core';
import { NgForm } from "@angular/forms";
import { Pedido } from "../../shared/models/pedido.model";
import { PedidoService } from "../services/pedido.service";
import { Router } from "@angular/router";

@Component({
  selector: 'app-inserir-pedido',
  templateUrl: './inserir-pedido.component.html',
  styleUrls: ['./inserir-pedido.component.css']
})

export class InserirPedidoComponent {
  @ViewChild('formPedido') formPedido!: NgForm;
  pedido!: Pedido;

  constructor(
    private pedidoService: PedidoService,
    private router: Router
  ) {
  }

  ngOnInit(): void {
    this.pedido = new Pedido();
  }

  inserir(): void {
    if (this.formPedido.form.valid) {
      this.pedidoService.inserir(this.pedido);
      this.router.navigate(["/pedido/listar"]);
    }
  }
}