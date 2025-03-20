

-Mostrar dasdos-

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



select * from categorias c;
select * from autores a ;
select * from editoras e;