/* # Banco de Dados
Crate DATABASE livraria; */


 /*  -Criação de tabela de livros- */
CREATE TABLE Livros (
    ID_Livro SERAIAL PRIMARY KEY,
    Titulo VARCHAR (255),
Autor VARCHAR (255),
Editora VARCHAR(255),
     Endereco_Editora VARCHAR(255),
Categoria VARCHAR9(255)
);

   /*  - Criação da tabela Editora- */
CREATE TABLE Editoras (
ID_Editora SERIAL PRIMARY KEY,
Nome VARCHAR(255),
Endereco VARCHAR(255),
);

  /* -Criação de relacionamento Livros - Editoras- */
ALTER TABLE Livros 
ADD COLUMN ID_Editora INT REFERENCES Editoras(ID_Editora);

 /* -Exclusão De colunas Editora e Endereço- */
ALTER TABLE Livros
DROP COLUMN Editora,
DROP COLUMN Endereco_Editora;

 /*  -Criação De tabela de Categorias- */
CREATE TABLE Categorias(
ID_Categoria SERIAL PRIMARY KEY,
Nome VARCHAR(225)
);

  /* -Criar Relacionamento Livros -Categorias- */
  ALTER TABLE Livros 
  ADD COLUMN ID_Categoria INT REFERENCES
  Categoria(ID_Categoria);

  /* -Excluir a coluna Categoria na tabela Livros- */
  ALTER TABLE Livros
   DROP COLUMN Categoria;


   /* -Criação da tabela Autores- */
create table autores  ( 
ID_Autor SERIAL primary key,
Nome varchar(255),
autor varchar(255)
);

  /* -Relacionamneto com Autores- Livros- */
alter table livros
add column ID_Autor  INT REFERENCES autores(ID_Autor);

