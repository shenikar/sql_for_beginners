-- COMMENT ON TABLE person_discounts IS 'Эта таблица хранит информацию о скидках, применяемых к отдельным лицам для конкретных пиццерий.';

-- COMMENT ON COLUMN person_discounts.id IS 'Уникальный идентификатор каждой записи о скидке.';

-- COMMENT ON COLUMN person_discounts.person_id IS 'Идентификатор лица, для которого применяется скидка.';

-- COMMENT ON COLUMN person_discounts.pizzeria_id IS 'Идентификатор пиццерии, в которой применяется скидка.';

-- COMMENT ON COLUMN person_discounts.discount IS 'Процентное значение, представляющее размер скидки, применяемой лицу для указанной пиццерии.';

SELECT count(*) = 5 as check FROM pg_description WHERE objoid = 'person_discounts'::regclass;