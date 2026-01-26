-- criar um banco de dados para o cenário do E-commerce
-- drop database ecommerce;
create database ecommerce;
use ecommerce;

-- criar tabela cliente
create table Client(
	idClient int auto_increment primary key,
    Fname varchar(10) not null,
    Minit char(3),
    Lname varchar(20) not null,
    Aderess varchar(45) not null,
    CPF char(14) default 'PessoaJuridica',
    CNPJ char(14) default 'PessoaFisica',
    Birthday date,
    constraint unique_cpf_client unique (CPF),
    constraint unique_cnpj_client unique (CNPJ)
    );
    
 alter table Client auto_increment=1;

-- criar tabela produto
create table Product(
	idProduct int auto_increment primary key,
    Pname varchar(10),
    Classification_kids bool default false,
    Category ENUM('Electronico', 'Vestimenta', 'Brinquedo', 'Alimentos', 'Moveis') not null,
    Avalation float default 0,
    Size varchar(10),
    Price float
    );
 
  alter table Product auto_increment=1;
 
-- criar tabela pedido
create table Orders(
	idOrder int auto_increment primary key,
    idOrderClient int,
    OrderStatus ENUM('Em andamento', 'Processando', 'Enviando', 'Entregue', 'Calculado') default 'Processando',
	OrderDescription varchar(255),
    SendValue float default 10,
    Payment ENUM('Boleto', 'Pix', 'Cartão') not null,
    constraint fk_orders_client foreign key (idOrderClient) references Client(idClient)
);

 alter table Orders auto_increment=1;
 
 -- criar a tabela que relaciona produto e pedido
create table ProductOrder(
	idOrder int,
    idProduct int,
    Quantity int default 1,
    Statust ENUM('Disponivel', 'Fora de estoque') default 'Disponivel',
    primary key (idOrder, idProduct),
    constraint fk_productorders_order foreign key (idOrder) references Orders(idOrder),
    constraint fk_productorders_product foreign key (idProduct) references Product(idProduct)
);

-- criar tabela estoque
create table ProductStorage(
	idProdStorage int auto_increment primary key,
    Location varchar(255),
    Quantity int default 0
);

 alter table ProductStorage auto_increment=1;
 
 -- criar a tabela que relaciona produto e estoque
create table ProductPStorage(
	idProdStorage int,
    idProduct int,
    Quantity int default 0,
    primary key (idProdStorage, idProduct),
    constraint fk_productpstorage_pstorage foreign key (idProdStorage) references ProductStorage(idProdStorage),
    constraint fk_productpstorage_product foreign key (idProduct) references Product(idProduct)
);

-- criar tabela fornecedor
create table Supplier(
	idSupplier int primary key auto_increment not null,
    SocialName varchar(255) not null,
    CNPJ char(14) not null,
    Contact char(11) not null,
    constraint unique_cnpj_supplier unique (CNPJ)
);

 alter table Supplier auto_increment=1;
 
 -- criar a tabela que relaciona produto e fornecedor
create table ProductSupplier(
	idSupplier int,
    idProduct int,
    Quantity int default 0,
    primary key (idSupplier, idProduct),
    constraint fk_productsupplier_supplier foreign key (idSupplier) references Supplier(idSupplier),
    constraint fk_productsupplier_product foreign key (idProduct) references Product(idProduct)
);

-- criar tabela vendedor
create table Seller(
	idSeller int primary key auto_increment not null,
    SocialName varchar(255) not null,
    CNPJ char(14),
    CPF char(11),
    Contact char(11) not null,
    Location varchar(255),
    constraint unique_cnpj_seller unique (CNPJ),
    constraint unique_cpf_seller unique (CPF)
);

 alter table Seller auto_increment=1;

-- criar a tabela que relaciona produto e terceir vendedor
create table ProductSeller(
	idSeller int,
    idProduct int,
    Quantity int default 0,
    primary key (idSeller, idProduct),
    constraint fk_productseller_product foreign key (idProduct) references Product(idProduct),
    constraint fk_productseller_seller foreign key (idSeller) references Seller(idSeller)
);

desc ProductSeller;
show tables;
SELECT * FROM 
    INFORMATION_SCHEMA.TABLE_CONSTRAINTS
