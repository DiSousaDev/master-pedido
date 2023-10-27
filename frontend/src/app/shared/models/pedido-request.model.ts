import { ItemPedido } from "./item-pedido.model";

export class PedidoRequest {
  constructor(
    public cpf?: string,
    public itens?: ItemPedido[]
  ) {
  }

}
