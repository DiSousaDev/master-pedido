package br.com.masterpedido.entities;

import jakarta.persistence.EmbeddedId;
import jakarta.persistence.Entity;

import java.io.Serializable;

@Entity
public class ItemDoPedido implements Serializable {

    @EmbeddedId
    private final ItemDoPedidoPK id = new ItemDoPedidoPK();
    private Integer quantidade;

    public ItemDoPedido() {
    }

    public ItemDoPedido(Pedido pedido, Produto produto, Integer quantidade) {
        id.setPedido(pedido);
        id.setProduto(produto);
        this.quantidade = quantidade;
    }

    public Pedido getPedido() {
        return id.getPedido();
    }

    public void setPedido(Pedido pedido) {
        this.id.setPedido(pedido);
    }

    public Produto getProduto() {
        return id.getProduto();
    }

    public void setProduto(Produto produto) {
        this.id.setProduto(produto);
    }

    public ItemDoPedidoPK getId() {
        return id;
    }

    public Integer getQuantidade() {
        return quantidade;
    }

    public void setQuantidade(Integer quantidade) {
        this.quantidade = quantidade;
    }
}