WHERE 
    TABLE_SCHEMA = 'ecommerce';
    
 -- populando a tabela clientes
 INSERT INTO Client (Fname, Minit, Lname, Aderess, CPF, CNPJ, Birthday) VALUES
('Ana', 'M', 'Silva', 'Rua das Flores, 123', '11111111111111', NULL, '1990-05-12'),
('Bruno', 'A', 'Santos', 'Av. Brasil, 456', '22222222222222', NULL, '1985-08-23'),
('Carla', 'R', 'Oliveira', 'Rua Central, 78', '33333333333333', NULL, '1992-11-02'),
('Daniel', 'P', 'Costa', 'Rua A, 99', '44444444444444', NULL, '1988-01-15'),
('Eduarda', 'L', 'Pereira', 'Av. Norte, 321', '55555555555555', NULL, '1995-07-30'),
('Felipe', 'G', 'Rodrigues', 'Rua Sul, 654', '66666666666666', NULL, '1991-03-10'),
('Gabriela', 'S', 'Almeida', 'Rua do Sol, 111', '77777777777777', NULL, '1998-12-25'),
('Henrique', 'T', 'Lima', 'Av. Atlântica, 222', '88888888888888', NULL, '1980-09-17'),
('Isabela', 'C', 'Ferreira', 'Rua Verde, 333', '99999999999999', NULL, '1993-06-05'),
('João', 'B', 'Ribeiro', 'Rua Azul, 444', '10101010101010', NULL, '1987-04-19'),
('Lucas', 'A', 'Menezes', 'Av. Comercial, 1000', NULL, '11111111111112', '1982-02-14'),
('Mariana', 'F', 'Teixeira', 'Rua do Comércio, 50', NULL, '22222222222223', '1990-09-09'),
('Rafael', 'C', 'Nogueira', 'Av. Industrial, 800', NULL, '33333333333334', '1985-12-01'),
('Patricia', 'S', 'Gomes', 'Rua Logística, 900', NULL, '44444444444445', '1979-07-21'),
('Anderson', 'L', 'Barbosa', 'Av. das Rodas, 77', NULL, '55555555555556', '1988-04-03'),
('Fernanda', 'M', 'Rocha', 'Rua da Saúde, 12', NULL, '66666666666667', '1993-11-18'),
('Thiago', 'R', 'Araujo', 'Rua do Saber, 34', NULL, '77777777777778', '1986-06-27'),
('Juliana', 'P', 'Farias', 'Av. Obras, 500', NULL, '88888888888889', '1991-01-08'),
('Eduardo', 'G', 'Pinto', 'Rua Criativa, 88', NULL, '99999999999990', '1984-10-30'),
('Camila', 'T', 'Ramos', 'Rua Gourmet, 66', NULL, '12121212121212', '1996-05-16');

desc Client;
SELECT * FROM Client;

