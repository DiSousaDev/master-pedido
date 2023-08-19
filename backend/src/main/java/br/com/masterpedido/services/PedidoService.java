package br.com.masterpedido.services;

import br.com.masterpedido.dto.pedido.PedidoFullDTO;

import java.util.List;

public interface PedidoService {

    List<PedidoFullDTO> buscarPorCpf(String cpf);

}
