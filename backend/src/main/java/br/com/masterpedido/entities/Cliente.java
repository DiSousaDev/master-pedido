package br.com.masterpedido.entities;

import br.com.masterpedido.dto.cliente.ClienteFullDTO;
import br.com.masterpedido.dto.cliente.ClienteRequest;
import br.com.masterpedido.dto.cliente.ClienteUpdateRequest;
import jakarta.persistence.Column;
import jakarta.persistence.Entity;
import jakarta.persistence.GeneratedValue;
import jakarta.persistence.GenerationType;
import jakarta.persistence.Id;
import jakarta.persistence.OneToMany;

import java.io.Serializable;
import java.util.ArrayList;
import java.util.List;

@Entity
public class Cliente implements Serializable {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Integer id;

    @Column(columnDefinition = "VARCHAR(11)")
    private String cpf;

    @Column(columnDefinition = "VARCHAR(30)")
    private String nome;

    @Column(columnDefinition = "VARCHAR(50)")
    private String sobrenome;
    @OneToMany(mappedBy = "cliente")
    private final List<Pedido> pedidos = new ArrayList<>();

    public Cliente() {
    }

    public Cliente(ClienteFullDTO clienteFullDTO) {
        cpf = clienteFullDTO.cpf();
        nome = clienteFullDTO.nome();
        sobrenome = clienteFullDTO.sobrenome();
    }

    public Cliente(ClienteRequest clienteRequest) {
        cpf = clienteRequest.cpf();
        nome = clienteRequest.nome();
        sobrenome = clienteRequest.sobrenome();
    }

    public Cliente(Integer id, ClienteUpdateRequest clienteUpdateRequest) {
        this.id = id;
        cpf = clienteUpdateRequest.cpf();
        nome = clienteUpdateRequest.nome();
        sobrenome = clienteUpdateRequest.sobrenome();
    }

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public String getCpf() {
        return cpf;
    }

    public void setCpf(String cpf) {
        this.cpf = cpf;
    }

    public String getNome() {
        return nome;
    }

    public void setNome(String nome) {
        this.nome = nome;
    }

    public String getSobrenome() {
        return sobrenome;
    }

    public void setSobrenome(String sobrenome) {
        this.sobrenome = sobrenome;
    }

    public List<Pedido> getPedidos() {
        return pedidos;
    }

}
