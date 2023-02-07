/*
1098. Unpopular Books

Question link
https://www.jiakaobo.com/leetcode/1098.%20Unpopular%20Books.html
*/


--create table DDL and insert script

CREATE TABLE dbo.books_1098 (
	book_id int NULL,
	"name" varchar(max) NULL,
	available_from date NULL
);

INSERT INTO dbo.books_1098 (book_id,"name",available_from) VALUES
	 (1,'Kalila And Demna','2010-01-01'),
	 (2,'28 Letters','2012-05-12'),
	 (3,'The Hobbit','2019-06-10'),
	 (4,'13 Reasons Why','2019-06-01'),
	 (5,'The Hunger Games','2008-09-21');



CREATE TABLE dbo.orders_1098 (
	order_id int NULL,
	book_id int NULL,
	quantity int NULL,
	dispatch_date date NULL
);


INSERT INTO dbo.orders_1098 (order_id,book_id,quantity,dispatch_date) VALUES
	 (1,1,2,'2018-07-26'),
	 (2,1,1,'2018-11-05'),
	 (3,3,8,'2019-06-11'),
	 (4,4,6,'2019-06-05'),
	 (5,4,5,'2019-06-20'),
	 (6,5,9,'2009-02-02'),
	 (7,5,8,'2010-04-13');


--Result 
select 
* 
from books_1098 b2 
where b2.available_from <  '2019-05-23' 
and b2.book_id not in(

select 
book_id
from 
orders_1098 o2 
where dispatch_date between '2018-06-23' and '2019-06-23'
group by book_id 
having sum(quantity) >= 10 )