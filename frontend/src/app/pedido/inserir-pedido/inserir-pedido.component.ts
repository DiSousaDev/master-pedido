import { Component } from '@angular/core';
import { NgForm } from "@angular/forms";
import { PedidoService } from "../services/pedido.service";
import { Router } from "@angular/router";
import { Produto } from "../../shared/models/produto.model";
import { ProdutoService } from "../../produto/services/produto.service";
import { ItemPedido } from "../../shared/models/item-pedido.model";
import { PedidoDto } from "../../shared/models/pedido-dto.model";
import { PedidoRequest } from "../../shared/models/pedido-request.model";

@Component({
  selector: 'app-inserir-pedido',
  templateUrl: './inserir-pedido.component.html',
  styleUrls: ['./inserir-pedido.component.css']
})

export class InserirPedidoComponent {

  produtosCombo: Produto[] = [];
  produtos: Produto[] = [];
  itemPedido: ItemPedido[] = [];
  pedidoDto!: PedidoDto;
  produtoSelecionado!: Produto;

  constructor(
    private pedidoService: PedidoService,
    private produtoService: ProdutoService,
    private router: Router
  ) {
  }

  ngOnInit(): void {
    this.carregarProdutosCombo();
  }

  adicionarProdutoAoPedido(form: NgForm) {
    if (form.valid) {
      this.pedidoDto = form.value;
      const produtoExistente = this.itemPedido.find(item => item.produto.id === this.pedidoDto.produto.id);
      if (produtoExistente) {
        produtoExistente.quantidade += this.pedidoDto.quantidade;
      } else {
        this.itemPedido.push(new ItemPedido(this.pedidoDto.quantidade, this.pedidoDto.produto));
      }
    }
  }

  removerProdutodoPedido($event: any, item: ItemPedido) {
    $event.preventDefault();
    if (confirm(`Deseja remover do pedido o produto ${item.produto.descricao}?`)) {
      this.itemPedido = this.itemPedido.filter(it => it.produto.id !== item.produto.id);
    }
  }

  carregarProdutosCombo() {
    this.produtoService.listarTodosProdutos().subscribe(resp => {
      this.produtosCombo = resp
    })
  }

  cadastrarPedido(form: NgForm): void {
    if (form.valid) {
      this.pedidoDto = form.value;
      let pedido = new PedidoRequest(this.pedidoDto.cpf, this.itemPedido);
      this.pedidoService.inserir(pedido).subscribe(() => {
        alert(`Produto inserido com sucesso!`);
        form.resetForm();
        this.itemPedido = [];
        this.router.navigate(['/pedido/inserir']);
      });
    }
  }
}
