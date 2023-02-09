/*
1112. Highest Grade For Each Student

Question link
https://www.jiakaobo.com/leetcode/1112.%20Highest%20Grade%20For%20Each%20Student.html
*/


--create table DDL and insert script

CREATE TABLE dbo.enrollments_1112 (
	student_id int NULL,
	course_id int NULL,
	grade int NULL
);

INSERT INTO dbo.enrollments_1112 (student_id,course_id,grade) VALUES
	 (2,2,95),
	 (2,3,95),
	 (1,1,90),
	 (1,2,99),
	 (3,1,80),
	 (3,2,75),
	 (3,3,82);


--Result 
select student_id ,course_id, grade 
from (
	select *,
		RANK() OVER(partition by student_id order by grade desc,course_id asc) as rnk
	from enrollments_1112 ) e
where rnk = 1 
order by student_id 