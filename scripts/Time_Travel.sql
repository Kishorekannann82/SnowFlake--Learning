--Time Travel
CREATE OR REPLACE TABLE drop_table (
    id INT,
    name VARCHAR
);
INSERT INTO drop_table (id, name) VALUES
(1, 'Alice'),
(2, 'Bob'),
(3, 'Charlie'),
(4, 'Diana'),
(5, 'Ethan');

select * from drop_table;

delete from drop_table where id=4;


//time Travel
SELECT * FROM drop_table AT (OFFSET => -60*3);

select *  from drop_table before(statement->'01bc0992-3201-95ed-0000-000d1b32f089');

--Drop Table
drop table drop_table;

undrop table drop_table;

drop schema myschema;

undrop schema myschema;

drop database mydb;

undrop database MYDB;

