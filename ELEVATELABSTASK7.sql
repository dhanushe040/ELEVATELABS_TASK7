
#All Employee Records
select * from emp ;
/*
101	Rajaram Sundaram	sales	Sales Executive	M	2019-01-10	1980-01-16	12000.00	chennai	C	9988776655
102	Abinaya Krishnamoorthy	sales	Sales Executive	F	2021-02-15	1999-03-22	15000.00	chennai	T	8978675645
103	Naveen Chidambaram	accounts	Manager Manager	M	2023-01-19	1985-04-18	15000.00		R	8698756432
104	Shabeer Salman Khan	accounts	Junior Executive	M	2023-02-26	1990-06-14	10000.00	delhi	C	9089876776
105	Sureshkumar Venkatesan	sales	Sales Manager	M	2016-04-29	1999-07-31	38000.00	chennai	R	9887342312
106	Gayathri Srinivasan	IT	Developer Developer	F	2018-06-30	1980-12-11	60000.00	delhi	R	8923546123
107	Anu Rajagopal	IT	Testing Testing	F	2015-08-23	2003-09-10	12000.00	bangalore	I	7865321986
108	Ashokumar Maheswaran	IT	Testing Testing	M	2023-12-17	2001-06-15	12000.00		I	8900334455
109	Charles Joseph	sales	Sales Manager	M	2024-07-16	2000-05-05	38000.00	delhi	R	8971134231
110	Ashok Narayanan	IT	Developer Developer	M	2024-03-13	1999-08-23	45000.00	bangalore	R	9003276765
111	Annie David	accounts	Manager Manager	F	2024-02-21	1985-07-07	15000.00	delhi	R	9677254321
112	Kavya Rajkumar	sales	Sales Executive	F	2023-05-14	1989-11-27	12000.00	bangalore	I	8220797988
*/

										


#Employee Salary Aggregation by Department
create view aggregation as select empid,ename,dept,salary,
sum(salary) over() as sum_sal,
avg(salary) over() as avg_sal,
min(salary) over(partition by dept) as dept_min,
max(salary) over(partition by dept) as dept_max,
count(salary) over(partition by dept) as dept_count
from emp;

select * from aggregation;
/*
103	Naveen Chidambaram	accounts	15000.00	284000.00	23666.666667	10000.00	15000.00	3
104	Shabeer Salman Khan	accounts	10000.00	284000.00	23666.666667	10000.00	15000.00	3
111	Annie David	accounts	15000.00	284000.00	23666.666667	10000.00	15000.00	3
106	Gayathri Srinivasan	IT	60000.00	284000.00	23666.666667	12000.00	60000.00	4
107	Anu Rajagopal	IT	12000.00	284000.00	23666.666667	12000.00	60000.00	4
108	Ashokumar Maheswaran	IT	12000.00	284000.00	23666.666667	12000.00	60000.00	4
110	Ashok Narayanan	IT	45000.00	284000.00	23666.666667	12000.00	60000.00	4
101	Rajaram Sundaram	sales	12000.00	284000.00	23666.666667	12000.00	38000.00	5
102	Abinaya Krishnamoorthy	sales	15000.00	284000.00	23666.666667	12000.00	38000.00	5
105	Sureshkumar Venkatesan	sales	38000.00	284000.00	23666.666667	12000.00	38000.00	5
109	Charles Joseph	sales	38000.00	284000.00	23666.666667	12000.00	38000.00	5
112	Kavya Rajkumar	sales	12000.00	284000.00	23666.666667	12000.00	38000.00	5
*/


#Employee Salary Contribution Percentage
create view per_salary as select empid,ename,dept,salary,
sum(salary) over() as total_sal_exp,
(salary/sum(salary) over())*100 as per from emp;


select * from per_salary;
/*
101	Rajaram Sundaram	sales	12000.00	284000.00	4.225352
102	Abinaya Krishnamoorthy	sales	15000.00	284000.00	5.281690
103	Naveen Chidambaram	accounts	15000.00	284000.00	5.281690
104	Shabeer Salman Khan	accounts	10000.00	284000.00	3.521127
105	Sureshkumar Venkatesan	sales	38000.00	284000.00	13.380282
106	Gayathri Srinivasan	IT	60000.00	284000.00	21.126761
107	Anu Rajagopal	IT	12000.00	284000.00	4.225352
108	Ashokumar Maheswaran	IT	12000.00	284000.00	4.225352
109	Charles Joseph	sales	38000.00	284000.00	13.380282
110	Ashok Narayanan	IT	45000.00	284000.00	15.845070
111	Annie David	accounts	15000.00	284000.00	5.281690
112	Kavya Rajkumar	sales	12000.00	284000.00	4.225352
*/

#Quarterly Sales Breakdown by Representative
CREATE VIEW QT AS
SELECT REPID,
CASE WHEN quarter=1 THEN qtrsales ELSE ""END AS Q1,
CASE
 WHEN quarter=2 THEN qtrsales ELSE "" END AS Q2,
