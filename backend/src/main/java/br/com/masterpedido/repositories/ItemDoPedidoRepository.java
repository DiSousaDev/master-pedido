package br.com.masterpedido.repositories;

import br.com.masterpedido.entities.ItemDoPedido;
import br.com.masterpedido.entities.ItemDoPedidoPK;
import org.springframework.data.jpa.repository.JpaRepository;

public interface ItemDoPedidoRepository extends JpaRepository<ItemDoPedido, ItemDoPedidoPK> {
}
