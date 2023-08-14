package br.com.masterpedido.dto.cliente;

public record ClienteRequest(
        String cpf,
        String nome,
        String sobrenome
) {
}
