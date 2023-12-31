import { Component,OnInit } from '@angular/core';
import { NgForm } from "@angular/forms";
import { Cliente } from "../../shared/models/cliente.model";
import { ClienteService } from "../services/cliente.service";
import { ActivatedRoute, Router } from "@angular/router";
@Component({
  selector: 'app-editar-cliente',
  templateUrl: './editar-cliente.component.html',
  styleUrls: ['./editar-cliente.component.css']
})

export class EditarClienteComponent implements OnInit {
  cliente!: Cliente;

  constructor(
    private clienteService: ClienteService,
    private route: ActivatedRoute,
    private router: Router
  ) {
  }

  ngOnInit(): void {
    let id = this.route.snapshot.params['id'];
    this.clienteService.buscarPorId(id).subscribe(cliente => {
      this.cliente = cliente
    });
  }

  atualizar(form: NgForm): void {
    if (form.valid) {
      this.clienteService.atualizar(form.value).subscribe(() => {
        this.router.navigate(['/cliente/listar']);
      });
    }
  }
}
