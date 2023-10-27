package br.com.masterpedido.services;

import br.com.masterpedido.dto.cliente.ClienteFullDTO;
import br.com.masterpedido.dto.cliente.ClienteRequest;
import br.com.masterpedido.dto.cliente.ClienteUpdateRequest;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;

import java.util.List;

public interface ClienteService {

    ClienteFullDTO buscarPorId(Integer id);

    ClienteFullDTO buscarPorCpf(String cpf);

    Page<ClienteFullDTO> listarTodos(Pageable pageable);

    List<ClienteFullDTO> buscarContendoCpf(String cpf);

    ClienteFullDTO salvar(ClienteRequest clienteRequest);

    ClienteFullDTO atualizar(Integer id, ClienteUpdateRequest clienteUpdateRequest);

    void deletarPorId(Integer id);

}
