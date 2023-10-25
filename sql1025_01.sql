select * from employees;

select salary,salary*100,salary-100 from employees;

--dual  �ӽ� ���� ���̺�--
select sysdate,sysdate from dual;

select 1+3 from dual;
--����3�� ��Ģ�����ϸ� ���ڷ� �ڵ� ��ȯ���--
select 1+'3' from dual;

--select 1+'a' from dual; ���ڴ� ��ȯ�Ұ�--

--select 'a'+'b' from dual; ���ڴ� ��ȯ�Ұ�--

select 'a' || 'b' from dual;

select concat('a','b') from dual;



--emp_name(email) �Բ� ����Ͻÿ�--
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
--�ٸ����̺����--
select * from employees where salary=(select max(salary) from employees);

select * from employees where commission_pct is not null;
select * from employees where commission_pct is null;
select * from employees where department_id>=80 order by department_id asc;
--�μ���ȣ�� 80���� ����--
select * from employees where not department_id = 80;
select * from employees where  department_id != 80;

--�μ���ȣ�� 50���̸鼭 ������ 6000�̻�--
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
--��պ��� ���� ����--
select * from employees where salary<=6462 order by salary desc;
select * from employees where salary<=(select round(avg(salary)) from employees) order by salary desc;


--�����ȣ�� 101 151 200�� �����ȣ�� ������ ����Ͻÿ�--
select employee_id as"�����ȣ",salary as "����" from employees where employee_id =101 or employee_id=151 or employee_id=200;
select employee_id as"�����ȣ",salary as "����" from employees where employee_id in(101,151,200);

--2000�̸� 3000�̻�--
select emp_name,salary from employees where salary>=2000 and salary<=3000;--�Ѵ�--
select * from employees where salary<2000 or salary>3000;--�����ϳ�--
select * from employees where salary not between 2000 and 3000;--�������ʴ°�--


--�Ի��� 00/00/01 ~ 00/12/31 ���--
select * from employees where hire_date>='2000-01-01' and hire_date<='2000-12-31'  order by hire_date asc;
select * from employees where hire_date between '00/01/01' and '00/12/31';

--�̸��� S�� ���۵Ǵ� �̸� ���--
select emp_name from employees where emp_name like 'S%';--����--
select emp_name from employees where emp_name like '%n';--��--
select emp_name from employees where emp_name like '%e%';--�߰�--

select * from board;
select * from board where bcontent like '%faucibus%';
select btitle as "��ȭ����", bcontent as"��ȭ����" from board where bcontent like '%ven%' or btitle like '%ven%';
--n���� �����ϸ鼭 4���� ���--
select bcontent from board where bcontent like '%n___';

select * from employees;
select emp_name from employees where emp_name like 'P__ %'; --��ĭ����ٰ�!!--
select emp_name from employees where emp_name like 'D____ %';
select emp_name from employees where emp_name like '%a%';

select * from employees where emp_name like '_a%';

--������ ���� �� ����--
select * from employees order by salary asc;
select * from employees order by salary desc;
--�Ի��� ����� ��������--
select employee_id,emp_name,job_id,hire_date from employees order by hire_date desc;
select employee_id,emp_name,job_id,hire_date from employees order by emp_name desc;
--�μ���ȣ �������� �̸���������--
select employee_id,emp_name,department_id,job_id,hire_date from employees order by department_id asc, emp_name desc;
--���� �������� �Ի��� ��������--
select employee_id,emp_name,department_id,job_id,hire_date,salary from employees order by salary asc, hire_date desc;

--abs: ����--
select -10,abs(-10) from dual;

--floor: ��������-- 
select 10.54578,floor(10.54578) from dual;

--trunc: �߶����--
select 10.54578,trunc(10.54578,2) from dual;--��°�ڸ������߶����--

--round: �ݿø�--
select 10.54578, round(10.54578),round(10.54578,3) from dual;--��°�ڸ����� �ݿø�--

--mod: �������Լ�--

select mod(27,2), mod(27,5),mod(27,7) from dual;

--����� Ȧ���� ��� ���--
select * from employees where mod(employee_id,2)=1 order by employee_id asc;
--����� ¦���� ��� ���--
select * from employees where mod (employee_id,2)=0 order by employee_id asc;


--�����ڰ� ¦���� ������--
select employee_id,emp_name,hire_date,salary,manager_id,job_id from employees where mod(manager_id,2)=0 order by employee_id asc;


select * from stuscore;
select stunum,name,math,eng,kor+eng,round(kor+math)/2 from stuscore;

--������ ��ȭ�� ȯ�� �Ҽ����Ѥ��ڸ� �ݿø�--
select * from employees;
select employee_id,emp_name,salary*1345.32, round(salary*12*1342.32,2) as "��ȭ" from employees order by employee_id asc;


--�Ի����� ���� ��¥���� �ɸ� ���ڸ� ���--
select round(sysdate - hire_date,3) from employees; 

--�Ի��Ͽ��� ���糯¥���� �ɸ� ���� ��� �Ҽ����� �ݿø� ���� ������ ȯ��--
select emp_name as "�����",floor(round(sysdate - hire_date,2)/365) as sdate from employees order by sdate asc ; 


select * from board;
select bhit from board;
select round(avg(bhit)) from board;
--�����ȸ�� �ݿø��� �Ҽ��� ����--
select floor(round(avg(bhit))) from board;
--��պ��� ���� ��ȸ�� ���--
select * from board where bhit>=(select avg(bhit) from board);
select * from board where bhit>=492;
--���� ��ǥ�������� �߰�--
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

select board_seq.currval from dual;--���簪--
select board_seq.nextval from dual;--������--
select member_seq.nextval from dual;

insert into board values(
board_seq.nextval,'�����Դϴ�','�����Դϴ�',sysdate,'aaa',board_seq.currval,0,0,1,'1.jpg');

create sequence dept_seq1
start with 1
increment by 1
minvalue 1 
maxvalue 99999 
nocycle
nocache;

commit;

select dept_seq1.nextval from dual;

--���̺����·� ���--
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

--total�������� ���������ؼ� ����� ���--
select rank() over (order by total desc) from stuscore where stunum=83;
 
 update stuscore set rank=1 where stunum=1;
 
 
 --���̺� ��ġ��--
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
--1 emp2 �� employees �����ȣ�� �Ȱ�����
--2 emp2 �� employees �����ڹ�ȣ�� �˻���
--3 employees �����ڹ�ȣ�� emp2�� �����ڹ�ȣ�� �Է½�Ŵ

update(select a.manager_id as a_m, b.manager_id as b_m 
from emp2 a,employees b --���̺��� �ΰ����--
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
update stuscore set rank = 1; --1���� �÷��� ���ͼ� ����
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

insert into emp01 values( emp_seq.nextval,'ȫ�浿', sysdate);
insert into emp01 values( emp_seq.nextval,'������', sysdate);
insert into emp01 values( emp_seq.nextval,'ȫ����', sysdate);
insert into emp01 values( emp_seq.nextval,'�̼���', sysdate);

commit;

select emp_seq.currval from dual;

select * from emp01;

select employee_id,emp_name,job_id,hire_date from employees order by hire_date desc;













































