package br.com.masterpedido.services.impl;

import br.com.masterpedido.controllers.exceptions.DatabaseException;
import br.com.masterpedido.dto.produto.ProdutoFullDTO;
import br.com.masterpedido.dto.produto.ProdutoRequest;
import br.com.masterpedido.dto.produto.ProdutoUpdateRequest;
import br.com.masterpedido.entities.Produto;
import br.com.masterpedido.repositories.ProdutoRepository;
import br.com.masterpedido.services.ProdutoService;
import jakarta.persistence.EntityNotFoundException;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.dao.DataIntegrityViolationException;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.stereotype.Service;

import java.util.List;
import java.util.stream.Collectors;

@Service
public class ProdutoServiceImpl implements ProdutoService {

    private final Logger log = LoggerFactory.getLogger(ProdutoServiceImpl.class);

    private final ProdutoRepository repository;

    public ProdutoServiceImpl(ProdutoRepository repository) {
        this.repository = repository;
    }

    @Override
    public ProdutoFullDTO buscarPorId(Integer id) {
        log.info("Buscando produto por id: {}", id);
        return repository.findById(id)
                .map(ProdutoFullDTO::new)
                .orElseThrow(() -> new EntityNotFoundException("Produto id: " + id + " não encontrado"));
    }

    @Override
    public List<ProdutoFullDTO> listarTodos() {
        log.info("Listando todos os produtos");
        return repository.findAll().stream().map(ProdutoFullDTO::new).collect(Collectors.toList());
    }

    @Override
    public Page<ProdutoFullDTO> listarTodos(Pageable pageable) {
        log.info("Listando todos os produtos");
        return repository.findAll(pageable).map(ProdutoFullDTO::new);
    }

    @Override
    public ProdutoFullDTO salvar(ProdutoRequest produtoRequest) {
        log.info("Salvando produto: {}", produtoRequest);
        Produto entity = repository.save(new Produto(produtoRequest));
        return new ProdutoFullDTO(entity);
    }

    @Override
    public ProdutoFullDTO atualizar(Integer id, ProdutoUpdateRequest produtoUpdateRequest) {
        log.info("Atualizando produto: {}", produtoUpdateRequest);
        buscarPorId(id);
        Produto entity = repository.save(new Produto(id, produtoUpdateRequest));
        return new ProdutoFullDTO(entity);
    }

    @Override
    public void deletarPorId(Integer id) {
        log.info("Deletando produto por id: {}", id);
        ProdutoFullDTO produtoFullDTO = buscarPorId(id);
        try {
            repository.delete(new Produto(produtoFullDTO));
        } catch (DataIntegrityViolationException e) {
            throw new DatabaseException("Não é possível excluir um produto que possui pedidos");
        }
    }
}