-- populando a tabela produtos
INSERT INTO Product (Pname, Classification_kids, Category, Avalation, Size, Price) VALUES
('TVLED', false, 'Electronico', 4.5, NULL, 2499.90),
('Notebook', false, 'Electronico', 4.7, NULL, 3999.00),
('Celular', false, 'Electronico', 4.6, NULL, 2899.99),
('Tablet', false, 'Electronico', 4.4, NULL, 1599.90),
('FoneBT', false, 'Electronico', 4.3, NULL, 299.90),
('Camera', false, 'Electronico', 4.2, NULL, 2199.00),
('Camiseta', false, 'Vestimenta', 4.1, 'M', 59.90),
('Calca', false, 'Vestimenta', 4.0, 'G', 129.90),
('Jaqueta', false, 'Vestimenta', 4.6, 'M', 299.90),
('Tenis', false, 'Vestimenta', 4.5, '42', 399.90),
('Vestido', false, 'Vestimenta', 4.4, 'P', 189.90),
('Moletom', false, 'Vestimenta', 4.3, 'G', 199.90),
('Boneca', true, 'Brinquedo', 4.8, NULL, 89.90),
('Carrinho', true, 'Brinquedo', 4.7, NULL, 59.90),
('LegoBox', true, 'Brinquedo', 4.9, NULL, 249.90),
('QuebraCab', true, 'Brinquedo', 4.6, NULL, 39.90),
('Patinete', true, 'Brinquedo', 4.5, NULL, 299.90),
('JogoMesa', true, 'Brinquedo', 4.4, NULL, 149.90),
('Arroz', false, 'Alimentos', 4.3, '5kg', 24.90),
('Feijao', false, 'Alimentos', 4.2, '1kg', 8.90),
('Macarrao', false, 'Alimentos', 4.1, '500g', 6.50),
('Chocolate', false, 'Alimentos', 4.6, '200g', 12.90),
('Biscoito', false, 'Alimentos', 4.0, '300g', 4.90),
('Suco', false, 'Alimentos', 4.2, '1L', 7.50),
('Sofa', false, 'Moveis', 4.5, '3L', 1899.00),
('Mesa', false, 'Moveis', 4.4, '6L', 999.90),
('Cadeira', false, 'Moveis', 4.3, NULL, 199.90),
('GuardaR', false, 'Moveis', 4.6, 'Casal', 2499.00),
('Estante', false, 'Moveis', 4.2, NULL, 499.90),
('CamaBox', false, 'Moveis', 4.7, 'Queen', 3299.00);

SELECT * FROM Product;

-- populando tabela pedidos
INSERT INTO Orders (idOrderClient, OrderStatus, OrderDescription, SendValue, Payment)
VALUES
(1, 'Processando', 'Compra de TVLED e FoneBT', 25.00, 'Cartão'),
(1, 'Entregue', 'Notebook', 20.00, 'Pix'),
(2, 'Enviando', 'Camiseta e Calca', 15.00, 'Boleto'),
(3, 'Entregue', 'Boneca e Carrinho', 10.00, 'Pix'),
(3, 'Processando', 'LegoBox', 12.00, 'Cartão'),
(3, 'Calculado', 'JogoMesa', 10.00, 'Boleto'),
(4, 'Processando', 'Celular e FoneBT', 18.00, 'Cartão'),
(5, 'Calculado', 'Arroz, Feijao e Macarrao', 12.00, 'Boleto'),
(5, 'Entregue', 'Chocolate e Biscoito', 10.00, 'Pix'),
(6, 'Em andamento', 'Tablet', 15.00, 'Pix'),
(7, 'Entregue', 'Sofa e Mesa', 35.00, 'Cartão'),
(7, 'Enviando', 'Cadeira', 25.00, 'Cartão'),
(8, 'Enviando', 'Estante', 20.00, 'Boleto'),
(9, 'Processando', 'Vestido e Jaqueta', 15.00, 'Pix'),
(10, 'Entregue', 'Tenis e Moletom', 10.00, 'Cartão'),
(10, 'Processando', 'Camiseta', 10.00, 'Pix'),
(11, 'Processando', 'Notebook e Tablet', 30.00, 'Cartão'),
(12, 'Em andamento', 'TVLED', 20.00, 'Pix'),
(13, 'Enviando', 'LegoBox e JogoMesa', 18.00, 'Cartão'),
(14, 'Entregue', 'GuardaR e CamaBox', 40.00, 'Boleto'),
(15, 'Calculado', 'Chocolate e Suco', 10.00, 'Pix'),
(15, 'Processando', 'Macarrao', 10.00, 'Boleto'),
(16, 'Processando', 'Camera e FoneBT', 22.00, 'Cartão'),
(17, 'Em andamento', 'Patinete', 15.00, 'Pix'),
(18, 'Enviando', 'Jaqueta e Vestido', 20.00, 'Cartão'),
(19, 'Entregue', 'Suco e Macarrao', 10.00, 'Boleto'),
(20, 'Processando', 'Mesa e Cadeira', 30.00, 'Cartão');


SELECT * FROM Orders;

