package br.com.masterpedido.controllers;

import br.com.masterpedido.dto.cliente.ClienteFullDTO;
import br.com.masterpedido.dto.cliente.ClienteRequest;
import br.com.masterpedido.dto.cliente.ClienteUpdateRequest;
import br.com.masterpedido.services.ClienteService;
import jakarta.validation.Valid;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.data.domain.Sort;
import org.springframework.data.web.PageableDefault;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.CrossOrigin;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.PutMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.servlet.support.ServletUriComponentsBuilder;

import java.net.URI;

@CrossOrigin(origins = "http://localhost:4200")
@RestController
@RequestMapping("/clientes")
public class ClienteController {

    private final Logger log = LoggerFactory.getLogger(ClienteController.class);
    private final ClienteService clienteService;

    public ClienteController(ClienteService clienteService) {
        this.clienteService = clienteService;
    }

    @GetMapping
    public ResponseEntity<Page<ClienteFullDTO>> buscarClientes(@PageableDefault(
            size = 6,
            sort = "nome",
            direction = Sort.Direction.DESC
    ) Pageable pageable) {
        return ResponseEntity.ok(clienteService.listarTodos(pageable));
    }

    @GetMapping(value = "/{id}")
    public ResponseEntity<ClienteFullDTO> buscarPorId(@PathVariable Integer id) {
        System.out.println("LISTANDO CLIENTE ID: " + id);
        return ResponseEntity.ok(clienteService.buscarPorId(id));
    }

    @GetMapping(value = "busca-cpf/{cpf}")
    public ResponseEntity<ClienteFullDTO> buscarPorCpf(@PathVariable String cpf) {
        return ResponseEntity.ok(clienteService.buscarPorCpf(cpf));
    }

    @PostMapping
    public ResponseEntity<ClienteFullDTO> cadastrar(@RequestBody @Valid ClienteRequest request) {
        ClienteFullDTO obj = clienteService.salvar(request);
        URI uri = ServletUriComponentsBuilder.fromCurrentRequest().path("/{id}")
                .buildAndExpand(obj.idCliente()).toUri();
        log.info("Cliente {} cadastrado com sucesso.", obj);
        return ResponseEntity.created(uri).body(obj);
    }

    @PutMapping(value = "/{id}")
    public ResponseEntity<ClienteFullDTO> atualizarCliente(@PathVariable Integer id, @RequestBody @Valid ClienteUpdateRequest request) {
        System.out.println("ATUALIZANDO CLIENTE ID: " + id + " request: " + request);
        return ResponseEntity.ok(clienteService.atualizar(id, request));
    }

    @DeleteMapping(value = "/{id}")
    public ResponseEntity<Void> excluirCliente(@PathVariable Integer id) {
        clienteService.deletarPorId(id);
        return ResponseEntity.noContent().build();
    }

}
