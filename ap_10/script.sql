-- CREATE OR REPLACE FUNCTION valor_aleatorio_entre (lim_inferior INT, lim_superior
-- INT) RETURNS INT AS
-- $$
-- BEGIN
-- RETURN FLOOR(RANDOM() * (lim_superior - lim_inferior + 1) + lim_inferior)::INT;
-- END;
-- $$ LANGUAGE plpgsql;


-- loops aninhados e rótulos
-- DO $$
-- DECLARE
--     i INT;
--     j INT;
-- BEGIN
--     i := 0;
--     <<externo>>
--     LOOP
--         i := i + 1;
--         EXIT WHEN i > 10;
--         j := 1;
--         <<interno>>
--         LOOP
--             RAISE NOTICE '% %', i, j;
--             j := j + 1;
--             CONTINUE externo WHEN j > 5;
--         END LOOP;
--     END LOOP;
-- END;
-- $$

-- DO $$
-- DECLARE
--     i INT;
--     j INT;
-- BEGIN
--     i := 0;
--     <<externo>>
--     LOOP
--         i := i + 1;
--         EXIT WHEN i > 10;
--         j := 1;
--         <<interno>>
--         LOOP
--             RAISE NOTICE '% %', i, j;
--             j := j + 1;
--             EXIT interno WHEN j > 5;
--         END LOOP;
--     END LOOP;
-- END;
-- $$

-- criando a tabela

-- CREATE TABLE tb_aluno(
--    cod_aluno SERIAL PRIMARY KEY,
--    nota INT
-- );

-- INSERINDO DADOS NA TABELA
-- DO $$
-- BEGIN
--     FOR i IN 1..10 LOOP
--         INSERT INTO tb_aluno
--         (nota)
--         VALUES
--         (valor_aleatorio_entre (0, 10)); -- precisa rodar a função -- já rodei
--     END LOOP;
-- END;
-- $$

-- DO $$
-- DECLARE
--     aluno RECORD;
--     media NUMERIC(10, 2) := 0;
--     total_alunos INT;
-- BEGIN
--     FOR aluno IN
--         SELECT * FROM tb_aluno
--     LOOP
--         RAISE NOTICE 'Nota do aluno %: %',
--         aluno.cod_aluno, aluno.nota;
--         media := media + aluno.nota;
--     END LOOP;
--     SELECT COUNT(*) FROM tb_aluno INTO total_alunos;
--     RAISE NOTICE 'Média: %', media / total_alunos;
-- END;
-- $$


-- SELECT * FROM tb_aluno

-- DO $$
-- DECLARE
--     valores INT[] := ARRAY[
--         valor_aleatorio_entre(1, 10),
--         valor_aleatorio_entre(1, 10),
--         valor_aleatorio_entre(1, 10),
--         valor_aleatorio_entre(1, 10),
--         valor_aleatorio_entre(1, 10)
--     ];
--     valor INT;
--     soma INT := 0;
-- BEGIN
--     FOREACH valor IN ARRAY valores LOOP
--         RAISE NOTICE 'Valor da vez: %', valor;
--         soma := soma + valor;
--     END LOOP;
--     RAISE NOTICE 'Soma: %', soma;

-- END;
-- $$

-- FOREACH com fatias (slice)

-- DO $$
-- DECLARE
--     vetor INT[] := ARRAY[1, 2, 3];
--     matriz INT[] := ARRAY[
--         [1, 2, 3],
--         [4, 5, 6],
--         [7, 8, 9]
--     ];
--     var_aux INT;
--     vet_aux INT[];
-- BEGIN
--     RAISE NOTICE 'SLICE %, vetor', 0;
--     FOREACH var_aux IN ARRAY vetor LOOP
--         RAISE NOTICE '%', var_aux;
--     END LOOP;

--     RAISE NOTICE 'SLICE %, vetor', 1;
--     FOREACH vet_aux SLICE 1 in ARRAY vetor LOOP
--         RAISE NOTICE '%', vet_aux;
--     END LOOP;

--     RAISE NOTICE 'SLICE %, matriz', 0;
--     FOREACH var_aux IN ARRAY matriz LOOP
--         RAISE NOTICE '%', var_aux;
--     END LOOP;

--     RAISE NOTICE 'SLICE %, matriz', 1;
--     FOREACH vet_aux SLICE 1 IN ARRAY matriz LOOP
--         RAISE NOTICE '%', vet_aux;
--     END LOOP;

--     RAISE NOTICE 'SLICE %, matriz', 2;
--     FOREACH vet_aux SLICE 2 IN ARRAY matriz LOOP
--         RAISE NOTICE '%', vet_aux;
--     END LOOP;
-- END;
-- $$


DO $$
BEGIN
    RAISE '%', 1 / 0;
    RAISE NOTICE 'Acabou...';
EXCEPTION
    WHEN division_by_zero THEN
        RAISE NOTICE 'Não é possível dividir por zero.';
END;
$$


