-- populando tabela produto pedido
INSERT INTO ProductOrder (idOrder, idProduct, Quantity, Statust) 
VALUES
(1, 1, 1, 'Disponivel'),
(1, 5, 2, 'Disponivel'),
(2, 2, 1, 'Disponivel'),
(3, 7, 2, 'Disponivel'),
(3, 8, 1, 'Disponivel'),
(4, 13, 1, 'Disponivel'),
(4, 14, 1, 'Disponivel'),
(5, 15, 1, 'Disponivel'),
(6, 18, 1, 'Fora de estoque'),
(7, 3, 1, 'Disponivel'),
(7, 5, 1, 'Disponivel'),
(8, 19, 2, 'Disponivel'),
(8, 20, 1, 'Disponivel'),
(8, 21, 3, 'Disponivel'),
(9, 22, 2, 'Disponivel'),
(10, 4, 1, 'Disponivel'),
(11, 25, 1, 'Disponivel'),
(11, 26, 1, 'Disponivel'),
(12, 27, 2, 'Disponivel'),
(13, 29, 1, 'Disponivel'),
(14, 11, 1, 'Disponivel'),
(14, 9, 1, 'Disponivel'),
(15, 10, 1, 'Disponivel'),
(15, 12, 1, 'Disponivel'),
(16, 7, 1, 'Disponivel'),
(17, 2, 1, 'Disponivel'),
(17, 4, 1, 'Disponivel'),
(18, 1, 1, 'Disponivel'),
(19, 15, 1, 'Disponivel'),
(19, 18, 1, 'Disponivel'),
(20, 28, 1, 'Disponivel'),
(20, 30, 1, 'Disponivel'),
(21, 22, 2, 'Disponivel'),
(22, 21, 1, 'Fora de estoque'),
(23, 6, 1, 'Disponivel'),
(23, 5, 1, 'Disponivel'),
(24, 17, 1, 'Disponivel'),
(25, 9, 1, 'Disponivel'),
(25, 10, 1, 'Disponivel'),
(26, 24, 2, 'Disponivel'),
(27, 26, 1, 'Disponivel'),
(27, 25, 1, 'Disponivel');

-- populando tabela estoque
INSERT INTO ProductStorage (Location, Quantity) VALUES
('Sao Paulo', 1000),
('Rio de Janeiro', 800),
('Minas Gerais', 600),
('Parana', 500),
('Bahia', 400);

-- populando tabela estoque produto
INSERT INTO ProductPStorage (idProdStorage, idProduct, Quantity) VALUES
(1, 1, 50),
(1, 2, 40),
(1, 3, 60),
(1, 4, 35),
(1, 5, 80),
(1, 6, 30),
(1, 7, 100),
(1, 8, 90),
(1, 9, 70),
(1, 10, 60),
(2, 1, 30),
(2, 2, 25),
(2, 5, 50),
(2, 7, 70),
(2, 10, 45),
(2, 13, 60),
(2, 14, 55),
(2, 15, 40),
(2, 18, 35),
(3, 3, 40),
(3, 4, 30),
(3, 6, 25),
(3, 11, 50),
(3, 12, 45),
(3, 19, 100),
(3, 20, 90),
(3, 21, 110),
(3, 22, 80),
(4, 9, 50),
(4, 10, 40),
(4, 16, 30),
(4, 17, 25),
(4, 23, 60),
(4, 24, 55),
(4, 25, 35),
(4, 26, 30),
(5, 13, 45),
(5, 14, 40),
(5, 15, 35),
(5, 18, 20),
(5, 27, 25),
(5, 28, 30),
(5, 29, 15),
(5, 30, 10);

-- populando tabela fornecedor
INSERT INTO Supplier (SocialName, CNPJ, Contact) VALUES
('Tech Brasil LTDA',      '90000000000001', '11988887777'),
('Eletron Plus SA',       '90000000000002', '21977776666'),
('Moda Urbana ME',        '90000000000003', '31966665555'),
('Fashion Style LTDA',    '90000000000004', '11955554444'),
('Brinquedos Alegria SA', '90000000000005', '21944443333'),
('Kids World LTDA',       '90000000000006', '31933332222'),
('Alimentos BomGosto',    '90000000000007', '11922221111'),
('Sabor Caseiro LTDA',    '90000000000008', '21911110000'),
('Moveis Prime SA',       '90000000000009', '31900009999'),
('Casa & Conforto LTDA',  '90000000000010', '11912341234');


