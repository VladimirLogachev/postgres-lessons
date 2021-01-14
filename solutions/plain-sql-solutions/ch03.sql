/*
1
 */
-- ERROR:  duplicate key value violates unique constraint "aircrafts_pkey"
INSERT INTO aircrafts
  VALUES ('SU9', 'Sukhoi SuperJet-100', 3000);

-- OK
INSERT INTO aircrafts
  VALUES ('SU1', 'Sukhoi SuperJet-100', 3000);


/*
2

Самостоятельно напишите команду для выборки всех строк из таблицы aircrafts, 
чтобы строки были упорядочены по убыванию значения 
атрибута «Максимальная дальность полета, км» (range)
 */
SELECT
  *
FROM
  aircrafts
ORDER BY
  RANGE DESC;


/*
3

Самостоятельно напишите команду UPDATE полностью, при
этом не забудьте, что увеличить дальность полета нужно только у одной модели — Sukhoi SuperJet,
поэтому необходимо использовать условие WHERE. Затем
с помощью команды SELECT проверьте полученный результат
 */
UPDATE
  aircrafts
SET
  RANGE = RANGE * 2
WHERE
  aircraft_code = 'SU9';


/*
4

Если в предложении WHERE команды DELETE вы укажете логически и синтаксически корректное условие, 
но строк, удовлетворяющих этому условию, в таблице не окажется, то в ответ СУБД выведет сообщение
DELETE 0

Самостоятельно смоделируйте описанную ситуацию, подобрав условие, которому гарантированно
не соответствует ни одна строка в таблице «Самолеты» (aircrafts).
 */

-- 1 deleted 
DELETE FROM aircrafts
WHERE aircraft_code = 'SU1';


-- 0 deleted 
DELETE FROM aircrafts
WHERE aircraft_code = '???';