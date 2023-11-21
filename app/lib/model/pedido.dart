class Pedido {
  int? id;
  String nome;
  String cliente;
  int data;
  int itens;

  Pedido(this.id, this.nome, this.cliente, this.data, this.itens);
  Pedido.novo(this.nome, this.cliente, this.data, this.itens);
}
