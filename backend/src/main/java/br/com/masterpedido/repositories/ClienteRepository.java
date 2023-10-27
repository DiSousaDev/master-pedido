package br.com.masterpedido.repositories;

import br.com.masterpedido.entities.Cliente;
import org.springframework.data.jpa.repository.JpaRepository;

import java.util.List;
import java.util.Optional;

public interface ClienteRepository extends JpaRepository<Cliente, Integer> {

    Optional<Cliente> findByCpf(String cpf);

    List<Cliente> findByCpfContains(String cpf);

}
