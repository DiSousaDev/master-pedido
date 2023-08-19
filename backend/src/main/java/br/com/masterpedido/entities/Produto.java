package br.com.masterpedido.entities;

import br.com.masterpedido.dto.produto.ProdutoFullDTO;
import br.com.masterpedido.dto.produto.ProdutoRequest;
import br.com.masterpedido.dto.produto.ProdutoUpdateRequest;
import jakarta.persistence.Column;
import jakarta.persistence.Entity;
import jakarta.persistence.GeneratedValue;
import jakarta.persistence.GenerationType;
import jakarta.persistence.Id;
import jakarta.persistence.OneToMany;

import java.util.HashSet;
import java.util.Set;

@Entity
public class Produto {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Integer id;

    @Column(columnDefinition = "VARCHAR(45)")
    private String descricao;

    @OneToMany(mappedBy = "id.produto")
    private final Set<ItemDoPedido> itens = new HashSet<>();

    public Produto() {
    }

    public Produto(ProdutoFullDTO produtoFullDTO) {
        id = produtoFullDTO.id();
        descricao = produtoFullDTO.descricao();
    }

    public Produto(ProdutoRequest request) {
        descricao = request.descricao();
    }

    public Produto(Integer id, ProdutoUpdateRequest request) {
        this.id = id;
        descricao = request.descricao();
    }

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public String getDescricao() {
        return descricao;
    }

    public void setDescricao(String descricao) {
        this.descricao = descricao;
    }

    public Set<ItemDoPedido> getItens() {
        return itens;
    }
}
