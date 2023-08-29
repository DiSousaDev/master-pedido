import { ComponentFixture, TestBed } from '@angular/core/testing';

import { PesquisarPedidoComponent } from './pesquisar-pedido.component';

describe('PesquisarPedidoComponent', () => {
  let component: PesquisarPedidoComponent;
  let fixture: ComponentFixture<PesquisarPedidoComponent>;

  beforeEach(() => {
    TestBed.configureTestingModule({
      declarations: [PesquisarPedidoComponent]
    });
    fixture = TestBed.createComponent(PesquisarPedidoComponent);
    component = fixture.componentInstance;
    fixture.detectChanges();
  });

  it('should create', () => {
    expect(component).toBeTruthy();
  });
});
