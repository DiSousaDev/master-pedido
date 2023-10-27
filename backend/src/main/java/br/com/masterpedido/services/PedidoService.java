package br.com.masterpedido.services;

import br.com.masterpedido.dto.pedido.PedidoFullDTO;
import br.com.masterpedido.dto.pedido.PedidoRequest;
import br.com.masterpedido.dto.pedido.PedidoResponse;

public interface PedidoService {

    PedidoResponse buscarPorCpf(String cpf);

    PedidoFullDTO salvar(PedidoRequest request);

}
