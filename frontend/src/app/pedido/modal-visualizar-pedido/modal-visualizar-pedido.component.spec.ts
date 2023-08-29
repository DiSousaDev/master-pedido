import { ComponentFixture, TestBed } from '@angular/core/testing';

import { ModalVisualizarPedidoComponent } from './modal-visualizar-pedido.component';

describe('ModalVisualizarPedidoComponent', () => {
  let component: ModalVisualizarPedidoComponent;
  let fixture: ComponentFixture<ModalVisualizarPedidoComponent>;

  beforeEach(() => {
    TestBed.configureTestingModule({
      declarations: [ModalVisualizarPedidoComponent]
    });
    fixture = TestBed.createComponent(ModalVisualizarPedidoComponent);
    component = fixture.componentInstance;
    fixture.detectChanges();
  });

  it('should create', () => {
    expect(component).toBeTruthy();
  });
});
