package br.com.masterpedido.services.impl;

import br.com.masterpedido.dto.pedido.PedidoFullDTO;
import br.com.masterpedido.dto.pedido.PedidoRequest;
import br.com.masterpedido.dto.pedido.PedidoResponse;
import br.com.masterpedido.entities.Cliente;
import br.com.masterpedido.entities.ItemDoPedido;
import br.com.masterpedido.entities.Pedido;
import br.com.masterpedido.repositories.ClienteRepository;
import br.com.masterpedido.repositories.ItemDoPedidoRepository;
import br.com.masterpedido.repositories.PedidoRepository;
import br.com.masterpedido.services.PedidoService;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.time.LocalDateTime;
import java.util.Optional;

@Service
public class PedidoServiceImpl implements PedidoService {

    private final Logger log = LoggerFactory.getLogger(PedidoServiceImpl.class);

    private final PedidoRepository repository;
    private final ClienteRepository clienteRepository;
    private final ItemDoPedidoRepository itemDoPedidoRepository;

    public PedidoServiceImpl(PedidoRepository repository, ClienteRepository clienteRepository, ItemDoPedidoRepository itemDoPedidoRepository) {
        this.repository = repository;
        this.clienteRepository = clienteRepository;
        this.itemDoPedidoRepository = itemDoPedidoRepository;
    }

    @Override
    public PedidoResponse buscarPorCpf(String cpf) {
        log.info("Service :: Buscando pedidos do cliente de CPF {}", cpf);
        return new PedidoResponse(repository.findPedidosByClienteCpf(cpf));
    }

    @Override
    @Transactional
    public PedidoFullDTO salvar(PedidoRequest request) {

        Cliente cliente = clienteRepository.findByCpf(request.cpf())
                .orElseThrow(() -> new RuntimeException("Cliente não encontrado."));

        Pedido ped = new Pedido();
        ped.setData(LocalDateTime.now());
        ped.setCliente(cliente);
        Pedido pedido = repository.save(ped);

        request.itens().forEach(item -> {
            itemDoPedidoRepository.save(new ItemDoPedido(item, pedido));
        });

        Optional<Pedido> pedidoOptional = repository.findById(pedido.getId());
        return new PedidoFullDTO(pedidoOptional.orElseThrow());
    }
}
