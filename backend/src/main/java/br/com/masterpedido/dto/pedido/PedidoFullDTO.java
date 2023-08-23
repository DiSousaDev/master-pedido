package br.com.masterpedido.dto.pedido;

import br.com.masterpedido.dto.cliente.ClienteFullDTO;
import br.com.masterpedido.dto.produto.ItemPedidoDTO;
import br.com.masterpedido.entities.Pedido;

import java.time.LocalDateTime;
import java.util.Set;
import java.util.stream.Collectors;

public record PedidoFullDTO(

        Integer idPedido,
        LocalDateTime data,
        ClienteFullDTO cliente,
        Set<ItemPedidoDTO> itens
) {
    public PedidoFullDTO(Pedido entity) {
        this(
                entity.getId(),
                entity.getData(),
                new ClienteFullDTO(entity.getCliente()),
                entity.getItens().stream().map(ItemPedidoDTO::new).collect(Collectors.toSet())
        );
    }
}