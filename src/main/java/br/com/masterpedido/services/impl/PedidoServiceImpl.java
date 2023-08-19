package br.com.masterpedido.services.impl;

import br.com.masterpedido.dto.pedido.PedidoFullDTO;
import br.com.masterpedido.repositories.PedidoRepository;
import br.com.masterpedido.services.PedidoService;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class PedidoServiceImpl implements PedidoService {

    private final Logger log = LoggerFactory.getLogger(PedidoServiceImpl.class);

    private final PedidoRepository repository;

    public PedidoServiceImpl(PedidoRepository repository) {
        this.repository = repository;
    }

    @Override
    public List<PedidoFullDTO> buscarPorCpf(String cpf) {
        log.info("Service :: Buscando pedidos do cliente de CPF {}", cpf);
        return repository.findPedidosByClienteCpf(cpf)
                .stream().map(PedidoFullDTO::new).toList();
    }
}
