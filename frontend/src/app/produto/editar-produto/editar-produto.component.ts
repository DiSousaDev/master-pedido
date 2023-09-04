import { Component, OnInit, ViewChild } from '@angular/core';
import { NgForm } from "@angular/forms";
import { Produto } from "../../shared/models/produto.model";
import { ProdutoService } from "../services/produto.service";
import { ActivatedRoute, Router } from "@angular/router";

@Component({
  selector: 'app-editar-produto',
  templateUrl: './editar-produto.component.html',
  styleUrls: ['./editar-produto.component.css']
})
export class EditarProdutoComponent implements OnInit {

  @ViewChild('formProduto') formProduto!: NgForm;
  produto!: Produto;

  constructor(
    private produtoService: ProdutoService,
    private route: ActivatedRoute,
    private router: Router
  ) {
  }

  ngOnInit(): void {
    // snapshot.params de ActivatedRoute dá acesso aos parâmetros passados
    let id = this.route.snapshot.params['id'];
    const res = this.produtoService.buscarPorId(id);
    if (res !== undefined)
      this.produto = res;
    else
      throw new Error("Produto não encontrado: id = " + id);
  }

  atualizar(): void {
    if (this.formProduto.form.valid) {
      this.produtoService.atualizar(this.produto);
      this.router.navigate(['/produto/listar']);
    }
  }

}
