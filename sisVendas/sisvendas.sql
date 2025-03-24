create database sisvendas;

-Tabela de permissões-

create table Permissoes(
id SERIAL primary key,
nome varchar(50) unique not null,
descrição text
);

-tabela de Usuarios-
create table Usuarios (
id serial primary key,
nome varchar (100) not null,
senha varchar (255) not null,
permissao_id integer references permissoes(id)
);
-Tabela de Clientes-
create table Clientes (
id serial primary key,
nome varchar(100) not null,
email varchar (100) unique,
telefone varchar(20),
endereco varchar(255)
);

-Tabela Categorias-
create table Categorias (
id serial primary key,
nome varchar(50) unique not null, 
discricao TEXT
)

-Tabela de Produtos-
create table Produtos ( 
id SERIAL primary key,
nomr varchar (100) not null,
descricao text,
preco DECIMAL(10, 2) not null,
categoria_id integer references Categoria(id)
);

-Tabela de Clientes_Produtos (tabela de junção para relacionamento muitos-para-muitos)
-
create table clientes_produtos( 
cliente_id interger references clientes(id,)
produto_id integer references Produtos(id),
primary key (cliente_id, produto_id)
);

-Tabela de forma de pagamento-
create table FromasPàgamento(
id serial primary key,
nome varchar(50) unique not null,
descricao text
);







