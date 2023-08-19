package br.com.masterpedido.services.impl;

import br.com.masterpedido.dto.cliente.ClienteFullDTO;
import br.com.masterpedido.dto.cliente.ClienteRequest;
import br.com.masterpedido.dto.cliente.ClienteUpdateRequest;
import br.com.masterpedido.entities.Cliente;
import br.com.masterpedido.repositories.ClienteRepository;
import br.com.masterpedido.services.ClienteService;
import jakarta.persistence.EntityNotFoundException;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.stereotype.Service;

@Service
public class ClienteServiceImpl implements ClienteService {

    private final Logger log = LoggerFactory.getLogger(ClienteServiceImpl.class);

    private final ClienteRepository repository;

    public ClienteServiceImpl(ClienteRepository repository) {
        this.repository = repository;
    }

    @Override
    public ClienteFullDTO buscarPorId(Integer id) {
        log.info("Buscando cliente por id: {}", id);
        return repository.findById(id)
                .map(ClienteFullDTO::new)
                .orElseThrow(() -> new EntityNotFoundException("Cliente id: " + id + " não encontrado"));
    }

    @Override
    public Page<ClienteFullDTO> listarTodos(Pageable pageable) {
        log.info("Listando todos os clientes");
        return repository.findAll(pageable).map(ClienteFullDTO::new);
    }

    @Override
    public ClienteFullDTO salvar(ClienteRequest clienteRequest) {
        log.info("Salvando cliente: {}", clienteRequest);
        Cliente entity = repository.save(new Cliente(clienteRequest));
        return new ClienteFullDTO(entity);
    }

    @Override
    public ClienteFullDTO atualizar(Integer id, ClienteUpdateRequest clienteUpdateRequest) {
        log.info("Atualizando cliente: {}", clienteUpdateRequest);
        buscarPorId(id);
        Cliente entity = repository.save(new Cliente(id, clienteUpdateRequest));
        return new ClienteFullDTO(entity);
    }

    @Override
    public void deletarPorId(Integer id) {
        log.info("Deletando cliente por id: {}", id);
        ClienteFullDTO clienteFullDTO = buscarPorId(id);
        repository.delete(new Cliente(clienteFullDTO));
    }
}
