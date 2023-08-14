package br.com.masterpedido.dto.cliente;

public record ClienteUpdateRequest(
        String cpf,
        String nome,
        String sobrenome
) {
}
