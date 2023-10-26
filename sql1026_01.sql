select sysdate from dual;

select * from board order by bno desc;

insert into board values (
board_seq.nextval,'이벤트 진행','내용입니다.',sysdate,'ccc',board_seq.currval,0,0,1,''
);
insert into board values (
board_seq.nextval,'게시글을 등록합니다.','게시글 내용입니다.',sysdate,'ccc',board_seq.currval,0,0,1,'2.jpg'
);
insert into board values (
board_seq.nextval,'게시글을 등록합니다.2','게시글 내용입니다.2',sysdate,'ccc',board_seq.currval,0,0,1,'3.jpg'
);

select * from board order by bno desc;

commit;


--날짜--
select sysdate-1 어제,sysdate 오늘,sysdate+1 내일 from dual;

select bdate from board order by bdate desc;
--현재날짜 기준 5일 이전 게시글 출력--
select bno,btitle, bdate from board where bdate<sysdate-5 order by bdate desc ;

select sysdate-5 from dual;

--employees 현재 날짜 기준 입사일에서 현재날짜까지 기간 출력--
select *  from employees;

select employee_id,emp_name,hire_date,trunc(sysdate - hire_date) as "변경일" ,salary,department_id from employees ; 

--다가올 요일출력--
select next_day(sysdate,'목요일') from dual;
select next_day(sysdate,'목') from dual;
select next_day(sysdate,7) from dual;
--입력한 날의 마지막일을 출력--
select last_day(sysdate) from dual;
select last_day('20231101')from dual;
select last_day('20221201')from dual;
-- 날짜추가--
select add_months(sysdate,-2) from dual;
select add_months(sysdate,+12) from dual;
select add_months('20220101',+6) from dual;
--금월에서 입사한 월까지 개월 수--
select round(months_between(sysdate,hire_date)) ||' 개월' from employees;
--1년동안 게시글 작성 횟수를 출력--
select * from board;
select bno,btitle,bdate from board where bdate>add_months(sysdate-6) order by bdate desc;
--날짜 중 년도 달 일만 출력--
select extract( year from bdate) from board;
select extract( month from bdate) from board;
select extract( day from bdate) from board;
--3 5 7월 입력한 게시글 출력--
select * from board where extract(month from bdate) in(3,5,7) order by bdate asc;

--round: 15일 기준으로 1달추가 trunc: 1일 기준으로 변경--
select bno,btitle,bdate from board;
select bdate,round(bdate,'month'),trunc(bdate,'month') from board;
--to_date: 형변환함수--
select round (to_date('2023-02-16'),'month') from dual;

--to_char: 날짜를 문자형으로 변환--
select bdate from board;
select to_char(bdate,'YYYY-MM-DD DAY DY AM HH:MI:SS') from board order by bdate desc;
select to_char(bdate,'YYYY"년"MM"월"DD"일') bdate from board;

--입사일을 2023-11-01 화요일로 변경--
select * from employees;
select to_char(hire_date,'YYYY-MM-DD DAY') as "변경" from employees  order by hire_date desc;

--문자형 변환함수--
--숫자를 문자로 변경--
select to_char(1234567890) from dual;
--달러표시--
select to_char(1234567890,'$00,000,999,999') from dual;
--나라별 화폐단위표시--
select to_char(1234567890,'L00,000,999,999') from dual;
select to_char(1234567890,'00000000') from dual;
--trim 앞뒤 공백제거 함수--
select trim(to_char (123456,'999,999,999')) from dual;

--salary 달러표시 천단위표시 
--salary*1342 원화표시 천단위표시 소수점1자리
select salary,to_char(salary,'$999,999'),salary*1342,to_char(round(salary*1342.42,1),'L999,999,999') from employees;

--12345 총 9자리 표시 빈공백은 0으로 --
select to_char(12345,'000000000') from dual;
--12345 총 9자리 표시 빈공백은 제거--
select trim(to_char(12345,'L999,999,999,999')) from dual;
--board테이블에서 bdate와 비교하여 20231023 숫자와 같은 날 입력한 게시글 출력--
select bdate from board where trunc(bdate) =  to_date('2023-10-23', 'YYYY-MM-DD');
select bdate from board where bdate = '20231023' order by bdate asc;
--2020-01-01 부터 현재까지 기간--
select trunc(sysdate-to_date('20200101','YYYYMMDD')) from dual;
--지난 개월수 출력--
select trunc(months_between(sysdate,to_date('19850218','YYYYMMDD'))) from dual;

