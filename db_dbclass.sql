use db_dbclass;
-- 학생 테이블 생성
create table student(
	id bigint,
    student_name varchar(5),
    student_mobile varchar(20),
    student_major varchar(30)
    );    
-- 학생테이블 전체 데이터 조회
select * from student;
-- 본인 옆사람들의 정보를 테이블에 저장해 봅시다.  // insert 정보입력및 select 실행
insert into student(id,student_name, student_mobile, student_major)
values (1, '치즈러버', '010-1111-1111' , '컴퓨터공학');
insert into student(id,student_name, student_mobile, student_major)
values (2, '뚱이언니', '010-2222-2222' , '컴퓨터공학');

-- 테이블 삭제
drop table student;

-- ----------create~insert 범위지정 후, 번개 아이콘실행, select 각 줄씩 실행
create table dept (     -- 부서의 정보를 담은 데이터
    deptno int,
    dname varchar(14),
    loc varchar(13)
);
create table emp (     -- 직원 정보
    empno int,
    ename varchar(10),
    job varchar(9),
    mgr int,
    hiredate DATE,     -- 입사일
    sal int,          -- 급여
    comm int,
    deptno int
);
create table bonus (
    ename varchar(10),
    job varchar(9),
    sal int,
    comm int
);
create table salgrade (     -- 급여
    grade int,
    losal int,
    hisal int
);
insert into dept values	(10,'ACCOUNTING','NEW YORK');
insert into dept values (20,'RESEARCH','DALLAS');
insert into dept values (30,'SALES','CHICAGO');
insert into dept values	(40,'OPERATIONS','BOSTON');    

insert into emp values (7369,'SMITH','CLERK',7902, str_to_date('17-12-1980','%d-%m-%Y'),800,NULL,20);
insert into emp values (7499,'ALLEN','SALESMAN',7698,str_to_date('20-2-1981','%d-%m-%Y'),1600,300,30);
insert into emp values (7521,'WARD','SALESMAN',7698,str_to_date('22-2-1981','%d-%m-%Y'),1250,500,30);
insert into emp values (7566,'JONES','MANAGER',7839,str_to_date('2-4-1981','%d-%m-%Y'),2975,NULL,20);
insert into emp values (7654,'MARTIN','SALESMAN',7698,str_to_date('28-9-1981','%d-%m-%Y'),1250,1400,30);
insert into emp values (7698,'BLAKE','MANAGER',7839,str_to_date('1-5-1981','%d-%m-%Y'),2850,NULL,30);
insert into emp values (7782,'CLARK','MANAGER',7839,str_to_date('9-6-1981','%d-%m-%Y'),2450,NULL,10);
insert into emp values (7788,'SCOTT','ANALYST',7566,str_to_date('13-7-87','%d-%m-%Y'),3000,NULL,20);
insert into emp values (7839,'KING','PRESIDENT',NULL,str_to_date('17-11-1981','%d-%m-%Y'),5000,NULL,10);
insert into emp values (7844,'TURNER','SALESMAN',7698,str_to_date('8-9-1981','%d-%m-%Y'),1500,0,30);
insert into emp values (7876,'ADAMS','CLERK',7788,str_to_date('13-7-87','%d-%m-%Y'),1100,NULL,20);
insert into emp values (7900,'JAMES','CLERK',7698,str_to_date('3-12-1981','%d-%m-%Y'),950,NULL,30);
insert into emp values (7902,'FORD','ANALYST',7566,str_to_date('3-12-1981','%d-%m-%Y'),3000,NULL,20);
insert into emp values (7934,'MILLER','CLERK',7782,str_to_date('23-1-1982','%d-%m-%Y'),1300,NULL,10);
		 
insert into salgrade values (1,700,1200);
insert into salgrade values (2,1201,1400);
insert into salgrade values (3,1401,2000);
insert into salgrade values (4,2001,3000);
insert into salgrade values (5,3001,9999);

select * from emp; 
select * from bonus; -- 조회결과 없음
select * from salgrade;
select * from dept;

-- emp 테이블 전체 조회
select * from emp;
-- emp 테이블의 empno, ename 컬럼만 조회
select empno,ename from emp;
-- emp 테이블의 job 컬럼만 조회
select job from emp;
-- 중복값 제외    // 해당 출력값 하나만 출력
select distinct job from emp;

-- 사원 이름 조회(오름차순) a,b,c,d 순   --  asc 어센딩 줄임말
select ename from emp order by ename asc;
select * from emp order by ename asc; -- * 전체 조회 , 줄단위로 오름차순 정렬

-- 사원 이름 조회(내림차순) -- desc
select ename from emp order by ename desc;
select * from emp order by ename desc;

-- 급여(sal) 기준으로 오름차순, 내림차순 정렬 / asc 생략가능, 오름차순기본 정렬임
select * from emp order by sal asc;
select * from emp order by sal desc;
-- 입사일(hiredate) 기준으로 오름차순, 내림차순 정렬
select * from emp order by hiredate asc;
select * from emp order by hiredate desc;

-- 정렬 1차기준 : 급여, 급여가 같다면 이름순으로 오름차순정렬 / order by 에 해당기준 입력
select * from emp order by sal asc, ename asc;

