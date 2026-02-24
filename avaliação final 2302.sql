create database solucaoSql;
use solucaoSql;

/*Questão 1 tabela categoria criada*/
create table tabCategoria (
codCategoria int not null auto_increment,
nomeCategoria varchar(100),

constraint pkcodCategoria primary key (codCategoria));

/*Questão 2 tabela clientes criada*/
create table tabClientes(
codCliente int not null auto_increment,
nomeCliente varchar(100),
emailCliente varchar(100),
cidadeCliente varchar(100),
dataCadastro date,

constraint pkcodCliente primary key (codCliente));

/*Questão 3 tabela vendedor criada*/
create table tabVendedor(
codVendedor int not null auto_increment,
nomeVendedor varchar(100),
comissao decimal(5,2),
dataAdmissao date,

constraint pkcodVendedor primary key (codVendedor));

/*Questão 4 tabela produtos criada*/
create table tabProdutos(
codProdutos int not null auto_increment,
nomeProduto varchar(100),
precoProduto decimal(10,2),
estoque int,
codCategoria int,

constraint pkcodProdutos primary key (codProdutos),
constraint fkcodCategoria foreign key (codCategoria) references tabCategoria(codCategoria));

/*Questão 5 tabela pedidos criada*/
create table tabPedidos (
codPedidos int not null auto_increment,
dataPedidos date,
codCliente int,
codVendedor int,
total decimal(10,2),

constraint pkcodPedidos primary key (codPedidos),
constraint fkcodCliente foreign key (codCliente) references tabClientes(codCliente),
constraint fkcodVendedor foreign key (codVendedor) references tabVendedor(codVendedor));

/* questão 6: adicionar telefone na tabela clientes */
alter table tabclientes add telefone varchar(20);

/* questão 7: renomear coluna comissao para percentual_ganho */
alter table tabvendedor change comissao percentual_ganho decimal(5,2);

/* questão 8: cadastrar 5 categorias */
insert into tabcategoria (nomecategoria) values
('hardware'),('software'),('periféricos'),('redes'),('acessórios');

/* questão 9: cadastrar 10 clientes */
insert into tabclientes (nomecliente, emailcliente, cidadecliente, datacadastro, telefone) values
('maria silva','maria@gmail.com','muriaé','2026-01-10','32999990001'),('joão souza','joao@hotmail.com','cataguases','2026-01-12','32999990002'),
('ana costa','ana@outlook.com','viçosa','2026-01-15','32999990003'),('carlos lima','carlos@gmail.com','ubá','2026-01-18','32999990004'),
('fernanda alves','fernanda@yahoo.com','muriaé','2026-01-20','32999990005'),('bruno rocha','bruno@gmail.com','cataguases','2026-01-22','32999990006'),
('patricia gomes','patricia@outlook.com','ubá','2026-01-25','32999990007'),('lucas martins','lucas@gmail.com','viçosa','2026-01-28','32999990008'),
('juliana ribeiro','juliana@gmail.com','muriaé','2026-02-01','32999990009'),('rafael mendes','rafael@hotmail.com','cataguases','2026-02-05','32999990010');

/* questão 10: cadastrar 10 produtos */
insert into tabprodutos (nomeproduto, precoproduto, estoque, codcategoria) values
('notebook dell',3500.00,10,1),('mouse gamer',150.00,20,3),('teclado mecânico',400.00,15,3),('monitor 24',1200.00,8,1),
('switch 8 portas',300.00,12,4),('antivírus',200.00,50,2),('hd externo 1tb',500.00,6,1),('cabo hdmi',50.00,100,5),
('roteador wifi',450.00,9,4),('placa de vídeo',5000.00,5,1);

/* questão 11: cadastrar 5 vendedores */
insert into tabvendedor (nomevendedor, percentual_ganho, dataadmissao) values
('pedro henrique',0.10,'2024-01-10'),('larissa souza',0.12,'2023-03-15'),('marcos paulo',0.15,'2022-06-20'),
('camila rocha',0.08,'2025-02-01'),('eduardo lima',0.20,'2021-11-05');

/* questão 12: registrar 10 pedidos */
insert into tabpedidos (datapedidos, codcliente, codvendedor, total) values
('2026-01-15',1,1,3500.00),('2026-01-20',2,2,150.00),('2026-01-22',3,3,1200.00),('2026-01-25',4,1,500.00),('2026-01-28',5,4,300.00),
('2026-02-01',6,5,450.00),('2026-02-05',7,2,200.00),('2026-02-07',8,3,400.00),('2026-02-10',9,1,5000.00),('2026-02-12',10,4,50.00);

/* questão 13: aumentar preço da categoria hardware em 10% */
update tabprodutos  set precoproduto = precoproduto * 1.10 where codcategoria = 1;

/* questão 14: alterar email de um cliente */
update tabclientes set emailcliente = 'novoemail@gmail.com' where codcliente = 1;

/* questão 15: atualizar estoque de um produto para zero */
update tabprodutos set estoque = 0 where codprodutos = 2;

/* questão 16: remover pedido cancelado */
delete from tabpedidos where codpedidos = 1;

/* questão 17: remover produtos com preço menor que 1 real */
delete from tabprodutos where precoproduto < 1.00;

/* questão 18: adicionar cpf único na tabela vendedor */
alter table tabvendedor add cpf varchar(14);

/* questão 19: atualizar cidade muriaé para muriaé-mg */
update tabclientes set cidadecliente = 'muriaé-mg' where cidadecliente = 'muriaé';

/* questão 20: adicionar produto de 5000 com estoque 5 */
insert into tabprodutos (nomeproduto, precoproduto, estoque, codcategoria) values ('servidor dedicado', 5000.00, 5, 1);

