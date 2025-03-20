insert into Livros(Titulo, id_editora, id_categoria, id_autor) values
('Despencado na programção' , 1, 5, 3),
('Traduzindo o códogo' , 3, 3, 1),
('Respirando de baixo dagua ', 2, 1, 2),
('Respeitando as regras' , 1, 4,2);


insert into  Editoras(Nome, Endereco) values 
('Amostradinho','Rua cheia de agua n° 125'),
('Cheia de  Graça','Rua feliz, almeida contente n° 1502'),
('Ambrosio', 'Rua Marques de figueredo n° 1502');

insert into  Categorias (Nome) values
('Ficção'),
('Romance'),
('Acão'),
('Policia'),
('Auto Ajuda');

insert into  Autores (NOME) values
('Carlinho'),
('Marcio arruda'),
('Diego Silva');





-Incluir livro importando dados das outras tabelas-
insert into Livros(Titulo, id_editora, id_categoria, id_autor)
	values
	('O mundo depois do amanhã',
	(select id_editora from editoras where nome = 'Amostradinho'),
	(select id_categoria from categorias  where nome = 'Ficção'),
	(select  id_autor  from autores  where nome = 'Carlinho')
		);
	
	
	-Novos Dados-
	
	
insert into Livros(Titulo, id_editora, id_categoria, id_autor) values
('Morrer ou correr' , 1,1,1)
	
	
insert into  Editoras(Nome, Endereco) values 
('Raimundo' , 'Rua da dor  n °122 desprezo');


insert into  Categorias (Nome) values
('Ação' );


insert into  Autores (NOME) values
('Larissa Ramos');

insert into Livros(Titulo, id_editora, id_categoria, id_autor)
	values
	('O mundo tá diferente ', 
	(select id_editora from editoras where nome = 'Raimundo') ,
	(select id_categoria from categorias where nome = 'Ação'),
	(select  id_autor from autores where nome = 'Larissa Ramos')
	);



-Mostrar Dados-
select * from categorias c ;
select * from autores a;
select * from editoras e;
select  * from  livros l ;




