package br.com.masterpedido.controllers;

import br.com.masterpedido.dto.produto.ProdutoFullDTO;
import br.com.masterpedido.dto.produto.ProdutoRequest;
import br.com.masterpedido.dto.produto.ProdutoUpdateRequest;
import br.com.masterpedido.services.ProdutoService;
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
@RequestMapping("/produtos")
public class ProdutoController {

    private final Logger log = LoggerFactory.getLogger(ProdutoController.class);
    private final ProdutoService produtoService;

    public ProdutoController(ProdutoService produtoService) {
        this.produtoService = produtoService;
    }

    @GetMapping
    public ResponseEntity<Page<ProdutoFullDTO>> buscarProdutos(@PageableDefault(
            size = 6,
            sort = "descricao",
            direction = Sort.Direction.DESC
    ) Pageable pageable) {
        return ResponseEntity.ok(produtoService.listarTodos(pageable));
    }

    @GetMapping(value = "/{id}")
    public ResponseEntity<ProdutoFullDTO> buscarPorId(@PathVariable Integer id) {
        return ResponseEntity.ok(produtoService.buscarPorId(id));
    }

    @PostMapping
    public ResponseEntity<ProdutoFullDTO> cadastrar(@RequestBody @Valid ProdutoRequest request) {
        ProdutoFullDTO obj = produtoService.salvar(request);
        URI uri = ServletUriComponentsBuilder.fromCurrentRequest().path("/{id}")
                .buildAndExpand(obj.id()).toUri();
        log.info("Produto {} cadastrado com sucesso.", obj);
        return ResponseEntity.created(uri).body(obj);
    }

    @PutMapping(value = "/{id}")
    public ResponseEntity<ProdutoFullDTO> atualizar(@PathVariable Integer id, @RequestBody @Valid ProdutoUpdateRequest request) {
        return ResponseEntity.ok(produtoService.atualizar(id, request));
    }

    @DeleteMapping(value = "/{id}")
    public ResponseEntity<Void> excluir(@PathVariable Integer id) {
        produtoService.deletarPorId(id);
        return ResponseEntity.noContent().build();
    }

}
