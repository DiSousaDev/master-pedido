package br.com.masterpedido.dto.cliente;

import jakarta.validation.constraints.NotBlank;
import org.hibernate.validator.constraints.br.CPF;

public record ClienteUpdateRequest(
        @CPF(message = "Insira um CPF válido.")
        @NotBlank(message = "Insira o cpf, campo obrigatório.")
        String cpf,
        @NotBlank(message = "Insira o nome, campo obrigatório.")
        String nome,
        @NotBlank(message = "Insira o sobrenome, campo obrigatório.")
        String sobrenome
) {
}
