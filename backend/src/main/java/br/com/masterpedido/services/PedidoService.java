package br.com.masterpedido.services;

import br.com.masterpedido.dto.pedido.PedidoResponse;

public interface PedidoService {

    PedidoResponse buscarPorCpf(String cpf);

}
