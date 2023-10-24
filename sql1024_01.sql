select * from employees;

update stuscore set kor=100,eng=100,math=100,total=100+100+100,avg=(100+100+100)/3 where stunum=3;
select * from stuscore;
rollback;
select * from stuscore;


--delete stuscore where stunum=2;  삭제--

select * from tab; --현재 테이블 모두 볼 수 있음--

desc stuscore; --현재 테이블의 열과 열의 타입을 보여줌--.

 select * from member;
 insert into member values(
 'aaa','1111','홍길동','M','20','1990-01-01','010-1111-1111',sysdate);
 insert into member values(
 'bbb','2222','유관순','F','22','1990-02-20','010-4444-4444',sysdate);

select * from member;

commit;


