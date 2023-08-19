package br.com.masterpedido.dto.produto;

import br.com.masterpedido.entities.Produto;

public record ProdutoFullDTO(

        Integer id,
        String descricao
) {

    public ProdutoFullDTO(Produto entity) {
        this(
                entity.getId(),
                entity.getDescricao()
        );
    }
}
