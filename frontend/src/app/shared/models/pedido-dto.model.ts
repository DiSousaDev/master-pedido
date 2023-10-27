import { Produto } from "./produto.model";

export class PedidoDto {

  constructor(
    public produto: Produto,
    public quantidade: number,
    public cpf: string
  ) {
  }

}
