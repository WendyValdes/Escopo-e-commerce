Projeto E-commerce – Modelagem de Banco de Dados


- Descrição

Este projeto tem como objetivo criar um esquema de banco de dados para um cenário de e-commerce utilizando o MySQL Workbench. O foco é praticar modelagem de dados, relacionamentos e especializações no contexto de um sistema de vendas online.



- O cenário do projeto é o seguinte:

Um cliente pode ser Pessoa Física (PF) ou Pessoa Jurídica (PJ).

O cliente realiza pedidos, que podem conter vários produtos.

Os produtos podem ou não estar disponíveis em estoque, dependendo de:

Entrega pelo fornecedor;

Disponibilidade com vendedores terceiros.

Cada pedido possui um status de entrega, que indica o progresso da entrega ao cliente.



- Objetivos de Aprendizagem

Aplicar conceitos de modelagem relacional em um cenário real.

Trabalhar com especialização de entidades (PF / PJ).

Construir relacionamentos 1:N e N:N, incluindo tabelas associativas (ex.: Pedido–Produto, Pedido–Pagamento).

Definir integridade referencial, tipos de dados e restrições.

Representar visualmente o modelo com diagrama EER no MySQL Workbench.



- Escopo do Projeto "Modelo e-commerce.pdf"
Entidades principais:

Cliente: PF ou PJ, com atributos específicos.

Pedido: contém múltiplos produtos e está associado a um cliente.

Produto: disponível em estoque ou via fornecedor/terceiros.

Estoque: controla quantidade disponível dos produtos.

Fornecedor: fornece produtos para o e-commerce.

Entrega: registra status e código de rastreio do pedido.



- Ferramentas

MySQL Workbench – para modelagem e criação do diagrama EER.

MySQL – para implementação do esquema relacional.
