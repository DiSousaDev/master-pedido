import { Injectable } from '@angular/core';
import { Observable } from "rxjs";
import { environment } from "../../../environments/environment";
import { HttpClient } from "@angular/common/http";
import { CpfRequest } from "../../shared/models/cpf-request.model";
import { PedidoResponse } from "../../shared/models/pedido-response.model";
import { PedidoRequest } from "../../shared/models/pedido-request.model";

@Injectable({
  providedIn: 'root'
})
export class PedidoService {

  private url = `${environment.api}/pedidos`;

  constructor(
    private httpClient: HttpClient
  ) { }

  buscarPorCpf(cpfRequest: CpfRequest): Observable<PedidoResponse> {
    const url = `${this.url}/${cpfRequest.cpf}`
    return this.httpClient.get<PedidoResponse>(url);
  }

  inserir(pedido: PedidoRequest): Observable<any> {
    return this.httpClient.post<any>(this.url, pedido);
  }

}
