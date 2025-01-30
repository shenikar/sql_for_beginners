-- ALTER TABLE person_discounts ADD CONSTRAINT ch_nn_person_id CHECK (person_id IS NOT NULL);

-- ALTER TABLE person_discounts ADD CONSTRAINT ch_nn_pizzeria_id CHECK (pizzeria_id IS NOT NULL);

-- ALTER TABLE person_discounts ADD CONSTRAINT ch_nn_discount CHECK (discount IS NOT NULL);

-- ALTER TABLE person_discounts ALTER COLUMN discount SET DEFAULT 0;

-- ALTER TABLE person_discounts ADD CONSTRAINT ch_range_discount CHECK (
--     discount >= 0
--     AND discount <= 100
-- );

select column_default::integer = 0 as check from information_schema.columns where column_name = 'discount' and table_name = 'person_discounts';