CREATE TABLE source_table (
    id INT PRIMARY KEY,
    name VARCHAR(100),
    created_date DATE
);
INSERT INTO source_table (id, name, created_date) VALUES
(1, 'Alice', '2024-01-01'),
(2, 'Bob', '2024-01-05'),
(3, 'Charlie', '2024-01-10'),
(4, 'Diana', '2024-02-01'),
(5, 'Ethan', '2024-02-15'),
(6, 'Fiona', '2024-03-01'),
(7, 'George', '2024-03-10'),
(8, 'Hannah', '2024-03-20'),
(9, 'Ian', '2024-04-01'),
(10, 'Jane', '2024-04-15');


--Creating a standard stream
create or replace stream standard_stream on table source_table;


select * from source_table;     

select * from standard_stream;

INSERT INTO source_table (id, name, created_date) VALUES
(11, 'Kevin', '2024-04-20'),
(12, 'Laura', '2024-04-22'),
(13, 'Mike', '2024-04-25'),
(14, 'Nina', '2024-04-27'),
(15, 'Oscar', '2024-04-30');

delete from source_table where id=3;

update source_table set name='Kishore' where id =1;
//Another type of Streams
CREATE TABLE source_table_2 (
    id INT,
    name STRING,
    created_date DATE,
    PRIMARY KEY (id) -- Optional, informational only
);


INSERT INTO source_table_2 (id, name, created_date) VALUES
(1, 'Anna', '2024-01-03'),
(2, 'Brian', '2024-01-07'),
(3, 'Clara', '2024-01-15'),
(4, 'David', '2024-02-05'),
(5, 'Eva', '2024-02-20'),
(6, 'Frank', '2024-03-05'),
(7, 'Grace', '2024-03-15'),
(8, 'Henry', '2024-03-25'),
(9, 'Isla', '2024-04-05'),
(10, 'Jack', '2024-04-18');


--Creating Append only streams
CREATE OR REPLACE STREAM append_only_stream 
ON TABLE source_table_2 
APPEND_ONLY = TRUE;

INSERT INTO source_table_2 (id, name, created_date) VALUES
(11, 'Kara', '2024-01-25'),
(12, 'Leo', '2024-01-28'),
(13, 'Mona', '2024-02-01'),
(14, 'Nate', '2024-02-04'),
(15, 'Olive', '2024-02-07');

select * from source_table_2;

select * from append_only_stream;

update source_table_2 set name='Murugan' where id=1;

--How do we use stream in ETL Process
CREATE TABLE target_table (
    id INT,
    name STRING,
    created_date DATE
);
insert into target_table 
select id,name,created_date from append_only_stream;

select * from target_table;


INSERT INTO source_table_2 (id, name, created_date) 
VALUES (16, 'Peter', '2024-02-10');

select * from source_table_2;

CREATE OR REPLACE STREAM insert_only_stream 
ON TABLE source_table_2 
INSERT_ONLY = TRUE;
