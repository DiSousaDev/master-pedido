package br.com.masterpedido.services;

import br.com.masterpedido.dto.produto.ProdutoFullDTO;
import br.com.masterpedido.dto.produto.ProdutoRequest;
import br.com.masterpedido.dto.produto.ProdutoUpdateRequest;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;

public interface ProdutoService {

    ProdutoFullDTO buscarPorId(Integer id);

    Page<ProdutoFullDTO> listarTodos(Pageable pageable);

    ProdutoFullDTO salvar(ProdutoRequest produtoRequest);

    ProdutoFullDTO atualizar(Integer id, ProdutoUpdateRequest produtoUpdateRequest);

    void deletarPorId(Integer id);

}
