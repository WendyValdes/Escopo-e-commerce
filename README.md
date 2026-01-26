Escopo E-commerce – Banco de Dados Relacional

Este projeto consiste na modelagem, implementação e popularização de um banco de dados relacional para um sistema de e-commerce, desenvolvido a partir do Diagrama EER Escopo_ecommerce.

O objetivo é aplicar, na prática, os conceitos de modelagem de dados, relacionamentos, chaves primárias e estrangeiras, restrições de integridade e consultas SQL, simulando um cenário real de comércio eletrônico.

 
- Objetivos de Aprendizagem

Compreender a transformação de um Diagrama EER em tabelas relacionais

Implementar relacionamentos 1:N e N:N no MySQL

Aplicar constraints, ENUM, AUTO_INCREMENT e FOREIGN KEY

Popular tabelas respeitando a integridade referencial

Executar consultas SQL utilizando JOINs entre múltiplas tabelas


- Estrutura do Banco de Dados

O banco de dados é composto pelas principais entidades de um e-commerce:

Client – clientes pessoa física e jurídica

Product – produtos comercializados

Orders – pedidos realizados pelos clientes

Payment – formas de pagamento

Supplier – fornecedores

Seller – vendedores

ProductOrder, ProductStorage, ProductSupplier, ProductSeller – tabelas de relacionamento


- Relacionamentos

Um cliente pode realizar vários pedidos

Um pedido pode conter vários produtos

Um produto pode estar associado a estoques, fornecedores e vendedores

Relacionamentos N:N são implementados por tabelas associativas


- Popularização e Testes

O script inclui dados de exemplo realistas, permitindo:

Clientes com múltiplos pedidos

Produtos distribuídos em diferentes estoques

Produtos associados a mais de um fornecedor e vendedor

Execução de consultas com INNER JOIN, LEFT JOIN e RIGHT JOIN



- Conclusão

Este projeto consolida os principais conceitos de banco de dados relacionais aplicados a um cenário de e-commerce, sendo ideal para prática, estudo e validação dos conhecimentos adquiridos na trilha da DIO.



- Ferramentas

MySQL Workbench – para modelagem e criação do diagrama EER.

MySQL – para implementação do esquema relacional.
