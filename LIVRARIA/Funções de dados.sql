-Funções de agregação-
-COUNT-
select  COUNT (*) from livros;

-SUM-
select sum(preco) from livros 

alter table livros add column preco DECIMAl

-AVG-

select avg(preco) from livros; 

-MAX-

select MAX(preco) from livros;


-MIN-

select MIN(preco) from livros;


-group by-

select preco, COUNT(*) from livros group by preco;