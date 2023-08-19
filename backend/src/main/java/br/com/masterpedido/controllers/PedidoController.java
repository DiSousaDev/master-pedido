package br.com.masterpedido.controllers;

import br.com.masterpedido.dto.pedido.PedidoFullDTO;
import br.com.masterpedido.services.PedidoService;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import java.util.List;

@RestController
@RequestMapping("/pedidos")
public class PedidoController {

    private final Logger log = LoggerFactory.getLogger(PedidoController.class);
    private final PedidoService pedidoService;

    public PedidoController(PedidoService pedidoService) {
        this.pedidoService = pedidoService;
    }

    @GetMapping("/{cpf}")
    public ResponseEntity<List<PedidoFullDTO>> buscarPedidosPorCpf(@PathVariable String cpf) {
        log.info("Controller :: Buscando pedidos do cliente de CPF {}", cpf);
        return ResponseEntity.ok(pedidoService.buscarPorCpf(cpf));
    }

}
