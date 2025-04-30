
--Tasks in snowflake
CREATE OR REPLACE TABLE sour (
    id INT,
    name VARCHAR,
    created_date DATE
);
INSERT INTO sour (id, name, created_date) VALUES
(1, 'Alice', '2024-01-01'),
(2, 'Bob', '2024-01-05'),
(3, 'Charlie', '2024-01-10'),
(4, 'Diana', '2024-01-15'),
(5, 'Ethan', '2024-01-20');

select * from sour;
CREATE OR REPLACE TABLE target (
    id INT,
    name VARCHAR,
    created_date DATE,
    created_day varchar,
    created_mnth varchar,
    created_year varchar
);
//Insert a record in target table
INSERT INTO target (id, name, created_date, created_day, created_mnth, created_year)
SELECT 
    a.id,
    a.name,
    a.created_date,
    DAY(a.created_date) AS created_day,
    MONTH(a.created_date) AS created_mnth,
    YEAR(a.created_date) AS created_year
FROM sour a
LEFT JOIN target b 
    ON a.id = b.id
WHERE b.id IS NULL;

select * from target;

INSERT INTO sour (id, name, created_date)
VALUES (6, 'Frank', '2024-02-10');

create or replace task my_task
warehouse='COMPUTE_WH'
schedule='1 MINUTE'
AS INSERT INTO TARGET
SELECT 
    a.id,
    a.name,
    a.created_date,
    DAY(a.created_date) AS created_day,
    MONTH(a.created_date) AS created_mnth,
    YEAR(a.created_date) AS created_year
FROM sour a
LEFT JOIN target b 
    ON a.id = b.id
WHERE b.id IS NULL;

SHOW TASKS;

ALTER TASK my_task RESUME;

ALTER TASK my_task SUSPEND;

SELECT * FROM table(information.schema.TASK_HISTORY(TASK_NAME=>'my_task'));
