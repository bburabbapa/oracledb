select * from employees;

select salary,salary*100,salary-100 from employees;

--dual  임시 더미 테이블--
select sysdate,sysdate from dual;

select 1+3 from dual;
--문자3을 사칙연산하면 숫자로 자동 변환출력--
select 1+'3' from dual;

--select 1+'a' from dual; 문자는 변환불가--

--select 'a'+'b' from dual; 문자는 변환불가--

select 'a' || 'b' from dual;

select concat('a','b') from dual;



--emp_name(email) 함께 출력하시오--
select emp_name,email from employees;
select emp_name ||'('|| email ||')' as name from employees;
select concat(emp_name,concat('(',concat(email,')'))) as name from employees;


select employee_id,emp_name,hire_date from employees order by hire_date asc;
--00/00/00 / 00-00-00  / 000-00-00 --
select * from employees where hire_date>='2000-01-01' order by hire_date asc;


select * from employees order by salary desc; 
select count(*) from employees;
select max(salary) from employees;
select * from employees where salary=24000; 
--다른테이블삽입--
select * from employees where salary=(select max(salary) from employees);

select * from employees where commission_pct is not null;
select * from employees where commission_pct is null;
select * from employees where department_id>=80 order by department_id asc;
--부서번호가 80번만 제외--
select * from employees where not department_id = 80;
select * from employees where  department_id != 80;

--부서번호가 50번이면서 연봉이 6000이상--
select * from employees where department_id=50 and salary>=6000;
--and--
select * from employees where salary>=2000 and salary<=3000;
--between--
select * from employees where salary between 2000 and 3000;
--or--
select * from employees where salary=3000 or  salary=4000 or  salary=6000; 
select * from employees where salary in(3000,4000,6000);



--avg count max min--
select round(avg(salary)) from employees;
--평균보다 작은 월급--
select * from employees where salary<=6462 order by salary desc;
select * from employees where salary<=(select round(avg(salary)) from employees) order by salary desc;


--사원번호가 101 151 200인 사원번호와 연봉을 출력하시오--
select employee_id as"사원번호",salary as "연봉" from employees where employee_id =101 or employee_id=151 or employee_id=200;
select employee_id as"사원번호",salary as "연봉" from employees where employee_id in(101,151,200);

--2000미만 3000이상--
select emp_name,salary from employees where salary>=2000 and salary<=3000;--둘다--
select * from employees where salary<2000 or salary>3000;--둘중하나--
select * from employees where salary not between 2000 and 3000;--속하지않는것--


--입사일 00/00/01 ~ 00/12/31 출력--
select * from employees where hire_date>='2000-01-01' and hire_date<='2000-12-31'  order by hire_date asc;
select * from employees where hire_date between '00/01/01' and '00/12/31';

--이름이 S로 시작되는 이름 출력--
select emp_name from employees where emp_name like 'S%';--시작--
select emp_name from employees where emp_name like '%n';--끝--
select emp_name from employees where emp_name like '%e%';--중간--

select * from board;
select * from board where bcontent like '%faucibus%';
select btitle as "영화제목", bcontent as"영화내용" from board where bcontent like '%ven%' or btitle like '%ven%';
--n으로 시작하면서 4글자 출력--
select bcontent from board where bcontent like '%n___';

select * from employees;
select emp_name from employees where emp_name like 'P__ %'; --한칸띄어줄것!!--
select emp_name from employees where emp_name like 'D____ %';
select emp_name from employees where emp_name like '%a%';

select * from employees where emp_name like '_a%';

--월급을 낮은 순 부터--
select * from employees order by salary asc;
select * from employees order by salary desc;
--입사일 사원명 역순정렬--
select employee_id,emp_name,job_id,hire_date from employees order by hire_date desc;
select employee_id,emp_name,job_id,hire_date from employees order by emp_name desc;
--부서번호 순차정렬 이름역순정렬--
select employee_id,emp_name,department_id,job_id,hire_date from employees order by department_id asc, emp_name desc;
--월급 순차정렬 입사일 역순정렬--
select employee_id,emp_name,department_id,job_id,hire_date,salary from employees order by salary asc, hire_date desc;

--abs: 절댓값--
select -10,abs(-10) from dual;

--floor: 완전버림-- 
select 10.54578,floor(10.54578) from dual;

--trunc: 잘라버림--
select 10.54578,trunc(10.54578,2) from dual;--둘째자리까지잘라버림--

--round: 반올림--
select 10.54578, round(10.54578),round(10.54578,3) from dual;--셋째자리까지 반올림--

--mod: 나머지함수--

select mod(27,2), mod(27,5),mod(27,7) from dual;

--사번이 홀수인 사원 출력--
select * from employees where mod(employee_id,2)=1 order by employee_id asc;
--사번이 짝수인 사원 출력--
select * from employees where mod (employee_id,2)=0 order by employee_id asc;


