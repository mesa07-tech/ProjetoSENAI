# NextgenZ
> Senai app

# Biblioteca Simples

Este é um projeto de exemplo de uma aplicação web simples para gerenciar uma biblioteca, desenvolvido com o objetivo educativo. A aplicação permite navegar entre diferentes páginas e consultar uma lista de livros e autores armazenados em um banco de dados SQLite.

## Funcionalidades

- Navegação entre páginas: Início, Livros e Autores.
- Consulta a dados de livros e autores.
- Interface básica com HTML renderizado pelo Flask.

## Estrutura do Projeto

- `app.py`: Arquivo principal que configura a aplicação Flask e define as rotas.
- `templates/`: Diretório que contém os arquivos HTML para cada página da aplicação.
- `library.db`: Banco de dados SQLite com dados de exemplo.
- `db.sql`: Arquivo SQL para recriação do banco de dados com a estrutura e dados de exemplo.

## Requisitos

Para executar esta aplicação, você precisará de:

- Python 3.7 ou superior
- Flask
- SQLite3 (geralmente já incluído no Python)

### Instalando as Dependências

1. Instale o Flask:
   ```bash
   pip install flask
   ```

## Executando a Aplicação

1. Clone o repositório e navegue até o diretório do projeto.
2. Execute o arquivo `app.py`:
   ```bash
   python app.py
   ```
3. Acesse a aplicação no navegador em `http://127.0.0.1:5000`.

## Estrutura do Banco de Dados

O banco de dados consiste em duas tabelas:

1. **authors**: Armazena os nomes dos autores.
   - `id`: Chave primária.
   - `name`: Nome do autor.

2. **books**: Armazena os livros e faz referência à tabela de autores.
   - `id`: Chave primária.
   - `title`: Título do livro.
   - `author_id`: Chave estrangeira para `authors`.

## Recriando o Banco de Dados

Para recriar o banco de dados, você pode utilizar o arquivo `db.sql`:

1. Conecte-se ao banco SQLite e execute:
   ```bash
   sqlite3 library.db < db.sql
   ```

## Observações

Este projeto foi desenvolvido com fins educativos, por isso apresenta uma estrutura simples. Sinta-se à vontade para expandir as funcionalidades e customizar a aplicação.
