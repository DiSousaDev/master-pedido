package br.com.masterpedido.repositories;

import br.com.masterpedido.entities.Pedido;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;

import java.util.List;

public interface PedidoRepository extends JpaRepository<Pedido, Integer> {

    @Query("""
            SELECT p FROM Pedido p
            JOIN FETCH p.cliente c
            JOIN FETCH p.itens i
            WHERE c.cpf = :cpf
            """)
    List<Pedido> findPedidosByClienteCpf(String cpf);

}