--관리자가 짝수인 사원출력--
select employee_id,emp_name,hire_date,salary,manager_id,job_id from employees where mod(manager_id,2)=0 order by employee_id asc;


select * from stuscore;
select stunum,name,math,eng,kor+eng,round(kor+math)/2 from stuscore;

--월급을 원화로 환산 소수점둘쨰자리 반올림--
select * from employees;
select employee_id,emp_name,salary*1345.32, round(salary*12*1342.32,2) as "원화" from employees order by employee_id asc;


--입사일이 현재 날짜까지 걸린 일자를 출력--
select round(sysdate - hire_date,3) from employees; 

--입사일에서 현재날짜까지 걸린 일자 출력 소수점은 반올림 일을 년으로 환산--
select emp_name as "사원명",floor(round(sysdate - hire_date,2)/365) as sdate from employees order by sdate asc ; 


select * from board;
select bhit from board;
select round(avg(bhit)) from board;
--평균조회수 반올림과 소수점 버림--
select floor(round(avg(bhit))) from board;
--평균보다 높은 조회수 출력--
select * from board where bhit>=(select avg(bhit) from board);
select * from board where bhit>=492;
--값에 쉼표형식으로 추가--
select to_char(salary,'999,999'),to_char(round(salary*1342.32),'999,999,999') from employees;

--sequence--
create sequence member_seq
start with 1
increment by 1
maxvalue 99999 
minvalue 1 
nocycle
nocache;


create sequence board_seq
start with 1001
increment by 1
maxvalue 99999 
minvalue 1 
nocycle
nocache;

select * from board order by bno desc;

select board_seq.currval from dual;--현재값--
select board_seq.nextval from dual;--다음값--
select member_seq.nextval from dual;

insert into board values(
board_seq.nextval,'제목입니다','내용입니다',sysdate,'aaa',board_seq.currval,0,0,1,'1.jpg');

create sequence dept_seq1
start with 1
increment by 1
minvalue 1 
maxvalue 99999 
nocycle
nocache;

commit;

select dept_seq1.nextval from dual;

--테이블형태로 출력--
desc stuscore;

select * from stuscore;
--delete stuscore;

commit;

select * from stuscore;

commit;

select * from stuscore order by total desc ;
select name,total,rank() over (order by total desc) from stuscore order by stunum asc;

---delete stuscore;

commit;

select * from stuscore;

commit;

select * from stuscore order by total desc;

select stunum,rank,rank() over (order by total desc) as m_rank from stuscore order by stunum asc;

--total기준으로 역순정렬해서 등수를 출력--
select rank() over (order by total desc) from stuscore where stunum=83;
 
 update stuscore set rank=1 where stunum=1;
 
 
 --테이블 합치기--
 select * from stuscore a, member b;
 select employee_id,emp_name,employees.department_id,department_name,parent_id 
 from employees,departments
 where employees.department_id=departments.department_id;
 
 
select department_id from employees;
select employees.department_id,department_name,parent_id from employees,departments 
where employees.department_id=departments.department_id;



select * from emp2;

update emp2 set manager_id='';

commit;


select * from emp2;
--1 emp2 와 employees 사원번호를 똑같이함
--2 emp2 와 employees 관리자번호를 검색함
--3 employees 관리자번호를 emp2의 관리자번호에 입력시킴

update(select a.manager_id as a_m, b.manager_id as b_m 
from emp2 a,employees b --테이블을 두개사용--
where a.employee_id = b.employee_id)
set a_m = b_m;


select a.manager_id as a_m, b.manager_id as b_m 
from emp2 a,employees b
where a.employee_id = b.employee_id;

update(select a.manager_id a_m,b.manager_id b_m
from emp2 a,employees b
where emp.manager_id=employees.manager_id)
set a_m=b_m;

commit;


select total,rank from stuscore order by total desc;



select rank from stuscore;
update stuscore set rank = 1; --1개의 컬럼만 들어와서 저장
update stuscore a
set rank = (select b_rank from (select  stunum as b_num, rank() over (order by total desc) as b_rank from stuscore)  b
where a.stunum = b.b_num);

create sequence emp_seq
start with 1
increment by 1
minvalue 1 
maxvalue 99999 
nocycle
nocache;

commit;


create table emp01(
empno number(4) primary key,
ename varchar(10),
hiredate date);

insert into emp01 values( emp_seq.nextval,'홍길동', sysdate);
insert into emp01 values( emp_seq.nextval,'유관순', sysdate);
insert into emp01 values( emp_seq.nextval,'홍길자', sysdate);
insert into emp01 values( emp_seq.nextval,'이순신', sysdate);

commit;

select emp_seq.currval from dual;

select * from emp01;

select employee_id,emp_name,job_id,hire_date from employees order by hire_date desc;













































