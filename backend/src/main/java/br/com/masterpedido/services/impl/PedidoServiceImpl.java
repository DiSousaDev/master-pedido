package br.com.masterpedido.services.impl;

import br.com.masterpedido.dto.pedido.PedidoResponse;
import br.com.masterpedido.repositories.PedidoRepository;
import br.com.masterpedido.services.PedidoService;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Service;

@Service
public class PedidoServiceImpl implements PedidoService {

    private final Logger log = LoggerFactory.getLogger(PedidoServiceImpl.class);

    private final PedidoRepository repository;

    public PedidoServiceImpl(PedidoRepository repository) {
        this.repository = repository;
    }

    @Override
    public PedidoResponse buscarPorCpf(String cpf) {
        log.info("Service :: Buscando pedidos do cliente de CPF {}", cpf);
        return new PedidoResponse(repository.findPedidosByClienteCpf(cpf));
    }
}
