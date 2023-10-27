import { Cliente } from "./cliente.model";
import { Pedido } from "./pedido.model";

export class PedidoResponse {

  constructor(
    public cliente?: Cliente,
    public pedidos?: Pedido[]
  ) {
  }

}
