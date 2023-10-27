import { Produto } from "./produto.model";

export class ItemPedido {

  constructor(
    public quantidade?: number,
    public produto?: Produto
  ) {
  }

}
