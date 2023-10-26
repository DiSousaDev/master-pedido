package br.com.masterpedido.dto.pedido;

import br.com.masterpedido.dto.cliente.ClienteFullDTO;
import br.com.masterpedido.dto.produto.ItemPedidoDTO;
import br.com.masterpedido.entities.Pedido;

import java.time.LocalDateTime;
import java.util.Set;
import java.util.stream.Collectors;

public record PedidoDTO(

        Integer idPedido,
        ClienteFullDTO cliente,
        LocalDateTime data,
        Set<ItemPedidoDTO> itens
) {
    public PedidoDTO(Pedido entity) {
        this(
                entity.getId(),
                new ClienteFullDTO(entity.getCliente()),
                entity.getData(),
                entity.getItens().stream().map(ItemPedidoDTO::new).collect(Collectors.toSet())
        );
    }
}