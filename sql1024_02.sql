select * from departments;

--���̺��� ���� ������������ ����--
select * from departments order by manager_id asc;
--���̺��� ���� ������������ ����--
select * from departments order by manager_id desc; 

select * from employees where employee_id>=200;

select * from employees where employee_id>=190 and employee_id<=205;

--5õ�̻� ������ ������������ ����--
select * from employees where salary>=5000 order by salary asc; 

--employees�� �Ӽ���������--
select employee_id,emp_name,job_id,department_id,salary from employees;

--���̺��� �����͸� �����ϱ�
create table emp2 as select * from employees;

select * from emp2;

--�÷�Ÿ��--
desc emp2;

--�÷��̸�����--
alter table emp2 rename column emp_name to e_name;

--�÷�������Ÿ���� ���̺���(email�� �����Ͱ� ���ڰ� �ƴϸ� ������ �Ұ�)--
alter table emp2 modify email varchar2(10);

--�÷�����--
alter table emp2 drop column create_date;

--�÷��߰�--
alter table emp2 add create_date date;

--�÷���������--
alter table emp2 modify update_date invisible;
alter table emp2 modify update_date visible;
select * from emp2;


--�÷������͸� ����--
insert into emp2 select * from employees;

select * from emp2;

--�̸������Ի����� ������������ ����--
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

--��Ī���� as������ ������--
select salary,salary*12 y_salary,salary*12*1342 as k_salary from employees; 
select * from employees;

--����--
select salary,salary*12,commission_pct from employees;
select salary,
salary*12 as"����",
(salary*12)*nvl(commission_pct,0) as "�μ�Ƽ��",
(salary*12)+(salary*12)*nvl(commission_pct,0) as "��������" from employees;

select nvl(manager_id,0) from employees;


--��� ���� ���� ����+Ŀ�̼��� ����ϰ� �̸��� �ٲٽÿ�--
select employee_id,salary,job_id,salary*12 as y_salary,(salary*12)*nvl(commission_pct,0) as c_salary from employees;

select * from employees where salary=6000;

--Ŀ�̼��� ���� ����� ���--
select * from employees where commission_pct is null;
select * from employees where commission_pct is not null;
select commission_pct from employees;

select * from departments;

select  department_id as "�μ���ȣ",department_name as "�μ���" from departments
 where department_id>=10 and  department_id<=40;
 
 
 
 select emp_name || +'is a' || job_id as name from employees;
 select concat(concat(emp_name,'is a'), job_id) as con_name from employees;
 
 
 
 select * from stuscore;
 select kor,eng,math,kor+eng+math,(kor+eng+math)/3 from stuscore;
 
 
 --�ߺ����� �� ��������--
 select  DISTINCT department_id from employees order by department_id asc;
 --�ߺ����� �� ��������--
 select  DISTINCT job_id from employees order by job_id desc;
 

 select * from employees where salary=3000 or salary=5000 or  salary=6000;
select * from employees where salary>=3000 or salary<=10000 order by salary desc;
  
 select * from employees where salary<=5000; 
 --5000�̻��� ����̸� ���� �λ�ȿ�ȭ�� ����Ͻÿ�--
select emp_name,salary*12 as"����",(salary*12*1342)+1000 as "��ȭ" from employees where salary<=5000; 

 
 
 --�μ���ȣ�� 10 20 30 �� ����Ͻÿ�--
select * from departments;
 
 select  department_id as "�μ���ȣ",department_name as "�μ���",manager_id as "�������̸�",create_date as "�Է���" from departments
 where department_id=10 or department_id=20 or department_id=30;
 


-- 4000�̻� 8000���� �����ȣ ����̸� �޿� �Ի��� �μ���ȣ ����Ͻÿ�--
 select * from employees; 
 select  employee_id as"�����ȣ",emp_name as"����̸�",salary as "�޿�",hire_date as "�Ի���",hire_date+100 as "�߰��ȳ�" ,job_id as "�μ���ȣ" from employees 
 where salary>=4000 and salary<=8000 and hire_date>'03/09/01' order by emp_name asc;

commit;


 
 
 
 









