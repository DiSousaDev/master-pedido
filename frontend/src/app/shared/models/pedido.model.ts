import { Cliente } from "./cliente.model";
import { ItemPedido } from "./item-pedido.model";

export class Pedido {

    constructor(
      public idPedido?: number,
      public cliente?: Cliente,
      public data?: string,
      public itens?: ItemPedido[]
    ) {
    }

  }
