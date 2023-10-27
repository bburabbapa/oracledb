update emp02 a
set rank = (
select
case
when salary>=10000 then 'A'
when salary>=8001 then 'B'
when salary>=5001 then 'C'
when salary>=3000 then 'D'
when salary<3000 then 'F'
end rank2
from emp02 b where a.employee_id =  b.employee_id
);

select salary,rank from emp02;

update emp02 a
set rank=(
select
case
when salary>=10000 then 'A'
when salary>=8001 then 'B'
when salary>=5001 then 'C'
when salary>=3000 then 'D'
when salary<3000 then 'F'
end
from emp02 b
where a.employee_id = b.employee_id
);


select
case
when salary>=10000 then 'A'
when salary>=8001 then 'B'
when salary>=5001 then 'C'
when salary>=3000 then 'D'
when salary<3000 then 'F'
end as rank2
from emp02;

select salary,salary+1000 from emp02;


-- ����߿� ��տ��� ���Ϸ� �޴� ����� ����Ͻÿ�.
-- select 2�� �̻� ��������
select emp_name, salary from employees
where salary <= (select avg(salary) from employees);


select bhit, bhit+100 from fboard;

update fboard
set bhit = 101;

commit;

select bno,bhit from fboard;

select bno,bhit from board;




-- ��ȹ

drop table fboard;

-- ���̺� ���� �� ����
create table fboard as select * from board;

select bhit from fboard;
select bhit from board;

select a.bhit,b.bhit from fboard a,board b
where a.bno=b.bno;


select bno,bhit from board;

-- �����ڵ�
update fboard a
set bhit = (
 select bhit from board b where a.bno = b.bno
);

desc member;

create table nboard(
bno number(4) primary key,
id varchar2(20),
btitle varchar2(1000) not null,
bcontent varchar2(4000),
bdate date,
constraint fk_nboard foreign key(id) references member(id)
-- �ܷ�Ű ��� �̸�fk_nboard
);

select * from nboard;

select * from member;

-- id : �ܷ�Ű - member primary key -> �ߺ��ȵ�,null ���µ����� �Է��ϰ� �Ǹ� ����ó��
insert into nboard values (
nboard_seq.nextval,'aaa','����8','����8',sysdate
);

commit;

select * from nboard;
select * from member;

delete member
where id = 'ddd';

select * from member;

select * from nboard;

-- �ܷ�Ű�� ���, primary key ���̺��� �����Ͱ� �����Ǹ� �ܷ�Ű�� �ִ� �����͵� ��� ����ó��
alter table nboard
add constraint fk_nboard foreign key(id) references member(id)
on delete cascade
;

-- primary key���̺��� �����Ͱ� �����Ǹ� �ܷ�Ű�� �ִ� �������� id�� null������ ����
alter table nboard
add constraint fk_nboard_id foreign key(id) references member(id)
on delete set null
;

-- �ܷ�Ű ����
alter table nboard
drop constraint fk_nboard;


delete member
where id='aaa'
;

select * from nboard;

-- null���� ������ row�� �˻��� �� �׷��Լ��� �����ؼ� ���
select department_id,count(commission_pct)
from employees
where commission_pct is not null
group by department_id
;

-- �׷��Լ����� �׷��Լ��� ���� ������ ó���Ϸ��� having ��ɾ ����ؾ���.
select department_id,count(commission_pct)
from employees
group by department_id
having count(commission_pct) !=0
;



-- 1. �μ��� ����� ����Ͻÿ�.
select department_id,avg(salary)
from employees
group by department_id;
-- 2. ��ü����� ����Ͻÿ�.
select avg(salary) from employees; --6461

-- �μ����� ����� ��ü��� �̻��� �μ��� ����Ͻÿ�.
select a.department_id,b.department_name,avg(salary) as aaa
from employees a, departments b
where a.department_id = b.department_id
group by a.department_id,b.department_name
having avg(salary)>(select avg(salary) from employees )
;






select department_id, avg(salary)
from employees
group by department_id
having avg(salary)> (select avg(salary) from employees)
;

