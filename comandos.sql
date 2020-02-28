USE sucos_vendas;

SELECT CPF, NOME, CIDADE from tabela_de_clientes;

SELECT * from tabela_de_clientes;

SELECT NOME AS CLIENTE FROM tabela_de_clientes;

 SELECT * FROM tabela_de_produtos WHERE PRECO_DE_LISTA BETWEEN 19.50 AND 19.52;

-- Consultas condicionais
-- X=A OR X=B   -- X=A  AND x=B 
-- NOT  (INVERTER O RESULTADO) EXEMPLO NOT(A=A)  -> FALSE

SELECT * from tabela_de_produtos WHERE sabor = 'Manga' OR tamanho = '470 ml';

SELECT * from tabela_de_produtos WHERE sabor = 'Manga' AND tamanho = '470 ml';

-- USANDO NOT
SELECT * from tabela_de_produtos WHERE NOT(sabor = 'Manga' OR tamanho = '470 ml');

-- not com and
SELECT * from tabela_de_produtos WHERE sabor = 'Manga' AND NOT tamanho = '470 ml';

-- IN: CONTIDO

-- usando like
-- SELECT * FROM TABELA WHERE LIKE '%Martins%';
-- '%UZ' - termina com uz

SELECT * FROM tabela_de_produtos where sabor like '%Maça%';

SELECT * FROM tabela_de_produtos where sabor like '%Maça%'
AND EMBALAGEM ='PET';

-- distinct: distintos (retorna linhas com valores diferentes)
-- exemplo:  SELECT DISTINCT * FROM TABELA

-- LIMIT - Limita o numero de linha exibidas
-- EXEMPLO  SELECT * FROM TABELA LIMIT 4

-- ordenacao de campos
-- EXEMPLO: SELECT * FROM ORDER BY CAMPO ( DO MENOR PARA O MAIOR)
-- DESC - DO MAIOR PARA O MENOR

-- Agrupando os resultados

SELECT * FROM tabela_de_clientes;

SELECT ESTADO, LIMITE_DE_CREDITO FROM tabela_de_clientes;

SELECT ESTADO, SUM(LIMITE_DE_CREDITO) AS LIMITE_TOTAL FROM tabela_de_clientes group by ESTADO;
-- group by: agrupa campos com o mesmo valor em apenas uma
-- no caso agrupa por estado e soma o liite de credito de cada estado

SELECT  EMBALAGEM, COUNT(*) AS CONTATOR from tabela_de_produtos GROUP BY EMBALAGEM;


--  Having (filtro)
-- UTILIZADO POIS É NECESSÁRIO:  O HAVING PRECISA SER APOS O GROUP BY, POIS OS DADOS PRECISAM SER AGRUPADOS
-- PRIMERIO
-- exemplo:

-- ERRO
SELECT ESTADO, sum(LIMITE_DE_CREDITO) AS SOMA_LIMITE FROM tabela_de_clientes
where SOMA_LIMITE > 900000 GROUP BY ESTADO;

-- USANDO HAVING  
SELECT ESTADO, sum(LIMITE_DE_CREDITO) AS SOMA_LIMITE FROM tabela_de_clientes
 GROUP BY ESTADO having SUM(LIMITE_DE_CREDITO) > 900000;


-- Classificar resultados
-- CASE:  teste em um ou mais campos.

SELECT * FROM tabela_de_produtos;

SELECT NOME_DO_PRODUTO, PRECO_DE_LISTA,
	CASE WHEN PRECO_DE_LISTA >=12 THEN 'PRODUTO CARO'
	WHEN PRECO_DE_LISTA >=7 AND PRECO_DE_LISTA < 12 THEN 'PRODUTO EM CONTA'
	ELSE 'PRODUTO BARATO' 
END AS STATUS_PRECO from tabela_de_produtos;

SELECT EMBALAGEM,	
	CASE WHEN PRECO_DE_LISTA >=12 THEN 'PRODUTO CARO'
	WHEN PRECO_DE_LISTA >=7 AND PRECO_DE_LISTA < 12 THEN 'PRODUTO EM CONTA'
	ELSE 'PRODUTO BARATO' 
END AS STATUS_PRECO, AVG(PRECO_DE_LISTA) AS  PRECO_MEDIO
from tabela_de_produtos
GROUP BY EMBALAGEM,
	CASE WHEN PRECO_DE_LISTA >=12 THEN 'PRODUTO CARO'
	WHEN PRECO_DE_LISTA >=7 AND PRECO_DE_LISTA < 12 THEN 'PRODUTO EM CONTA'
	ELSE 'PRODUTO BARATO'
END;


-- JOIN

SELECT * FROM TABELA_DE_VENDEDORES;
SELECT * FROM notas_fiscais;
-- CAMPO EM COMUM: MATRICULA 

SELECT * FROM tabela_de_vendedores AS  A 
INNER JOIN notas_fiscais B
ON A.MATRICULA =  B.MATRICULA;

-- quantidade de notas fiscais por vendedor
SELECT A.MATRICULA, A.NOME, COUNT(*) FROM
tabela_de_vendedores AS  A 
INNER JOIN notas_fiscais B
ON A.MATRICULA =  B.MATRICULA
GROUP BY A.MATRICULA, A.NOME;

-- outra forma de fazer o JOIN
SELECT A.MATRICULA, A.NOME, COUNT(*) FROM
tabela_de_vendedores AS  A ,notas_fiscais B
WHERE A.MATRICULA =  B.MATRICULA
GROUP BY A.MATRICULA, A.NOME;
-- é como se fosse feito um cross join e depois um where


SELECT COUNT(*) FROM tabela_de_clientes;

SELECT CPF, count(*) FROM notas_fiscais group by cpf;
 
 SELECT distinct A.CPF, A.NOME, B.CPF FROM tabela_de_clientes A
 INNER JOIN notas_fiscais B ON A.cpf = B.cpf;


 SELECT distinct A.CPF, A.NOME, B.CPF FROM tabela_de_clientes A
 LEFT JOIN notas_fiscais B ON A.cpf = B.cpf;
 
  SELECT distinct A.CPF, A.NOME, B.CPF FROM tabela_de_clientes A
 LEFT JOIN notas_fiscais B ON A.cpf = B.cpf
 WHERE B.cpf is null;
 
 
 