-- populando tabela fornecedor produto
INSERT INTO ProductSupplier (idSupplier, idProduct, Quantity) VALUES
(1, 1, 100),
(1, 2, 80),
(1, 3, 90),
(2, 4, 70),
(2, 5, 120),
(2, 6, 60),
(3, 7, 200),
(3, 8, 150),
(4, 9, 100),
(4, 10, 120),
(4, 11, 90),
(3, 12, 110),
(5, 13, 140),
(5, 14, 130),
(6, 15, 160),
(6, 16, 120),
(5, 17, 100),
(6, 18, 90),
(7, 19, 300),
(7, 20, 250),
(8, 21, 280),
(8, 22, 220),
(7, 23, 200),
(8, 24, 190),
(9, 25, 60),
(9, 26, 55),
(10, 27, 50),
(10, 28, 45),
(9, 29, 40),
(10, 30, 35);

-- populando tabela vendedor
INSERT INTO Seller (SocialName, CNPJ, CPF, Contact, Location) 
VALUES
('Eletron Vendas SA',  '92000000000011', NULL, '11988880011', 'Sao Paulo'),
('Moda Center LTDA',   '92000000000012', NULL, '11988880012', 'Rio de Janeiro'),
('Brinq Master LTDA',  '92000000000013', NULL, '11988880013', 'Belo Horizonte'),
('Alim Distrib SA',    '92000000000014', NULL, '11988880014', 'Campinas'),
('Moveis Direto LTDA', '92000000000015', NULL, '11988880015', 'Curitiba'),
('Carlos Silva',   NULL, '81000000011', '11977770011', 'Sao Paulo'),
('Mariana Costa',  NULL, '81000000012', '11977770012', 'Rio de Janeiro'),
('Rafael Nunes',   NULL, '81000000013', '11977770013', 'Belo Horizonte'),
('Juliana Pires',  NULL, '81000000014', '11977770014', 'Porto Alegre'),
('Andre Souza',    NULL, '81000000015', '11977770015', 'Salvador');

-- populando tabela produto vendedor
INSERT INTO ProductSeller (idSeller, idProduct, Quantity) VALUES
(1, 1, 40),
(1, 2, 30),
(1, 3, 35),
(1, 4, 25),
(1, 5, 60),
(2, 7, 120),
(2, 8, 90),
(2, 9, 80),
(2, 10, 70),
(2, 11, 60),
(3, 13, 100),
(3, 14, 95),
(3, 15, 110),
(3, 16, 85),
(3, 17, 75),
(4, 19, 200),
(4, 20, 180),
(4, 21, 220),
(4, 22, 160),
(4, 23, 140),
(5, 25, 30),
(5, 26, 25),
(5, 27, 20),
(5, 28, 18),
(5, 29, 15),
(6, 6, 10),
(6, 5, 15),
(7, 12, 20),
(7, 9, 25),
(8, 4, 12),
(8, 2, 8),
(9, 10, 14),
(9, 11, 10),
(10, 18, 9),
(10, 17, 7);


-- Clientes com mais de um pedido
SELECT idOrderClient, COUNT(*) AS total_pedidos
FROM Orders
GROUP BY idOrderClient
HAVING COUNT(*) > 1;

-- Listar pedidos por cliente
SELECT c.Fname, c.Lname, o.idOrder, o.OrderStatus, o.Payment
FROM Orders o
JOIN Client c ON o.idOrderClient = c.idClient
ORDER BY c.idClient, o.idOrder;

-- Produtos por pedido
SELECT o.idOrder, p.Pname, po.Quantity, po.Statust
FROM ProductOrder po
JOIN Orders o ON po.idOrder = o.idOrder
JOIN Product p ON po.idProduct = p.idProduct
ORDER BY o.idOrder;

-- Total de itens por pedido
SELECT idOrder, SUM(Quantity) AS total_itens
FROM ProductOrder
GROUP BY idOrder;

-- Estoque total por produto
SELECT p.Pname, SUM(ps.Quantity) AS TotalEstoque
FROM ProductPStorage ps
JOIN Product p ON ps.idProduct = p.idProduct
GROUP BY p.Pname;

