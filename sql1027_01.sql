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


-- 사원중에 평균월급 이하로 받는 사원을 출력하시오.
-- select 2개 이상 서브쿼리
select emp_name, salary from employees
where salary <= (select avg(salary) from employees);


select bhit, bhit+100 from fboard;

update fboard
set bhit = 101;

commit;

select bno,bhit from fboard;

select bno,bhit from board;




-- 계획

drop table fboard;

-- 테이블 생성 및 복사
create table fboard as select * from board;

select bhit from fboard;
select bhit from board;

select a.bhit,b.bhit from fboard a,board b
where a.bno=b.bno;


select bno,bhit from board;

-- 수정코드
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
-- 외래키 등록 이름fk_nboard
);

select * from nboard;

select * from member;

-- id : 외래키 - member primary key -> 중복안됨,null 없는데이터 입력하게 되면 에러처리
insert into nboard values (
nboard_seq.nextval,'aaa','제목8','내용8',sysdate
);

commit;

select * from nboard;
select * from member;

delete member
where id = 'ddd';

select * from member;

select * from nboard;

-- 외래키로 등록, primary key 테이블의 데이터가 삭제되면 외래키에 있는 데이터도 모두 삭제처리
alter table nboard
add constraint fk_nboard foreign key(id) references member(id)
on delete cascade
;

-- primary key테이블의 데이터가 삭제되면 외래키에 있는 데이터의 id만 null값으로 변경
alter table nboard
add constraint fk_nboard_id foreign key(id) references member(id)
on delete set null
;

-- 외래키 삭제
alter table nboard
drop constraint fk_nboard;


delete member
where id='aaa'
;

select * from nboard;

-- null값을 제외한 row를 검색한 후 그룹함수를 적용해서 출력
select department_id,count(commission_pct)
from employees
where commission_pct is not null
group by department_id
;

-- 그룹함수에서 그룹함수의 값의 조건을 처리하려면 having 명령어를 사용해야함.
select department_id,count(commission_pct)
from employees
group by department_id
having count(commission_pct) !=0
;



-- 1. 부서별 평균을 출력하시오.
select department_id,avg(salary)
from employees
group by department_id;
-- 2. 전체평균을 출력하시오.
select avg(salary) from employees; --6461

-- 부서별로 평균이 전체평균 이상인 부서만 출력하시오.
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