CASE
 WHEN quarter=3 THEN qtrsales ELSE "" END AS Q3,
 CASE
 WHEN quarter=4 THEN qtrsales ELSE "" END AS Q4
 FROM YEARSALES 
 ;
 

 select * from qt;
 /*
 101	200000.00			
102	30000.00			
103	25000.00			
101		250000.00		
102		70000.00		
103		15000.00		
101			245000.00	
102			29000.00	
103			40000.00	
101				265000.00
102				56000.00
103				32000.00
*/


#Top Earners by Department: Sales, Accounts, and IT
create view  max_sal_emp as   SELECT * FROM EMP WHERE (DEPT,SALARY) IN 
(SELECT  DEPT,MAX(SALARY) FROM EMP  WHERE DEPT IN ('SALES','ACCOUNTS','IT') group by dept );


select * from max_sal_emp;
/*
103	Naveen Chidambaram	accounts	Manager Manager	M	2023-01-19	1985-04-18	15000.00		R	8698756432
105	Sureshkumar Venkatesan	sales	Sales Manager	M	2016-04-29	1999-07-31	38000.00	chennai	R	9887342312
106	Gayathri Srinivasan	IT	Developer Developer	F	2018-06-30	1980-12-11	60000.00	delhi	R	8923546123
109	Charles Joseph	sales	Sales Manager	M	2024-07-16	2000-05-05	38000.00	delhi	R	8971134231
111	Annie David	accounts	Manager Manager	F	2024-02-21	1985-07-07	15000.00	delhi	R	9677254321
*/

#Movie Review Classification Based on Rental Duration
create view movie_review as 
with cte as(
select rental_id,datediff(return_date,rental_date)  as ren  from  rental)
select *,case 
when ren<=3 then "one time watched" 
when ren<=6 then "most liked" 
when ren>6 then "must watch" 
end as MOVIE_REVIEW
from cte;


select * from movie_review;
/*
1	2	one time watched
2	4	most liked
3	8	must watch
4	10	must watch
5	9	must watch
6	3	one time watched
7	5	most liked
8	3	one time watched
9	3	one time watched
10	6	most liked
*/

#Employees with Mid-Range Salaries
CREATE VIEW MID_RANGE_SALARY AS SELECT * FROM EMP WHERE SALARY >(SELECT MIN(SALARY) FROM EMP ) AND SALARY<(SELECT MAX(SALARY) FROM EMP);


SELECT * FROM MID_RANGE_SALARY;
/*
101	Rajaram Sundaram	sales	Sales Executive	M	2019-01-10	1980-01-16	12000.00	chennai	C	9988776655
102	Abinaya Krishnamoorthy	sales	Sales Executive	F	2021-02-15	1999-03-22	15000.00	chennai	T	8978675645
103	Naveen Chidambaram	accounts	Manager Manager	M	2023-01-19	1985-04-18	15000.00		R	8698756432
105	Sureshkumar Venkatesan	sales	Sales Manager	M	2016-04-29	1999-07-31	38000.00	chennai	R	9887342312
107	Anu Rajagopal	IT	Testing Testing	F	2015-08-23	2003-09-10	12000.00	bangalore	I	7865321986
108	Ashokumar Maheswaran	IT	Testing Testing	M	2023-12-17	2001-06-15	12000.00		I	8900334455
109	Charles Joseph	sales	Sales Manager	M	2024-07-16	2000-05-05	38000.00	delhi	R	8971134231
110	Ashok Narayanan	IT	Developer Developer	M	2024-03-13	1999-08-23	45000.00	bangalore	R	9003276765
111	Annie David	accounts	Manager Manager	F	2024-02-21	1985-07-07	15000.00	delhi	R	9677254321
112	Kavya Rajkumar	sales	Sales Executive	F	2023-05-14	1989-11-27	12000.00	bangalore	I	8220797988
*/


#Identifying January-Only Customers in Swiggy Orders
CREATE VIEW  CUST_ORDER AS
 SELECT CUSTOMER_ID ,CUSTOMER_NAME FROM SWIGGY  WHERE MONTH(ORDER_DATE)=1 
 EXCEPT
 SELECT CUSTOMER_ID ,CUSTOMER_NAME FROM SWIGGY WHERE MONTH(ORDER_DATE)=2;


SELECT * FROM CUST_ORDER;
/*
1	Rahul
2	Sneha
*/

CREATE VIEW GEN AS
SELECT GENDER,
   COUNT(CASE WHEN DEPT="SALES" THEN GENDER END) AS SALES,
   COUNT(CASE WHEN DEPT="ACCOUNTS" THEN GENDER END) AS ACCOUNTS,
   COUNT(CASE WHEN DEPT="IT" THEN GENDER END) AS IT
   FROM EMP
   GROUP BY GENDER;
   
SELECT * FROM GEN;
/*
M	3	2	2
F	2	1	2
*/
   
   
   