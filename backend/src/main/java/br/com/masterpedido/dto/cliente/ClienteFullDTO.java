package br.com.masterpedido.dto.cliente;

import br.com.masterpedido.entities.Cliente;

public record ClienteFullDTO(
        Integer idCliente,
        String cpf,
        String nome,
        String sobrenome
) {

    public ClienteFullDTO(Cliente entity) {
        this(
                entity.getId(),
                entity.getCpf(),
                entity.getNome(),
                entity.getSobrenome()
        );
    }
}
