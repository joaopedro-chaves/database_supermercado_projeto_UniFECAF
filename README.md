# Database Supermercado - Projeto UniFECAF

![MySQL](https://img.shields.io/badge/mysql-%2300f.svg?style=for-the-badge&logo=mysql&logoColor=white)
![Git](https://img.shields.io/badge/git-%23F05033.svg?style=for-the-badge&logo=git&logoColor=white)

Este repositório contém o projeto de banco de dados para um sistema de supermercado, desenvolvido para a disciplina de **Sistemas de Banco de Dados** no Centro Universitário UniFECAF.

O projeto abrange desde a modelagem lógica até a implementação física, incluindo scripts de criação, inserção de dados e consultas de demonstração.

Para documentação completa do projeto, veja o arquivo [DOC.md](https://github.com/joaopedro-chaves/database_supermercado_projeto_UniFECAF/blob/main/DOC.md).

## Objetivo do Projeto

O objetivo principal é gerenciar as operações fundamentais de um supermercado, tais como:

- Cadastro e gestão de colaboradores (hierarquia entre atendentes, supervisores e gerentes).
- Controle de estoque e catálogo de produtos.
- Gestão de clientes e programas de fidelização (pontuação e níveis).
- Registro de vendas, formas de pagamento e cálculo de comissões.
- Histórico de pontos para clientes fidelizados.

## Estrutura do Repositório

- `source/Code`: Contém os scripts SQL fundamentais:
  - `Script_Query_Create.sql`: Criação do banco de dados `db_supermercado` e suas tabelas com todas as constraints (PK, FK, CHECK).
  - `Script_Query_Insert.sql`: Povoamento do banco com dados realistas para teste.
  - `Script_Query_Demo.sql`: Consultas complexas para demonstração das funcionalidades.
- `source/BRmodelo`: Arquivos de modelagem lógica.
- `source/MySQL Workbench`: Arquivos de projeto do Workbench.
- `img`: Capturas de tela e diagramas.
- `txt/Links.txt`: Referências externas e documentação.
- `Script_database.sql`: É uma versão resumida, com a criação do banco de dados e inserção de dados para demonstração.

## Modelo de Dados

O banco de dados é composto pelas seguintes tabelas principais:

- **tbl_colaborador**: Informações dos funcionários e hierarquia.
- **tbl_produto**: Catálogo de produtos com código EAN.
- **tbl_estoque**: Controle de lotes, validades e quantidades.
- **tbl_cliente**: Cadastro de consumidores.
- **tbl_fidelizacao**: Regras e saldos do programa de fidelidade.
- **tbl_venda**: Registro das transações comerciais.
- **tbl_produto_venda**: Detalhamento dos itens de cada venda (N:M).
- **tbl_historico_pontos**: Log de ganhos e gastos de pontos de fidelidade.

## Como Executar

1. Certifique-se de ter o **MySQL Server** e o **MySQL Workbench** instalados.
2. Clone este repositório:

   ```bash
   git clone https://github.com/joaopedro-chaves/database_supermercado_projeto_UniFECAF.git
   ```

3. Abra o script `source/Code/Script_Query_Create.sql` no MySQL Workbench e execute-o para criar a estrutura.
4. Execute `source/Code/Script_Query_Insert.sql` para inserir os dados de exemplo.
5. Utilize o script `source/Code/Script_Query_Demo.sql` para testar as consultas e relatórios.
