
-Mostrar dados-

select * from livros l  ; 
select titulo from livros l where titulo  = 'O mundo depois do amanhã';
select titulo from livros l where  id_categoria =1;
select titulo from livros l  order by titulo asc;
select titulo from livros l order by titulo desc;
select titulo from livros l limit 2;

-JOIN-

select livros.titulo, autores.nome 

from livros
inner join autores on livros.id_autor = autores.id_autor

-Retorna registro que tem correspondência em ambas tabelas-
select livros.titulo, autores.nome 
from livros 
inner join autores on livros.id_autor = autores.id_autor ; 

-Retorna registro de tabela esquerda meos registro da tabela direita-
select livros.titulo, autores.nome 
from livros
left join autores on livros.id_autor = autores.id_autor ;

-Retorna registro de tabela direita e registro da tabela esquerda-
select Livros.titulo, Autores.nome 
from livros
right join autores  on Livros.id_livro = autores.id_autor ;

-Retorna todos os registros quando há uma correspondência-
select livros.titulo , autores.nome 
from livros
full outer join autores on livros.id_livro = autores.id_autor;

-Retorna os registros correspondente a todas as tabelas-
select livros.titulo,  autores.nome, categorias.nome, editoras.nome
from livros 
inner join autores on livros.id_autor = autores.id_autor 
inner join categorias on livros.id_categoria  = categorias.id_categoria 
inner join editoras on livros.id_livro = editoras.id_editora 





select * from categorias c;
select * from autores a ;
select * from editoras e;

