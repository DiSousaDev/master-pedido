package br.com.masterpedido.dto.produto;

import jakarta.validation.constraints.NotBlank;
import org.hibernate.validator.constraints.Length;

public record ProdutoUpdateRequest(
        @Length(min = 2, max = 45, message = "A descrição deve ter entre 2 e 45 caracteres.")
        @NotBlank(message = "Insira a descrição, campo obrigatório.")
        String descricao
) {
}
