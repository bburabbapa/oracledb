select max(salary),min(salary) from emplyees;
select department_id,avg(salary)
from employees
group by department_id;
-- 2. 전체평균을 출력하시오.
select avg(salary) from employees; --6461


select department_id,max(salary),min(salary),round(avg(salary),2) as stu_avg 
from employees 
where department_id>50
group by department_id 
having avg(salary)>5000 
order by department_id;
--그룹함수의 조건은 having사용
--일반함수의 조건은 where사용

select * from employees;

select employee_id,emp_name,department_id,job_id from employees;

desc departments;

select * from departments;

select employee_id,emp_name,employees.department_id,department_name,departments.manager_id,departments.create_date 
from employees, departments
where employees.department_id = departments.department_id;

select * from employees; --107
select * from departments; --27
select count(*) from employees,departments;--2889

--equi 조인트: 공통의 컬럼을 가지고 검색
select employees.department_id,departments.department_name 
from employees,departments
where employees.department_id=departments.department_id;
--축약
select a.department_id, department_name 
from employees a,departments b
where a.department_id=b.department_id;

select * from jobs;
--employees 와 jobs의 사원이름 사원번호 직급 최대월급과 최소월급 출력
select employees.department_id,employees.emp_name,employees.job_id,
jobs.max_salary,jobs.min_salary
from employees,jobs
where employees.job_id = jobs.job_id;

select * from stuscore;
select * from member;

drop table stuinfo;

----
create table stuinfo (
	stunum number(4),
	name VARCHAR2(50),
	grade number,
	email VARCHAR2(50),
	phone VARCHAR2(50),
	gender VARCHAR2(50),
	address VARCHAR2(50)
);
commit;

--이름변경
select * from stuinfo;

select * from stuscore;

update stuscore a set a.name = (select b.name from stuinfo b where a.stunum = b. stunum);

commit;
--스투스코어의 네임컬럼을 삭제--
alter table stuscore drop column name;

drop table stuscore;


