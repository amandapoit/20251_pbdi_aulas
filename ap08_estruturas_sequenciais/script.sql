-- Active: 1731611053173@@localhost@5432@PBDI_1803
DO $$
DECLARE
    n1 NUMERIC (5, 2);
	n2 INT;
	limite_inferior INT := 5;
	limite_superior INT := 17;
BEGIN
    -- 0 <= n1 < 1 (real) [0, 1]
	n1 := random();
	RAISE NOTICE 'n1: %', n1;
	-- 1 <= n1 < 10 (real) [1, 10]
	n1 := 1 + random() * 9;
	RAISE NOTICE '%', n1;
	n2 := floor(random() * 10 + 1)::INT;
	RAISE NOTICE 'n2: %', n2;
	n2 := floor(random() * (limite_superior - limite_inferior))::INT;
	RAISE NOTICE 'Intervalor qualquer: %', n2;
END;
$$


--variaváveis
-- DO
-- $$
-- DECLARE 
--    v_codigo INTEGER :=1;
--	  v_nome_completo VARCHAR(200) := 'João';
--	  v_salario NUMERIC (11, 2) := 20.5;
-- BEGIN
-- nome = 'Ana'
-- print(f'Me chamo {nome}')
--    RAISE NOTICE 'Meu código é %, me chamo % e meu salário é %.',
--	v_nome_completo, v_salario;
-- END;
-- $$