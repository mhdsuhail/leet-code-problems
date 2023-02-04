/*
1070. Product Sales Analysis III

Question link
https://www.jiakaobo.com/leetcode/1077.%20Project%20Employees%20III.html
*/


--create table DDL and insert script


CREATE TABLE dbo.employee_1077 (
	employee_id int NULL,
	"name" varchar(max) NULL,
	experience_years int NULL
);


INSERT INTO dbo.employee_1077 (employee_id,"name",experience_years) VALUES
	 (1,'Khaled',3),
	 (2,'Ali',2),
	 (4,'Doe',2),
	 (3,'John',3);



CREATE TABLE dbo.project_1077 (
	project_id int NULL,
	employee_id int NULL
);


INSERT INTO dbo.project_1077 (project_id,employee_id) VALUES
	 (1,1),
	 (1,2),
	 (1,3),
	 (2,1),
	 (2,4);



--Result 
with cte as(
select 
p.*,
rank() over(partition by p.project_id order by e.experience_years desc) as rnk
from 
project_1077 p inner join employee_1077 e 
on p.employee_id = e.employee_id )

select 
project_id,employee_id
from cte
where rnk =1
