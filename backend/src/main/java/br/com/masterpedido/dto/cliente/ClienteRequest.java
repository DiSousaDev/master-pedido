package br.com.masterpedido.dto.cliente;

import jakarta.validation.constraints.NotBlank;
import org.hibernate.validator.constraints.Length;
import org.hibernate.validator.constraints.br.CPF;

public record ClienteRequest(
        @CPF(message = "Insira um CPF válido.")
        @NotBlank(message = "Insira o cpf, campo obrigatório.")
        String cpf,
        @Length(min = 2, max = 30, message = "O nome deve ter entre 2 e 30 caracteres.")
        @NotBlank(message = "Insira o nome, campo obrigatório.")
        String nome,
        @Length(min = 2, max = 50, message = "O sobrenome deve ter entre 2 e 50 caracteres.")
        @NotBlank(message = "Insira o sobrenome, campo obrigatório.")
        String sobrenome
) {
}