/* questão 21: remover vendedor que saiu da equipe */
/*Tive que apagar primeiro os pedidos*/
delete from tabpedidos where codvendedor = 5;
delete from tabvendedor where codvendedor = 5;
delete from tabvendedor where codvendedor = 5;

/* questão 22: adicionar coluna observacao em pedidos */
alter table tabpedidos add observacao varchar(100);

/* questão 23: criar tabela temporária fornecedores_teste */
create table fornecedores_teste (
codFor int not null auto_increment,
nome varchar(100),

constraint pkcodfor primary key (codfor));

/* questão 24: excluir tabela fornecedores_teste */
drop table fornecedores_teste;

/* questão 25: alterar nome da categoria hardware */
update tabcategoria set nomecategoria = 'componentes internos' where nomecategoria = 'hardware';

/* questão 26: cadastrar cliente ana tech com data de hoje */
insert into tabclientes (nomecliente, emailcliente, cidadecliente, datacadastro, telefone) values ('ana tech', 'anatech@gmail.com', 'muriaé', '2026-02-23', '32999999999');

/* questão 27: definir comissão fixa de 15% */
update tabvendedor set percentual_ganho = 0.15;

/* questão 28: remover clientes com email nulo */
delete from tabclientes where emailcliente is null;

/* questão 29: modificar tipo da coluna total */
alter table tabpedidos modify total decimal(15,2);

/* questão 30: adicionar pedido do primeiro cliente para o último vendedor */
insert into tabpedidos (datapedidos, codcliente, codvendedor, total) values ('2026-02-23', 1, 4, 60.00);

/* questão 31: listar todos os produtos e preços */
select nomeproduto, precoproduto from tabprodutos;

/* questão 32: produtos acima de 2000 */
select * from tabprodutos where precoproduto > 2000;

/* questão 33: clientes que começam com m */
select * from tabclientes where nomecliente like 'm%';

/* questão 34: pedidos entre duas datas */
select * from tabpedidos where datapedidos between '2026-01-01' and '2026-02-15';

/* questão 35: produtos do menor para o maior preço */
select * from tabprodutos order by precoproduto asc;

/* questão 36: estoque baixo e preço alto */
select * from tabprodutos where estoque < 5 and precoproduto > 500;

/* questão 37: clientes de muriaé ou cataguases */
select * from tabclientes where cidadecliente = 'muriaé' or cidadecliente = 'cataguases';

/* questão 38: total de clientes */
select count(*) as total_clientes from tabclientes;

/* questão 39: soma total das vendas */
select sum(total) as total_vendas from tabpedidos;

/* questão 40: média de preço dos produtos */
select avg(precoproduto) as media_preco from tabprodutos;

/* questão 41: usar alias */
select nomeproduto as 'Nome Item', precoproduto as 'Preço Venda' from tabprodutos;

/* questão 42: clientes por cidade */
select cidadecliente, count(*) as total from tabclientes group by cidadecliente;

/* questão 43: produto com sua categoria */
select nomeproduto, nomecategoria from tabprodutos 
inner join tabcategoria on tabprodutos.codcategoria = tabcategoria.codcategoria;

/* questão 44: pedido com nome do cliente */
select codpedidos, nomecliente from tabpedidos 
inner join tabclientes on tabpedidos.codcliente = tabclientes.codcliente;

/* questão 45: vendedor e total da venda */
select nomevendedor, total from tabpedidos 
inner join tabvendedor on tabpedidos.codvendedor = tabvendedor.codvendedor;

/* questão 46: clientes com email outlook */
select *  from tabclientes where emailcliente like '%@outlook.com';

/* questão 47: quantidade de produtos por categoria */
select codcategoria, count(*) as total_produtos from tabprodutos group by codcategoria;

/* questão 48: faturamento por vendedor */
select codvendedor, sum(total) as faturamento from tabpedidos group by codvendedor;

/* questão 49: relatório cliente, data e vendedor */
select nomecliente, datapedidos, nomevendedor from tabpedidos
inner join tabclientes on tabpedidos.codcliente = tabclientes.codcliente
inner join tabvendedor on tabpedidos.codvendedor = tabvendedor.codvendedor;

/* questão 50: vendedores mais antigos */
select * from tabvendedor order by dataadmissao asc;

/* questão 51: produtos que não são da categoria 1 */
select * from tabprodutos where codcategoria <> 1;

/* questão 52: vendedores com comissão entre 10% e 20% */
select * from tabvendedor where percentual_ganho between 0.10 and 0.20;

/* questão 53: média das vendas */
select avg(total) as media_faturamento from tabpedidos;

/* questão 54: cidades sem repetição */
select distinct cidadecliente from tabclientes;

/* questão 55: pedidos de um vendedor específico */
select * from tabpedidos where codvendedor = 1;

/* questão 56: valor total investido no estoque */
select sum(precoProduto * estoque) as 'Total Estoque' from tabprodutos;

/* questão 57: cidades com mais clientes */
select cidadecliente, count(*) as 'Total' from tabclientes group by cidadecliente order by total desc;

/* questão 58: pedidos de fevereiro acima de 1000 */
select * from tabpedidos where datapedidos between '2026-02-01' and '2026-02-28' and total > 1000;

/* questão 59: pedidos de clientes com s/a no nome */
select *from tabpedidos 
inner join tabclientes on tabpedidos.codcliente = tabclientes.codcliente 
where tabclientes.nomecliente like '%s/a%';

/* questão 60: relatório completo das vendas */
select nomecliente, nomeproduto, precoproduto, nomevendedor from tabpedidos
inner join tabclientes on tabpedidos.codcliente = tabclientes.codcliente
inner join tabvendedor on tabpedidos.codvendedor = tabvendedor.codvendedor
inner join tabprodutos on tabprodutos.codcategoria = tabprodutos.codcategoria;