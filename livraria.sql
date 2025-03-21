-Criação de tabela de livros-

create table Livros (
ID_Livro SERIAL primary key,
Titulo varchar(255),
Autor varchar (255),
Editora varchar(255),
Endereco_Editora varchar(255),
Categoria varchar(255)
);

- Criação da tabela Editora-
create table Editoras (
	ID_Editora SERIAL primary key,
	Nome varchar(255),
	Endereco varchar(255)
);


-Criação de relacionamento Livros - Editoras-
alter table Livros
add column ID_Editora INT references Editoras(ID_Editora);


-Exclusão De colunas Editora e Endereço-
alter table livros 
drop column Editora,
drop column Endereco_Editora;

 -Criação De tabela de Categorias-
	create table Categorias (
	ID_Categoria SERIAL primary key,
	Nome varchar(255)
	);

-Criar Relacionamento Livros -Categorias-
alter table livros
add column ID_Categoria INT REFERENCES Categorias(ID_Categoria);

-Excluir a coluna Categoria na tabela Livros-
alter table livros
drop column Categoria;

-Criação da tabela Autores-
create table autores  ( 
ID_Autor SERIAL primary key,
Nome varchar(255),
autor varchar(255)
);

-Relacionamneto com Autores- Livros-

alter table livros
add column ID_Autor INT REFERENCES autores(ID_Autor);



