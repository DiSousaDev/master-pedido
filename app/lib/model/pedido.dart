class Pedido {
  int? id;
  String cpf;
  String data;
  int quantidade;
  List itens;

  Pedido(this.id, this.cpf, this.data, this.quantidade, this.itens);
  Pedido.novo(this.cpf, this.data, this.quantidade, this.itens);
}
