package br.com.masterpedido.dto.pedido;

import br.com.masterpedido.dto.cliente.ClienteFullDTO;
import br.com.masterpedido.entities.Pedido;

import java.util.List;
import java.util.stream.Collectors;

public record PedidoResponse(

        ClienteFullDTO cliente,
        List<PedidoDTO> pedidos
) {
    public PedidoResponse(List<Pedido> pedidos) {
        this(
                pedidos.stream().findFirst().map(Pedido::getCliente).map(ClienteFullDTO::new).orElse(null),
                pedidos.stream()
                        .map(PedidoDTO::new)
                        .collect(Collectors.toList())
        );
    }
}