--------
create table stuscore (
	stunum number,
	kor number,
	eng number,
	math number,
	total number,
	avg number,
	rank number
);
insert into stuscore (stunum, kor, eng, math, total, avg, rank) values (1, 90, 69, 90, 249, 83, 0);
insert into stuscore (stunum, kor, eng, math, total, avg, rank) values (2, 65, 83, 91, 239, 79.6666666667, 0);
insert into stuscore (stunum, kor, eng, math, total, avg, rank) values (3, 64, 91, 94, 249, 83, 0);
insert into stuscore (stunum, kor, eng, math, total, avg, rank) values (4, 73, 72, 62, 207, 69, 0);
insert into stuscore (stunum, kor, eng, math, total, avg, rank) values (5, 51, 80, 64, 195, 65, 0);
insert into stuscore (stunum, kor, eng, math, total, avg, rank) values (6, 90, 57, 91, 238, 79.3333333333, 0);
insert into stuscore (stunum, kor, eng, math, total, avg, rank) values (7, 50, 63, 52, 165, 55, 0);
insert into stuscore (stunum, kor, eng, math, total, avg, rank) values (8, 77, 98, 82, 257, 85.6666666667, 0);
insert into stuscore (stunum, kor, eng, math, total, avg, rank) values (9, 94, 58, 92, 244, 81.3333333333, 0);
insert into stuscore (stunum, kor, eng, math, total, avg, rank) values (10, 55, 76, 66, 197, 65.6666666667, 0);
insert into stuscore (stunum, kor, eng, math, total, avg, rank) values (11, 79, 54, 94, 227, 75.6666666667, 0);
insert into stuscore (stunum, kor, eng, math, total, avg, rank) values (12, 89, 61, 75, 225, 75, 0);
insert into stuscore (stunum, kor, eng, math, total, avg, rank) values (13, 79, 93, 100, 272, 90.6666666667, 0);
insert into stuscore (stunum, kor, eng, math, total, avg, rank) values (14, 86, 75, 53, 214, 71.3333333333, 0);
insert into stuscore (stunum, kor, eng, math, total, avg, rank) values (15, 66, 73, 50, 189, 63, 0);
insert into stuscore (stunum, kor, eng, math, total, avg, rank) values (16, 73, 69, 55, 197, 65.6666666667, 0);
insert into stuscore (stunum, kor, eng, math, total, avg, rank) values (17, 82, 50, 62, 194, 64.6666666667, 0);
insert into stuscore (stunum, kor, eng, math, total, avg, rank) values (18, 86, 87, 87, 260, 86.6666666667, 0);
insert into stuscore (stunum, kor, eng, math, total, avg, rank) values (19, 99, 75, 63, 237, 79, 0);
insert into stuscore (stunum, kor, eng, math, total, avg, rank) values (20, 86, 74, 73, 233, 77.6666666667, 0);
insert into stuscore (stunum, kor, eng, math, total, avg, rank) values (21, 61, 55, 53, 169, 56.3333333333, 0);
insert into stuscore (stunum, kor, eng, math, total, avg, rank) values (22, 70, 50, 51, 171, 57, 0);
insert into stuscore (stunum, kor, eng, math, total, avg, rank) values (23, 70, 94, 82, 246, 82, 0);
insert into stuscore (stunum, kor, eng, math, total, avg, rank) values (24, 59, 83, 71, 213, 71, 0);
insert into stuscore (stunum, kor, eng, math, total, avg, rank) values (25, 99, 52, 92, 243, 81, 0);
insert into stuscore (stunum, kor, eng, math, total, avg, rank) values (26, 83, 55, 94, 232, 77.3333333333, 0);
insert into stuscore (stunum, kor, eng, math, total, avg, rank) values (27, 87, 78, 80, 245, 81.6666666667, 0);
insert into stuscore (stunum, kor, eng, math, total, avg, rank) values (28, 66, 58, 61, 185, 61.6666666667, 0);
insert into stuscore (stunum, kor, eng, math, total, avg, rank) values (29, 76, 51, 99, 226, 75.3333333333, 0);
insert into stuscore (stunum, kor, eng, math, total, avg, rank) values (30, 84, 77, 50, 211, 70.3333333333, 0);
insert into stuscore (stunum, kor, eng, math, total, avg, rank) values (31, 72, 92, 97, 261, 87, 0);
insert into stuscore (stunum, kor, eng, math, total, avg, rank) values (32, 64, 91, 66, 221, 73.6666666667, 0);
insert into stuscore (stunum, kor, eng, math, total, avg, rank) values (33, 50, 69, 56, 175, 58.3333333333, 0);
insert into stuscore (stunum, kor, eng, math, total, avg, rank) values (34, 90, 84, 81, 255, 85, 0);
insert into stuscore (stunum, kor, eng, math, total, avg, rank) values (35, 97, 75, 64, 236, 78.6666666667, 0);
insert into stuscore (stunum, kor, eng, math, total, avg, rank) values (36, 96, 93, 76, 265, 88.3333333333, 0);
insert into stuscore (stunum, kor, eng, math, total, avg, rank) values (37, 54, 73, 50, 177, 59, 0);
insert into stuscore (stunum, kor, eng, math, total, avg, rank) values (38, 56, 77, 95, 228, 76, 0);
insert into stuscore (stunum, kor, eng, math, total, avg, rank) values (39, 63, 91, 56, 210, 70, 0);
insert into stuscore (stunum, kor, eng, math, total, avg, rank) values (40, 54, 80, 97, 231, 77, 0);
insert into stuscore (stunum, kor, eng, math, total, avg, rank) values (41, 58, 80, 51, 189, 63, 0);
insert into stuscore (stunum, kor, eng, math, total, avg, rank) values (42, 96, 56, 72, 224, 74.6666666667, 0);
insert into stuscore (stunum, kor, eng, math, total, avg, rank) values (43, 77, 79, 69, 225, 75, 0);
insert into stuscore (stunum, kor, eng, math, total, avg, rank) values (44, 81, 64, 55, 200, 66.6666666667, 0);
insert into stuscore (stunum, kor, eng, math, total, avg, rank) values (45, 76, 68, 71, 215, 71.6666666667, 0);
insert into stuscore (stunum, kor, eng, math, total, avg, rank) values (46, 58, 57, 84, 199, 66.3333333333, 0);
insert into stuscore (stunum, kor, eng, math, total, avg, rank) values (47, 50, 71, 70, 191, 63.6666666667, 0);
insert into stuscore (stunum, kor, eng, math, total, avg, rank) values (48, 57, 68, 55, 180, 60, 0);
insert into stuscore (stunum, kor, eng, math, total, avg, rank) values (49, 90, 70, 74, 234, 78, 0);
insert into stuscore (stunum, kor, eng, math, total, avg, rank) values (50, 100, 92, 62, 254, 84.6666666667, 0);
insert into stuscore (stunum, kor, eng, math, total, avg, rank) values (51, 82, 79, 57, 218, 72.6666666667, 0);
insert into stuscore (stunum, kor, eng, math, total, avg, rank) values (52, 55, 50, 57, 162, 54, 0);
insert into stuscore (stunum, kor, eng, math, total, avg, rank) values (53, 60, 76, 85, 221, 73.6666666667, 0);
insert into stuscore (stunum, kor, eng, math, total, avg, rank) values (54, 70, 79, 72, 221, 73.6666666667, 0);
insert into stuscore (stunum, kor, eng, math, total, avg, rank) values (55, 71, 77, 94, 242, 80.6666666667, 0);
insert into stuscore (stunum, kor, eng, math, total, avg, rank) values (56, 91, 96, 50, 237, 79, 0);
insert into stuscore (stunum, kor, eng, math, total, avg, rank) values (57, 89, 61, 94, 244, 81.3333333333, 0);
insert into stuscore (stunum, kor, eng, math, total, avg, rank) values (58, 59, 79, 71, 209, 69.6666666667, 0);
insert into stuscore (stunum, kor, eng, math, total, avg, rank) values (59, 92, 70, 76, 238, 79.3333333333, 0);
insert into stuscore (stunum, kor, eng, math, total, avg, rank) values (60, 71, 58, 94, 223, 74.3333333333, 0);
insert into stuscore (stunum, kor, eng, math, total, avg, rank) values (61, 98, 68, 81, 247, 82.3333333333, 0);
insert into stuscore (stunum, kor, eng, math, total, avg, rank) values (62, 68, 84, 97, 249, 83, 0);
insert into stuscore (stunum, kor, eng, math, total, avg, rank) values (63, 81, 71, 89, 241, 80.3333333333, 0);
insert into stuscore (stunum, kor, eng, math, total, avg, rank) values (64, 51, 72, 60, 183, 61, 0);
insert into stuscore (stunum, kor, eng, math, total, avg, rank) values (65, 84, 74, 74, 232, 77.3333333333, 0);
insert into stuscore (stunum, kor, eng, math, total, avg, rank) values (66, 90, 89, 96, 275, 91.6666666667, 0);
insert into stuscore (stunum, kor, eng, math, total, avg, rank) values (67, 63, 55, 85, 203, 67.6666666667, 0);
insert into stuscore (stunum, kor, eng, math, total, avg, rank) values (68, 68, 93, 53, 214, 71.3333333333, 0);
insert into stuscore (stunum, kor, eng, math, total, avg, rank) values (69, 57, 73, 100, 230, 76.6666666667, 0);
insert into stuscore (stunum, kor, eng, math, total, avg, rank) values (70, 52, 95, 81, 228, 76, 0);
insert into stuscore (stunum, kor, eng, math, total, avg, rank) values (71, 89, 59, 78, 226, 75.3333333333, 0);
insert into stuscore (stunum, kor, eng, math, total, avg, rank) values (72, 73, 61, 71, 205, 68.3333333333, 0);
insert into stuscore (stunum, kor, eng, math, total, avg, rank) values (73, 90, 94, 96, 280, 93.3333333333, 0);
insert into stuscore (stunum, kor, eng, math, total, avg, rank) values (74, 69, 56, 91, 216, 72, 0);
insert into stuscore (stunum, kor, eng, math, total, avg, rank) values (75, 62, 96, 65, 223, 74.3333333333, 0);
insert into stuscore (stunum, kor, eng, math, total, avg, rank) values (76, 63, 62, 66, 191, 63.6666666667, 0);
insert into stuscore (stunum, kor, eng, math, total, avg, rank) values (77, 91, 68, 62, 221, 73.6666666667, 0);
insert into stuscore (stunum, kor, eng, math, total, avg, rank) values (78, 96, 84, 61, 241, 80.3333333333, 0);
insert into stuscore (stunum, kor, eng, math, total, avg, rank) values (79, 78, 94, 50, 222, 74, 0);
insert into stuscore (stunum, kor, eng, math, total, avg, rank) values (80, 95, 59, 57, 211, 70.3333333333, 0);
insert into stuscore (stunum, kor, eng, math, total, avg, rank) values (81, 55, 88, 69, 212, 70.6666666667, 0);
insert into stuscore (stunum, kor, eng, math, total, avg, rank) values (82, 93, 78, 76, 247, 82.3333333333, 0);
insert into stuscore (stunum, kor, eng, math, total, avg, rank) values (83, 78, 79, 57, 214, 71.3333333333, 0);
insert into stuscore (stunum, kor, eng, math, total, avg, rank) values (84, 50, 95, 89, 234, 78, 0);
insert into stuscore (stunum, kor, eng, math, total, avg, rank) values (85, 91, 62, 75, 228, 76, 0);
insert into stuscore (stunum, kor, eng, math, total, avg, rank) values (86, 65, 54, 91, 210, 70, 0);
insert into stuscore (stunum, kor, eng, math, total, avg, rank) values (87, 91, 54, 92, 237, 79, 0);
insert into stuscore (stunum, kor, eng, math, total, avg, rank) values (88, 76, 76, 87, 239, 79.6666666667, 0);
insert into stuscore (stunum, kor, eng, math, total, avg, rank) values (89, 83, 100, 65, 248, 82.6666666667, 0);
insert into stuscore (stunum, kor, eng, math, total, avg, rank) values (90, 52, 52, 74, 178, 59.3333333333, 0);
insert into stuscore (stunum, kor, eng, math, total, avg, rank) values (91, 88, 90, 71, 249, 83, 0);
insert into stuscore (stunum, kor, eng, math, total, avg, rank) values (92, 89, 92, 75, 256, 85.3333333333, 0);
insert into stuscore (stunum, kor, eng, math, total, avg, rank) values (93, 57, 85, 80, 222, 74, 0);
insert into stuscore (stunum, kor, eng, math, total, avg, rank) values (94, 64, 96, 74, 234, 78, 0);
insert into stuscore (stunum, kor, eng, math, total, avg, rank) values (95, 57, 53, 64, 174, 58, 0);
insert into stuscore (stunum, kor, eng, math, total, avg, rank) values (96, 84, 61, 93, 238, 79.3333333333, 0);
insert into stuscore (stunum, kor, eng, math, total, avg, rank) values (97, 84, 87, 85, 256, 85.3333333333, 0);
insert into stuscore (stunum, kor, eng, math, total, avg, rank) values (98, 97, 85, 83, 265, 88.3333333333, 0);
insert into stuscore (stunum, kor, eng, math, total, avg, rank) values (99, 51, 69, 72, 192, 64, 0);
insert into stuscore (stunum, kor, eng, math, total, avg, rank) values (100, 77, 64, 92, 233, 77.6666666667, 0);


commit;

select * from stuscore;

desc stuinfo;
--스투인포와 스투스코어를 조인트
select a.stunum,name,grade,total,avg,rank 
from stuinfo a, stuscore b
where a.stunum = b.stunum;



