/*
1107. New Users Daily Count

Question link
https://www.jiakaobo.com/leetcode/1107.%20New%20Users%20Daily%20Count.html
*/


--create table DDL and insert script

CREATE TABLE dbo.traffic_1107 (
	user_id int NULL,
	activity varchar(100) NULL,
	activity_date date NULL
);

INSERT INTO dbo.traffic_1107 (user_id,activity,activity_date) VALUES
	 (1,'login','2019-05-01'),
	 (1,'homepage','2019-05-01'),
	 (1,'logout','2019-05-01'),
	 (2,'login','2019-06-21'),
	 (2,'logout','2019-06-21'),
	 (3,'login','2019-01-01'),
	 (3,'jobs','2019-01-01'),
	 (3,'logout','2019-01-01'),
	 (4,'login','2019-06-21'),
	 (4,'groups','2019-06-21');
INSERT INTO dbo.traffic_1107 (user_id,activity,activity_date) VALUES
	 (4,'logout','2019-06-21'),
	 (5,'login','2019-03-01'),
	 (5,'logout','2019-03-01'),
	 (5,'login','2019-06-21'),
	 (5,'logout','2019-06-21');


--Result 
with cte as(
select 
*,
rank() over(partition by user_id,activity order by activity_date asc) as rnk
from traffic_1107
where activity ='login')
select 
activity_date,count(1) as user_count
from cte 
where rnk =1 
and activity_date between DateADD(day,-90,'2019-06-30') and  '2019-06-30'
group by activity_date