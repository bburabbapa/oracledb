select * from departments;

--테이블에서 열을 오름차순으로 정렬--
select * from departments order by manager_id asc;
--테이블에서 열을 내림차순으로 정렬--
select * from departments order by manager_id desc; 

select * from employees where employee_id>=200;

select * from employees where employee_id>=190 and employee_id<=205;

--5천이상 연봉을 오름차순으로 정렬--
select * from employees where salary>=5000 order by salary asc; 

--employees의 속성가져오기--
select employee_id,emp_name,job_id,department_id,salary from employees;

--테이블의 데이터를 복사하기
create table emp2 as select * from employees;

select * from emp2;

--컬럼타입--
desc emp2;

--컬럼이름변경--
alter table emp2 rename column emp_name to e_name;

--컬럼데이터타입의 길이변경(email안 데이터가 숫자가 아니면 변경이 불가)--
alter table emp2 modify email varchar2(10);

--컬럼삭제--
alter table emp2 drop column create_date;

--컬럼추가--
alter table emp2 add create_date date;

--컬럼순서변경--
alter table emp2 modify update_date invisible;
alter table emp2 modify update_date visible;
select * from emp2;


--컬럼데이터만 복사--
insert into emp2 select * from employees;

select * from emp2;

--이름연봉입사일을 오름차순으로 정렬--
select emp_name,salary,hire_date from employees order by emp_name asc;

alter table emp2 modify salary invisible;
alter table emp2 modify manager_id invisible;
alter table emp2 modify commission_pct invisible;
alter table emp2 modify retire_date invisible;
alter table emp2 modify department_id invisible;
alter table emp2 modify job_id invisible;
alter table emp2 modify create_date invisible;

alter table emp2 modify salary visible;
alter table emp2 modify manager_id visible;
alter table emp2 modify commission_pct visible;
alter table emp2 modify retire_date visible;
alter table emp2 modify department_id visible;
alter table emp2 modify job_id visible;
alter table emp2 modify create_date visible;

select salary,salary+100 from employees; 

--별칭선언 as생략이 가능함--
select salary,salary*12 y_salary,salary*12*1342 as k_salary from employees; 
select * from employees;

--연봉--
select salary,salary*12,commission_pct from employees;
select salary,
salary*12 as"연봉",
(salary*12)*nvl(commission_pct,0) as "인센티브",
(salary*12)+(salary*12)*nvl(commission_pct,0) as "실제연봉" from employees;

select nvl(manager_id,0) from employees;


--사번 월급 연봉 연봉+커미션을 출력하고 이름을 바꾸시오--
select employee_id,salary,job_id,salary*12 as y_salary,(salary*12)*nvl(commission_pct,0) as c_salary from employees;

select * from employees where salary=6000;

--커미션이 없는 사람만 출력--
select * from employees where commission_pct is null;
select * from employees where commission_pct is not null;
select commission_pct from employees;

select * from departments;

select  department_id as "부서번호",department_name as "부서명" from departments
 where department_id>=10 and  department_id<=40;
 
 
 
 select emp_name || +'is a' || job_id as name from employees;
 select concat(concat(emp_name,'is a'), job_id) as con_name from employees;
 
 
 
 select * from stuscore;
 select kor,eng,math,kor+eng+math,(kor+eng+math)/3 from stuscore;
 
 
 --중복제거 후 오름차순--
 select  DISTINCT department_id from employees order by department_id asc;
 --중복제거 후 내림차순--
 select  DISTINCT job_id from employees order by job_id desc;
 

 select * from employees where salary=3000 or salary=5000 or  salary=6000;
select * from employees where salary>=3000 or salary<=10000 order by salary desc;
  
 select * from employees where salary<=5000; 
 --5000이상인 사원이름 월급 인상된원화를 출력하시오--
select emp_name,salary*12 as"월급",(salary*12*1342)+1000 as "원화" from employees where salary<=5000; 

 
 
 --부서번호가 10 20 30 을 출력하시오--
select * from departments;
 
 select  department_id as "부서번호",department_name as "부서명",manager_id as "관리자이름",create_date as "입력일" from departments
 where department_id=10 or department_id=20 or department_id=30;
 


-- 4000이상 8000이하 사원번호 사원이름 급여 입사일 부서번호 출력하시오--
 select * from employees; 
 select  employee_id as"사원번호",emp_name as"사원이름",salary as "급여",hire_date as "입사일",hire_date+100 as "추가된날" ,job_id as "부서번호" from employees 
 where salary>=4000 and salary<=8000 and hire_date>'03/09/01' order by emp_name asc;

commit;


 
 
 
 









