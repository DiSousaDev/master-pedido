import { Component, OnInit } from '@angular/core';
import { NgForm } from "@angular/forms";
import { Produto } from "../../shared/models/produto.model";
import { ProdutoService } from "../services/produto.service";
import { Router } from "@angular/router";

@Component({
  selector: 'app-inserir-produto',
  templateUrl: './inserir-produto.component.html',
  styleUrls: ['./inserir-produto.component.css']
})
export class InserirProdutoComponent implements OnInit {
  produto!: Produto;

  constructor(
    private produtoService: ProdutoService,
    private router: Router
  ) {}

  ngOnInit(): void {
    this.produto = new Produto();
  }

  inserir(): void {
    this.produtoService.inserir(this.produto).subscribe(() => {
      this.router.navigate(["./produto/listar"]);
    });
  }
}
