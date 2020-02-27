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










 




 





