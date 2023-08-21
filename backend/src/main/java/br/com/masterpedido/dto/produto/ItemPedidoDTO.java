package br.com.masterpedido.dto.produto;

import br.com.masterpedido.entities.ItemDoPedido;

public record ItemPedidoDTO(

        Integer quantidade,
        ProdutoFullDTO produto
) {

    public ItemPedidoDTO(ItemDoPedido entity) {
        this(
                entity.getQuantidade(),
                new ProdutoFullDTO(entity.getProduto())
        );
    }
}
