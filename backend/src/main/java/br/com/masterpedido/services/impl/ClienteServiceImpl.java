package br.com.masterpedido.services.impl;

import br.com.masterpedido.controllers.exceptions.DataNotFoundException;
import br.com.masterpedido.controllers.exceptions.DatabaseException;
import br.com.masterpedido.dto.cliente.ClienteFullDTO;
import br.com.masterpedido.dto.cliente.ClienteRequest;
import br.com.masterpedido.dto.cliente.ClienteUpdateRequest;
import br.com.masterpedido.entities.Cliente;
import br.com.masterpedido.repositories.ClienteRepository;
import br.com.masterpedido.services.ClienteService;
import jakarta.persistence.EntityNotFoundException;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.dao.DataIntegrityViolationException;
import org.springframework.dao.EmptyResultDataAccessException;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.stereotype.Service;

import static java.lang.String.format;

@Service
public class ClienteServiceImpl implements ClienteService {

    public static final String ENTIDADE_RELACIONADA_EXCEPTION = "Impossivel excluir Cliente. Possui pedidos relacionados id: %s entity: %s";
    public static final String CLIENTE_NAO_ENCONTRADO = "Cliente id: %s não encontrado. Entidade: %s";
    public static final String CLIENTE_CPF_NAO_ENCONTRADO = "Cliente CPF: %s não encontrado. Entidade: %s";
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
                .orElseThrow(() -> new EntityNotFoundException(
                        format(CLIENTE_NAO_ENCONTRADO, id, Cliente.class.getName())));
    }

    @Override
    public ClienteFullDTO buscarPorCpf(String cpf) {
        log.info("Buscando cliente por cpf: {}", cpf);
        return repository.findByCpf(cpf)
                .map(ClienteFullDTO::new)
                .orElseThrow(() -> new EntityNotFoundException(
                        format(CLIENTE_CPF_NAO_ENCONTRADO, cpf, Cliente.class.getName())));
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

        buscarPorId(id);

        log.info("Deletando cliente por id: {}", id);
        try {
            repository.deleteById(id);
        } catch (EmptyResultDataAccessException e) {
            throw new DataNotFoundException(format(CLIENTE_NAO_ENCONTRADO, id, Cliente.class.getName()));
        } catch (DataIntegrityViolationException e) {
            throw new DatabaseException(format(ENTIDADE_RELACIONADA_EXCEPTION, id, Cliente.class.getName()));
        }
    }
}
