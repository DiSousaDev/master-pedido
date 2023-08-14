insert into cliente(cpf, nome, sobrenome) VALUES ('25584217000', 'João', 'Silva');
insert into cliente(cpf, nome, sobrenome) VALUES ('99490470058', 'Carlos', 'Alberto dos Santos');
insert into cliente(cpf, nome, sobrenome) VALUES ('97996301344', 'Joana', 'Marli Louise Costa');
insert into cliente(cpf, nome, sobrenome) VALUES ('01930100205', 'Daniela', 'Aparecida Teixeira');
insert into cliente(cpf, nome, sobrenome) VALUES ('52729803017', 'Cauê', 'Miguel Alexandre Viana');

insert into produto(descricao) VALUES ('Caneta Esferográfica Gel com Ponta Fina');
insert into produto(descricao) VALUES ('Caderno Universitário Capa Dura');
insert into produto(descricao) VALUES ('Conjunto de Marcadores de Texto Neon');
insert into produto(descricao) VALUES ('Papel Sulfite A4 de Alta Qualidade (Pacote co');
insert into produto(descricao) VALUES ('Kit de Lápis de Cor Profissional com 36 Cores');
insert into produto(descricao) VALUES ('Bloco de Notas Autoadesivas (Post-it) em Core');
insert into produto(descricao) VALUES ('Estojo Escolar com Zíper e Compartimentos');
insert into produto(descricao) VALUES ('Conjunto de Canetas Nanquim para Desenho Técn');
insert into produto(descricao) VALUES ('Planner Semanal para Organização e Planejamen');
insert into produto(descricao) VALUES ('Grampeador Compacto e Conjunto de Grampos Col');

insert into pedido(id_cliente, data) VALUES (1, '2023-08-13T22:31:12.124');
insert into pedido(id_cliente, data) VALUES (3, '2023-08-13T23:15:44.470');
insert into pedido(id_cliente, data) VALUES (5, '2023-08-13T23:09:11.211');
insert into pedido(id_cliente, data) VALUES (2, '2023-08-13T22:51:12.374');
insert into pedido(id_cliente, data) VALUES (3, '2023-08-13T22:59:33.635');
insert into pedido(id_cliente, data) VALUES (5, '2023-08-13T23:33:19.415');
insert into pedido(id_cliente, data) VALUES (1, '2023-08-13T23:12:08.111');

insert into item_do_pedido(id_pedido, id_produto, quantidade) VALUES (1, 1, 1);
insert into item_do_pedido(id_pedido, id_produto, quantidade) VALUES (1, 2, 2);
insert into item_do_pedido(id_pedido, id_produto, quantidade) VALUES (1, 10, 3);
insert into item_do_pedido(id_pedido, id_produto, quantidade) VALUES (2, 8, 4);
insert into item_do_pedido(id_pedido, id_produto, quantidade) VALUES (3, 9, 5);
insert into item_do_pedido(id_pedido, id_produto, quantidade) VALUES (4, 7, 6);
insert into item_do_pedido(id_pedido, id_produto, quantidade) VALUES (4, 6, 7);
insert into item_do_pedido(id_pedido, id_produto, quantidade) VALUES (5, 4, 2);
insert into item_do_pedido(id_pedido, id_produto, quantidade) VALUES (5, 5, 1);
insert into item_do_pedido(id_pedido, id_produto, quantidade) VALUES (5, 3, 4);
insert into item_do_pedido(id_pedido, id_produto, quantidade) VALUES (6, 9, 3);
insert into item_do_pedido(id_pedido, id_produto, quantidade) VALUES (7, 4, 6);
insert into item_do_pedido(id_pedido, id_produto, quantidade) VALUES (7, 1, 1);