-- where 절 : 조건을 적용할 때 // 반드시 정확하게 값이 일치하는 경우에만 조회 가능
-- 직급이 salesman 인 사원만 조회
select * from emp where job='salesman';
-- 직급이 manager 인 사원만 조회
select * from emp where job='manager';
-- 부서번호(deptno) 가 10인 사원만 조회
select * from emp where deptno=10;  -- 숫자는 '' 내 입력 생략가능
-- 이름이 james 라는 사원의 정보 조회
select * from emp where ename='james';
-- 사번이 7654인 사원의 정보 조회
select * from emp where empno=7654;

-- &(엠퍼샌드), *(아스테리스크) , '(싱글쿼터), "(더블쿼터), `(백틱)

-- 직급이 manager 이고 부서번호가 20인 사원 조회 / and 의경우
select * from emp where job='manager' and deptno = 20;
-- 직급이 salesman 이거나 부서번호가 10인 사원 조회 / or 의 경우
select * from emp where job='salesman' or deptno = 10;
-- 급여가 3000 이상인 사원 조회
select * from emp where sal >= 3000;
-- 급여가 3000 이상인 사원 조회 결과를 내림차순 정렬
select * from emp where sal >= 3000 order by sal desc;
-- 직급이 salesman 이 아닌 사원 조회
select * from emp where job != 'salesman';
select * from emp where not job = 'salesman';

-- 급여가 2000 이상 3000 이하인 사원 조회
-- select * from emp where 2000 <= sal <= 3000; // 불가능
select * from emp where sal >=2000 and sal <= 3000;
select * from emp where sal between 2000 and 3000; -- 2000 이상 ~ 3000 이하 조회
select * from emp where sal not between 2000 and 3000; -- 2000 미만, 3000 초과 조회

-- like 연산자   -- % 글자수제한없음 _ 글자 갯수 지정
select * from emp where ename like 'm%'; -- m으로 시작하는 경우
select * from emp where ename like '%m'; -- m으로 끝나는 경우
select * from emp where ename like '%m%'; -- 값에 m이 포함되어 있는 경우
select * from emp where ename like '_m%'; -- _m이 위치하는 경우/m이 두번째 위치 (언더바 1개)
select * from emp where ename like '__m%'; -- __m이 위치하는 경우/m이 세번째 위치 (언더바 2개)
select * from emp where ename like '이__'; -- 이__ 이로 시작하는 세글자 이름 조회가능
select * from emp where ename like '이%'; -- 이 로 시작하는 글자수제한없는 이름 조회가능

-- 81년 4월 1일 이후 입사한 사원 조회 (해당일 초과)
select * from emp where hiredate > '1981-04-01';
-- 81년 4월 1일 이전 입사한 사원 조회 (해당일 미만)
select * from emp where hiredate < '1981-04-01';

select * from emp where hiredate > str_to_date('1981-04-01', '%Y-%m-%d');

-- 테이블 구조 확인 // Null 값의 YES 인 경우 > null 가능이라는 뜻(필수입력이 아닌 경우)
-- default 기본값
desc emp;     -- 여기서의 desc 는 묘사하다 의 뜻> 데식 // cf) 내림차순 아님

-- 집계함수
-- sum(), avg(), max(), min(), count()

-- 사원의 급여 총합
select sum(sal) from emp;
select sum(sal) as '급여총합' from emp; -- as 표이름 지정
-- salesman 급여 총합
select sum(sal) as '급여총합' from emp where job = 'salesman';
-- manager 급여 총합
select sum(sal) as '급여총합' from emp where job = 'manager';
-- 전체 사원의 평균 급여 조회
select avg(sal) from emp;
-- 구글링으로 평균급여를 소수 둘째자리까지 표현해봅시다
select round(avg(sal),2) from emp;

select sysdate() from dual;  -- select를 보고 싶을 때 사용하는 가상의 테이블 > from dual
-- round() // 반올림
select round(12.345, 2) from dual; -- 12.35
select round(12.345, 1) from dual; -- 12.3
select round(12.345, 0) from dual; -- 12

-- 가장 높은 급여 값 조회
select max(sal) from emp;
-- 가장 적은 급여 값 조회
select min(sal) from emp;
-- 전체 사원수 조회
select count(*) from emp;
-- 부서번호가 20인 사원수 조회
select count(*) from emp where deptno = 20;

-- 그룹화 (동일한 데이터끼리 묶는 것, grouping)
-- 조회결과에는 그룹핑한 컬럼이름 또는 집계함수 등을 사용함
-- 직급으로 그룹핑 / select 상에서 * 전체조회하면 에러 발생으로 해당 그룹핑으로 진행
-- select * from emp group by job; -- * 전체조회 그룹핑 사용불가능
select job from emp group by job;
-- 직급별 평균 급여
select job, avg(sal) from emp group by job;
-- 부서별 평균 급여
select deptno, avg(sal) from emp group by deptno;
-- ----------------------------------------------
-- 직급별 사원수 조회
select job, count(*) from emp group by job;

-- 직급별 평균 급여, 사원수 조회
select job, avg(sal), count(*) from emp group by job;

-- 위의 결과에서 직급값을 오름차순으로 정렬
select job, avg(sal), count(*) from emp group by job order by job asc;

-- 위의 결과에서 평균 급여를 소수점 첫째자리 까지 조회
select job, round(avg(sal),1), count(*) from emp group by job order by job asc;

-- 위의 결과에서 job은 직급으로, 급여 평균값은 평균급여로, 사원수 조회값은 사원수로 표현하여 조회
select job as '직급',count(*) as '사원수', round(avg(sal), 1) as '평균급여'
from emp group by job order by job asc;
