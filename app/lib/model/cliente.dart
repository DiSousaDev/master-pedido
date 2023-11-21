class Cliente {
  int? id;
  String nome;
  String sobrenome;
  String cpf;

  Cliente(this.id, this.nome, this.sobrenome, this.cpf);
  Cliente.novo(this.nome, this.sobrenome, this.cpf);
}