--문자를 숫자로 형변환함수--
select to_number('20,000','99,999') from dual;
select to_number('10,000','99,999') from dual;
select to_number('20,000','99,999') - to_number('10,000','99,999') from dual;
select emp_name,to_char(salary,'$999,999') from employees;

--연봉 + 커미션(월급*12+(월급*12-커미션) 연봉으로 출력--
select * from employees;
select  salary*12,salary*12*nvl(commission_pct,0) from employees;
select manager_id from employees where manager_id is null;
--null값을 0으로 표시--
select nvl(manager_id,0) from employees; 
--숫자를 문자로 형변환 후 ceo로 출력--
select nvl(to_char(manager_id),'ceo') from employees;

--그룹함수--

--게시글 조회수 총 합을 출력--
select trim(to_char(sum(bhit),'999,999')) from board;
--평균 출력--
select trim(to_char(avg(bhit),'999,999')) from board;
--월급의 평균: 단일함수와 그룹함수와 함께 출력불가!!!!!--
select round(avg(salary),2) from employees;
--그룹함수는 같이 사용가능 --
select min(salary),max(salary),avg(salary,2),count(*) from employees;
--부서번호가 50인 사원들의 합계와 평균을 출력--
select department_id,sum(salary),avg(salary) from employees where department_id=50 GROUP BY department_id; --그룹바이를 통해 단일함수사용가능--
--날짜별 게시글 개수를 출력--
select bdate,count(*) from board GROUP BY bdate order by bdate asc ;
--년도의 월별 개수--
select to_char(bdate,'YYYYMM') 년월 , count(to_char(bdate,'YYYYMM')) 월별개수 from board GROUP BY to_char(bdate,'YYYYMM'); 
--년도만 출력--
select extract(year from bdate) from board;
--월만 출력--
select extract(month from bdate) from board;
--일만 출력--
select extract(day from bdate) from board;
--월별로 출력--
select extract(month from bdate), count(extract(month from bdate)) from board GROUP BY extract(month from bdate);


select extract(year from bdate),count(extract(year from bdate)) from board group by extract(year from bdate);

select extract( month from bdate), count( extract( month from bdate)) from board group by extract( month from bdate);

select department_id,count (*) from employees group by department_id;
select count (employee_id) from employees; 
select count (manager_id) from employees; --null값 포함--
--조회수가 가장 낮은/높은게시글 출력--
select bno,btitle,min(bhit) from board group by bno,btitle; 
select btitle,bcontent,max(bhit) from board  group by btitle,bcontent; 

select * from board where bhit =(select min(bhit) from board);
select * from board where bhit =(select max(bhit) from board);

-- 문자함수 --
select emp_name from employees;

--si Si 가 포함된 이름 출력--
select emp_name from employees where emp_name like ('%SI%') or  emp_name like ('%Si%') or emp_name like ('%si%') or  emp_name like ('%sI%') ;
select emp_name from employees where emp_name like ('%DA%') or  emp_name like ('%Da%') or emp_name like ('%da%') or  emp_name like ('%dA%') ;
--모두 소문자로 바꿈--
select emp_name from employees where lower(emp_name) like ('%da%');
--모두 대문자로 바꿈--
select emp_name from employees where upper(emp_name) like ('%DA%');
--첫글자 대문자로 나머지 소문자로--
select emp_name from employees where initcap(emp_name) like ('%Da%');

--12345의 10자리를 만들어  나머지를 0으로 채워 출력--
select lpad(12345,10,'0') from dual;
select rpad(12345,10,'#') from dual;
select  to_char(lpad(12345,10,'0')) from dual;
select  to_char(12345,'L0,000,000,000') from dual;

--ltrim rtrim trim 공백제거--
select trim (' abc def c ')from dual;

--replace--
select emp_name,replace(emp_name,'ss','i') from employees;
--공백제거--
select replace(' abc def c ',' ','')from dual;

select job_id from emp2;
--SH_CLERK를 CLERK변경--
select job_id,replace(job_id,'SH_CLERK','CLERK') from emp2;
update emp2 set job_id = 'CLERK' where job_id ='SH_CLERK';

rollback;

--잘라오기 substr(emp_name,3,2)--
select emp_name,substr(emp_name,1,6) from employees;

--이름 5개와 입사년도를 이름(1985)로 출력--
select hire_date from employees;
select substr(emp_name,1,6) ||'('|| extract(year from hire_date) ||')' from employees;
select substr(emp_name,1,6) ||'('|| to_char(hire_date,'YYYY') ||')' from employees;

select substr(emp_name,1,6) ||'('|| extract(month from hire_date) ||')' from employees;

--입사일이 6월이고 이름에 d가 들어가 있는 사원 출력--
select * from employees where extract(month from hire_date) = 6 and emp_name like '%d%';
select * from employees where to_char(hire_date,'MM') = '06' and emp_name like '%d%';



select bhit,bhit+100 as "추가" from board;

update board set bhit=1;

rollback;

select job_id from emp2;
update emp2 a set job_id = (select replace(job_id,'SH_CLERK','CLERK') from emp2 b where a.employee_id = b.employee_id);

select bdate from board;
update board a set bdate = (select bdate+1 from board b where a.bno = b.bno);
rollback;

select bhit from board;
update board a set bhit = (select bhit+100 from board b where a.bno = b.bno);

update board a set bhit = (select bhit+100 from board b where a.bno = b.bno);


select * from stuscore;
update stuscore set rank = 0;

commit;

select * from stuscore;

update stuscore a set rank = (select rank+1 from stuscore b where a.stunum = b.stunum);
commit;

rollback;

select * from stuscore;
select b_num,b_rank  from (select stunum b_num,rank() over (order by  total desc) b_rank from stuscore);

update stuscore a set rank = 
(select b_rank from(select stunum b_num,rank() over (order by total desc) b_rank from stuscore)
where a.stunum = b.b_num);

--length 길이--
select round(avg(length (emp_name))) from employees;
--이름을 평균으로 출력--
select substr(emp_name,1,avg(length (emp_name))) from employees group by emp_name;
--전화번호 5번째 3개 이름 1번째 5번째 출력--
select *from employees;
select substr(phone_number,5,3),substr(emp_name,1,5) from employees;

--instr: 찾으려는 위치값을 출력--
select instr(emp_name,'o') from employees where employee_id=198;
select emp_name,instr(emp_name,' '),instr(emp_name,' ')+1 from employees;
--첫번째 공백부터 이름가져오기--
select substr(emp_name,instr(emp_name,' ')+1) from employees;
select substr(emp_name,instr(emp_name,' ')-1) from employees;
select substr(emp_name,instr(emp_name,' ')) from employees;
--번호 뒷자리 가져오기--
select substr('850218-0000000',instr('850218-0000000','-')+1) from employees;
--번호 앞자리 가져오기--
select substr('850218-0000000',instr('850218-0000000','-')-1) from employees;

select phone_number from employees;
select substr(phone_number,instr(phone_number,'.')+1,instr(phone_number,'.')+1) from employees;
select substr(phone_number,instr(phone_number,'.')-1) from employees;

select instr('123.456.789','.') from dual; --1번째 점에 1번--
select instr('123.456.789','.',2,2) from dual; --2번째 점에 2번--
select instr('123.456.789','.',1,1) from dual; --1번째 점에 1번--
select instr('123.456.789','.',-1,1) from dual; 

select * from member;
select substr(phone,1,instr(phone,'-')-1) from member; 
select substr(phone,instr(phone,'-')+1,4) from member; 
select substr(phone,instr(phone,'-',1,2)+1,4) from member; 
--번호에서 123 출력--
select phone_number from employees where phone_number like '%123%';

--부서별 최대월급 출력--
select department_id,max(salary),min(salary) from employees group by department_id;

--입사일을 년 월 일로 출력--
select to_char(hire_date,'YYYY "년" MM "월" DD"일" DAY' ) from employees order by hire_date asc;

commit;

