package br.com.masterpedido.controllers;

import br.com.masterpedido.dto.cliente.ClienteFullDTO;
import br.com.masterpedido.dto.pedido.PedidoFullDTO;
import br.com.masterpedido.dto.pedido.PedidoRequest;
import br.com.masterpedido.dto.pedido.PedidoResponse;
import br.com.masterpedido.services.PedidoService;
import jakarta.validation.Valid;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.CrossOrigin;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.servlet.support.ServletUriComponentsBuilder;

import java.net.URI;

@CrossOrigin(origins = "http://localhost:4200")
@RestController
@RequestMapping("/pedidos")
public class PedidoController {

    private final Logger log = LoggerFactory.getLogger(PedidoController.class);
    private final PedidoService pedidoService;

    public PedidoController(PedidoService pedidoService) {
        this.pedidoService = pedidoService;
    }

    @GetMapping("/{cpf}")
    public ResponseEntity<PedidoResponse> buscarPedidosPorCpf(@PathVariable String cpf) {
        log.info("Controller :: Buscando pedidos do cliente de CPF {}", cpf);
        return ResponseEntity.ok(pedidoService.buscarPorCpf(cpf));
    }

    @PostMapping
    public ResponseEntity<PedidoFullDTO> cadastrar(@RequestBody @Valid PedidoRequest request) {
        log.info("Controller :: Cadastrando pedido {}", request);
        PedidoFullDTO obj = pedidoService.salvar(request);
        URI uri = ServletUriComponentsBuilder.fromCurrentRequest().path("/{id}")
                .buildAndExpand(obj.idPedido()).toUri();
        log.info("Pedido {} cadastrado com sucesso.", obj);
        return ResponseEntity.created(uri).body(obj);
    }

}
