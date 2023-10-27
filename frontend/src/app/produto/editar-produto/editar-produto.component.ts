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
  produto!: Produto;

  constructor(
    private produtoService: ProdutoService,
    private route: ActivatedRoute,
    private router: Router
  ) {
  }

  ngOnInit(): void {
    let id = this.route.snapshot.params['id'];
    this.produtoService.buscarPorId(id).subscribe(produto => {
      this.produto = produto;
    });
  }

  atualizar(form: NgForm): void {
    console.log('Atualizando produto');
    if (form.valid) {
      console.log('Atualizando produto form válido');
      this.produtoService.atualizar(this.produto).subscribe(updatedProduto => {
        console.log('Produto atualizado com sucesso:', updatedProduto);
        this.router.navigate(['/produto']);
      }, error => {
        console.error('Erro ao atualizar o produto:', error);
      });
    }
  }
}
