package br.com.masterpedido.services;

import br.com.masterpedido.dto.produto.ProdutoFullDTO;
import br.com.masterpedido.dto.produto.ProdutoRequest;
import br.com.masterpedido.dto.produto.ProdutoUpdateRequest;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;

import java.util.List;

public interface ProdutoService {

    ProdutoFullDTO buscarPorId(Integer id);

    List<ProdutoFullDTO> listarTodos();
    Page<ProdutoFullDTO> listarTodos(Pageable pageable);

    ProdutoFullDTO salvar(ProdutoRequest produtoRequest);

    ProdutoFullDTO atualizar(Integer id, ProdutoUpdateRequest produtoUpdateRequest);

    void deletarPorId(Integer id);

}
