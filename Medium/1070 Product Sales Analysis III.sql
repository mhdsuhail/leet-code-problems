
/*
1070. Product Sales Analysis III

Question link
https://www.jiakaobo.com/leetcode/1070.%20Product%20Sales%20Analysis%20III.html
*/


--create table DDL
CREATE TABLE public.sales_1068 (
    sale_id integer,
    product_id integer,
    year integer,
    quantity integer,
    price integer
);


--Insert Script

INSERT INTO public.sales_1068 (sale_id, product_id, year, quantity, price) VALUES (1, 100, 2008, 10, 5000);
INSERT INTO public.sales_1068 (sale_id, product_id, year, quantity, price) VALUES (2, 100, 2009, 12, 5000);
INSERT INTO public.sales_1068 (sale_id, product_id, year, quantity, price) VALUES (7, 200, 2011, 15, 9000);



--Expected Result do refer the question


--My Result 1
SELECT 
product_id,year,quantity,price
FROM 
sales_1068 
WHERE (product_id,year) IN (SELECT product_id,MIN(year)
						  FROM sales_1068 GROUP BY product_id)


--My Result 2
WITH cte AS(
SELECT product_id,MIN(year) as year
FROM sales_1068
GROUP BY product_id
)
SELECT 
s.product_id,s.year,s.quantity,s.price
FROM 
sales_1068 s INNER JOIN cte 
ON s.product_id = cte.product_id and s.year = cte.year