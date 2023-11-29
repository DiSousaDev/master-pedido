class Pedido {
  int? id;
  String cpf;
  int quantidade;
  List itens;

  Pedido(this.id, this.cpf, this.quantidade, this.itens);
  Pedido.novo(this.cpf, this.quantidade, this.itens);
}
