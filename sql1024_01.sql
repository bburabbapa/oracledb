select * from employees;

update stuscore set kor=100,eng=100,math=100,total=100+100+100,avg=(100+100+100)/3 where stunum=3;
select * from stuscore;
rollback;
select * from stuscore;


--delete stuscore where stunum=2;  ����--

select * from tab; --���� ���̺� ��� �� �� ����--

desc stuscore; --���� ���̺��� ���� ���� Ÿ���� ������--.

 select * from member;
 insert into member values(
 'aaa','1111','ȫ�浿','M','20','1990-01-01','010-1111-1111',sysdate);
 insert into member values(
 'bbb','2222','������','F','22','1990-02-20','010-4444-4444',sysdate);

select * from member;

commit;