-- Produtos com pouco estoque (menos de 20 unidades)
SELECT p.Pname, ps.Quantity, s.Location
FROM ProductPStorage ps
JOIN Product p ON ps.idProduct = p.idProduct
JOIN ProductStorage s ON ps.idProdStorage = s.idProdStorage
WHERE ps.Quantity < 20;

-- Estoque por centro de distribuição
SELECT s.Location, SUM(ps.Quantity) AS TotalProdutos
FROM ProductPStorage ps
JOIN ProductStorage s ON ps.idProdStorage = s.idProdStorage
GROUP BY s.Location;


-- Produtos por fornecedor
SELECT s.SocialName, p.Pname, ps.Quantity
FROM ProductSupplier ps
JOIN Supplier s ON ps.idSupplier = s.idSupplier
JOIN Product p ON ps.idProduct = p.idProduct
ORDER BY s.SocialName;

-- Fornecedores de um produto específico
SELECT p.Pname, s.SocialName
FROM ProductSupplier ps
JOIN Supplier s ON ps.idSupplier = s.idSupplier
JOIN Product p ON ps.idProduct = p.idProduct
WHERE p.idProduct = 1;

-- Quantidade total fornecida por fornecedor
SELECT s.SocialName, SUM(ps.Quantity) AS TotalFornecido
FROM ProductSupplier ps
JOIN Supplier s ON ps.idSupplier = s.idSupplier
GROUP BY s.SocialName;

-- Produtos por vendedor
SELECT s.SocialName, p.Pname, ps.Quantity
FROM ProductSeller ps
JOIN Seller s ON ps.idSeller = s.idSeller
JOIN Product p ON ps.idProduct = p.idProduct
ORDER BY s.SocialName;

-- Vendedores (PF ou PJ)
SELECT SocialName,
       CASE 
           WHEN CNPJ IS NOT NULL THEN 'Pessoa Juridica'
           ELSE 'Pessoa Fisica'
       END AS Tipo
FROM Seller;

-- UTILIZANDO JOINS

-- Cliente + Pedidos (inner join)
SELECT c.idClient, c.Fname, c.Lname, o.idOrder, o.OrderStatus
FROM Client c
INNER JOIN Orders o
ON c.idClient = o.idOrderClient;

-- Clientes com ou sem pedidos (LEFT JOIN)
SELECT c.idClient, c.Fname, c.Lname, o.idOrder
FROM Client c
LEFT JOIN Orders o
ON c.idClient = o.idOrderClient;

-- Pedidos + Produtos
SELECT o.idOrder, p.Pname, po.Quantity
FROM Orders o
JOIN ProductOrder po ON o.idOrder = po.idOrder
JOIN Product p ON po.idProduct = p.idProduct;

-- Pedido completo (Cliente + Produtos + Pagamento)
SELECT 
    o.idOrder,
    c.Fname,
    c.Lname,
    p.Pname,
    po.Quantity,
    o.Payment
FROM Orders o
JOIN Client c ON o.idOrderClient = c.idClient
JOIN ProductOrder po ON o.idOrder = po.idOrder
JOIN Product p ON po.idProduct = p.idProduct
ORDER BY o.idOrder;

-- Total de itens por pedido (GROUP BY + JOIN)
SELECT o.idOrder, SUM(po.Quantity) AS TotalItens
FROM Orders o
JOIN ProductOrder po ON o.idOrder = po.idOrder
GROUP BY o.idOrder;

-- Produtos com estoque baixo (LEFT JOIN + filtro)
SELECT p.Pname, s.Location, ps.Quantity
FROM Product p
LEFT JOIN ProductPStorage ps ON p.idProduct = ps.idProduct
LEFT JOIN ProductStorage s ON ps.idProdStorage = s.idProdStorage
WHERE ps.Quantity < 20;

-- Relatório geral (JOIN + agregações)
SELECT 
    c.Fname,
    c.Lname,
    o.idOrder,
    COUNT(po.idProduct) AS Produtos,
    SUM(po.Quantity) AS Itens
FROM Client c
JOIN Orders o ON c.idClient = o.idOrderClient
JOIN ProductOrder po ON o.idOrder = po.idOrder
GROUP BY o.idOrder;

