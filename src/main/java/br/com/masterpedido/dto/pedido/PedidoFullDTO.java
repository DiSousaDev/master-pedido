package br.com.masterpedido.dto.pedido;

import br.com.masterpedido.dto.cliente.ClienteFullDTO;
import br.com.masterpedido.entities.ItemDoPedido;
import br.com.masterpedido.entities.Pedido;

import java.time.LocalDateTime;
import java.util.Set;

public record PedidoFullDTO(

        Integer id,
        LocalDateTime data,
        ClienteFullDTO cliente,
        Set<ItemDoPedido> itens
) {
    public PedidoFullDTO(Pedido entity) {
        this(
                entity.getId(),
                entity.getData(),
                new ClienteFullDTO(entity.getCliente()),
                entity.getItens()
        );
    }
}
