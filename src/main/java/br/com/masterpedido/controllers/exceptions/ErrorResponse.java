package br.com.masterpedido.controllers.exceptions;

import org.springframework.validation.FieldError;

public record ErrorResponse(String fieldError, String fieldMessage) {

    public ErrorResponse(FieldError errors) {
        this(errors.getField(), errors.getDefaultMessage());
    }
}
