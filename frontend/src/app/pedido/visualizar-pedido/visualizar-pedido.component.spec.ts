import { ComponentFixture, TestBed } from '@angular/core/testing';

import { VisualizarPedidoComponent } from './visualizar-pedido.component';

describe('VisualizarPedidoComponent', () => {
  let component: VisualizarPedidoComponent;
  let fixture: ComponentFixture<VisualizarPedidoComponent>;

  beforeEach(() => {
    TestBed.configureTestingModule({
      declarations: [VisualizarPedidoComponent]
    });
    fixture = TestBed.createComponent(VisualizarPedidoComponent);
    component = fixture.componentInstance;
    fixture.detectChanges();
  });

  it('should create', () => {
    expect(component).toBeTruthy();
  });
});
