import { ComponentFixture, TestBed } from '@angular/core/testing';

import { InserirProdutoComponent } from './inserir-produto.component';

describe('InserirProdutoComponent', () => {
  let component: InserirProdutoComponent;
  let fixture: ComponentFixture<InserirProdutoComponent>;

  beforeEach(() => {
    TestBed.configureTestingModule({
      declarations: [InserirProdutoComponent]
    });
    fixture = TestBed.createComponent(InserirProdutoComponent);
    component = fixture.componentInstance;
    fixture.detectChanges();
  });

  it('should create', () => {
    expect(component).toBeTruthy();
  });
});
