package br.com.masterpedido.dto.pedido;

import br.com.masterpedido.dto.produto.ItemPedidoDTO;
import jakarta.validation.constraints.NotBlank;

import java.util.Set;

public record PedidoRequest(

        @NotBlank(message = "Insira o cpf, campo obrigatório.")
        String cpf,
        Set<ItemPedidoDTO> itens

) {
}


