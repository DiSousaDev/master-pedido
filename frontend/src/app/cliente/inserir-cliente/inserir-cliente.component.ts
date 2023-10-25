import { Component } from '@angular/core';
import { Cliente } from "../../shared/models/cliente.model";
import { ClienteService } from "../services/cliente.service";
import { Router } from "@angular/router";
import { NgForm } from "@angular/forms";

@Component({
  selector: 'app-inserir-cliente',
  templateUrl: './inserir-cliente.component.html',
  styleUrls: ['./inserir-cliente.component.css']
})
export class InserirClienteComponent {
  cliente!: Cliente;

  constructor(
    private clienteService: ClienteService,
    private router: Router
  ) {
  }

  ngOnInit(): void {
    this.cliente = new Cliente();
  }

  cadastrar(form: NgForm): void {
    if(form.valid) {
      console.log("Formulario valido")
    } else {
      alert('Formulário Inválido!')
    }
  }
}
