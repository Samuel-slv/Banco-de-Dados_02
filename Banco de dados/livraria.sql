/* # Banco de Dados
Crate DATABASE livraria; */



CREATE TABLE Livros (
    ID_Livro SERAIAL PRIMARY KEY,
    Titulo VARCHAR (255),
Autor VARCHAR (255),
Editora VARCHAR(255),
     Endereco_Editora VARCHAR(255),
Categoria VARCHAR9(255)
);

CREATE TABLE Editoras (
ID_Editora SERIAL PRIMARY KEY,
Nome VARCHAR(255),
Endereco VARCHAR(255),
);

ALTER TABLE Livros 
ADD COLUMN ID_Editora INT REFERENCES Editoras(ID_Editora);

ALTER TABLE Livros
DROP COLUMN Editora,
DROP COLUMN Endereco_Editora;


CREATE TABLE Categorias(
ID_Categoria SERIAL PRIMARY KEY,
Nome VARCHAR(225)
);

  ALTER TABLE Livros 
  ADD COLUMN ID_Categoria INT REFERENCES
  Categoria(ID_Categoria);

  ALTER TABLE Livros DROP COLUMN Categoria;
