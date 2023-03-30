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

-- 20230329 ------------------------------------------------------------------

-- 부서별 그룹핑
select deptno from emp group by deptno;
select deptno, avg(sal) from emp group by deptno;
-- 부서별 그룹핑하고 그 안에서 직급별 그룹핑 (1차그룹핑,2차그룹핑) / 
select deptno, job, avg(sal) from emp group by deptno, job;
select deptno, job, avg(sal) from emp group by job, deptno;
select deptno, job, avg(sal) from emp group by deptno, job order by job asc;
select deptno, job, avg(sal) from emp group by deptno, job order by deptno asc;

-- having : 그룹핑한 결과에서 조건 적용
-- 부서, 직급별로 묶고 그 결과에서 평균급여가 2000 이상인 결과만 조회 (전체기준에서 조회)
select deptno, job, avg(sal) from emp
	group by deptno, job
		having avg(sal) >= 2000
			order by job asc;

-- 급여가 3000 이하인 사원을 대상으로 위의 그룹핑 수행 (그룹핑 수행후,평균급여 2000이상을 조회)
select * from emp order by sal asc;  -- 추가 조건 필요 where 활용
select deptno, job, avg(sal) from emp
	where sal <= 3000
		group by deptno, job
			having avg(sal) >= 2000
				order by job asc;
-- date 타입을 문자로 표현하기 : date_format()
select date_format(hiredate, '%Y') from emp; -- 해당 데이터의 연도 확인 가능
-- --------------------------------------------------------------------
/*
	연습문제
	1. 부서별 평균급여, 최고급여, 최저급여, 사원수 조회(평균급여는 소수점 둘째자리에서 반올림)
    2. 직급별 사원수 조회(단 3명 이상인 결과만 출력)
    3. 연도별 입사한 사원수 조회(조회결과 : 연도(yyyy), 사원수)
    3.1. 위의 결과에서 각 연도별로 부서별 입사한 사원수 조회(조회결과 : 연도(yyyy), 부서번호, 사원수)
*/
-- 1번
select deptno as '부서번호' ,round(avg(sal),1) as '평균급여',max(sal)as '최고급여',min(sal) as '최저급여',
count(*) as '사원수' from emp group by deptno;
-- 2번 -- count 내 * 이어도 상관무
select job, count(empno) from emp group  by job having count(empno) >= 3; 
-- 3번
select date_format(hiredate, '%Y')as '입사년도',count(empno) as '사원수' from emp
group by date_format(hiredate, '%Y');
-- 3.1. 번
select date_format(hiredate, '%Y')as '입사년도',deptno as '부서번호' ,
count(empno) as '사원수' from emp
group by date_format(hiredate, '%Y'), deptno;

-- ==============================================================================
select * from emp;
select * from dept;
-- 외부조인
select * from emp, dept; 
-- 조인 /공통된 컬럼을 기준으로 진행-- 내부조인/ select 의 경우에는 조회만 가능/테이블 추가,삭제등의 기능은 아님
select * from emp, dept where emp.deptno = dept.deptno; 
select * from emp e, dept d where e.deptno = d.deptno; 
select empno,ename,dname,loc from emp e, dept d where e.deptno = d.deptno; 
-- deptno select 하면 에러  / ambiguous (모호한 : 해당값이 2개 이상의 테이블로 있어 정확하게 조회 불가)
-- select empno,ename,deptno,dname,loc from emp e, dept d where e.deptno = d.deptno; /에러
select e.empno,e.ename,e.deptno,d.dname,d.loc from emp e, dept d where e.deptno = d.deptno; 
-- 조인 후 emp 테이블만 조회
select e.* from emp e, dept d where e.deptno = d.deptno;
-- emp, dept 를 조인하여 empno, ename, deptno, dname , loc 조회
-- (단, 급여sal가 2500 이상인 사원만 조회하고, 조회결과는 사원 이름ename 기준으로 오름차순 정렬)
 select e.empno,e.ename,e.deptno,d.dname,d.loc
	from emp e, dept d
		where e.sal >=2500 and e.deptno = d.deptno
			order by e.ename asc; 

-- 일반쿼리 / 최저급여를 받는 사람이 누구인지?
select * from emp order by sal asc;
-- 1. 최저급여 값이 얼마인지 조회
select min(sal) from emp;
-- 2. 최저급여 값을 받는 사람이(최저급여 값과 sal 값이 일치하는) 누구인지 조회
select * from emp where sal = 800;
-- 서브쿼리 적용  // 서브쿼리가 먼저 실행/ 일반쿼리를 하나의 쿼리로 합치는 경우
select * from emp where sal = (select min(sal) from emp);
-- 최고 급여를 받는 사원 정보 조회
select * from emp where sal = (select max(sal) from emp);

-- allen 보다 높은 급여를 받는 사원 조회
-- 1. 앨런 급여 찾기 // 급여 1600
select * from emp order by sal asc;
select * from emp where sal > 1600;

-- 2. 앨런보다 높은 급여 찾기
select sal from emp where ename = 'allen';
select * from emp where sal > (select sal from emp where ename = 'allen');

-- ===========================20230329 오후 ===========================
/*
	연습문제 
    1. clark 보다 늦게 입사한 사원 조회 
    2. 부서번호가 20인 사원 중에서 전체 사원 평균 급여보다 높은 급여를 받는 사원 조회 
    3. 2번 조회 결과에서 부서이름, 부서위치도 함께 조회 
*/
-- 1번 / 1981-06-09 / 1.clark 입사날짜 2. 해당 날짜 이후에 입사한 사원 조회
select * from emp;
select hiredate from emp where ename = 'clark';
select * from emp where hiredate > '1981-06-09';
select * from emp where hiredate > (select hiredate from emp where ename = 'clark');

-- 2번 / 1. 부서번호 20 2. 평균급여 확인 : 2073 =  select avg(sal) from emp
select * from emp where deptno = 20 ;
select avg(sal) from emp ; 
select * from emp where sal > 2073;
select * from emp where  deptno = 20 and sal > (select avg(sal) from emp);
select * from emp where sal > (select avg(sal) from emp) and deptno = 20 ;
-- 3번 / 조인
select * from emp e, dept d
	where e.deptno = d.deptno
    and e.sal > (select avg(sal) from emp)
    and e.deptno = 20;
    
-- -----------------------------------------------------------------------
create table member1 (
	id bigint,
		member_email varchar(20),
		member_password varchar(10)
);

insert into member1(id, member_email, member_password) values(1, 'member1@email.com', '1111');
-- 모든 컬럼에 데이터를 저장한다면 컬럼이름 생략 가능 // 
insert into member1 values(2, 'member2@email.com', '2222');
insert into member1 values(3, 'member3@email.com'); -- 불가능,모든 컬럼에 데이터를 저장해야함 / error 1136
-- 특정 컬럼에만 값을 넣고 싶은 경우
insert into member1(id, member_email) values(4, 'member4@email.com');
-- 테이블 만들 때 지정한 크기보다 큰 값을 저장할 때
insert into member1 values(2,'member2@email.com','222222222222');-- 패스워드10글자까지/불가능 error 1406
insert into member1(id, member_email, member_password) values(5, null , '1111');
insert into member1(id, member_email, member_password) values(null, null , '1111');
select * from member1;

-- id 컬럼에 not null 제약조건 적용
create table member2 (
	id bigint not null,
		member_email varchar(20),
		member_password varchar(10) -- id에만 not null 제약조건 적용한 경우,
);
desc member2;  -- desc 테이블의 구조를 확인할 수 있는 명령 // null > No 인 경우 not null 임
insert into member2(id, member_email, member_password) values(1, 'member1@email.com', '1111');
-- error 1048 > Column "id" not null
insert into member2(id, member_email, member_password) values(null, 'member1@email.com', '1111');
insert into member2(id, member_email, member_password) values(2, null, '1111');


create table member3 (
	id bigint not null unique,
		member_email varchar(20) not null,
		member_password varchar(10) not null
);
desc member3;
insert into member3(id, member_email, member_password) values(1,'member1@email.com','1111');
-- error 1062  / 이미 등록된 데이터 중복인 경우 등록 불가 > unique 로 인해 불가능
insert into member3(id, member_email, member_password) values(1,'member1@email.com','1111');
insert into member3(id, member_email,member_password)values(2,'member1@email.com','1111');-- 등록가능

create table member4 (
	id bigint not null unique,
		member_email varchar(20) not null unique,
		member_password varchar(10) not null
);
insert into member4(id,member_email,member_password)values(1,'member1@email.com','1111');
-- error 1062
insert into member4(id,member_email,member_password)values(2,'member1@email.com','2222'); -- 불가능

create table member5 (
	id bigint not null unique,
		member_email varchar(20) not null unique,
		member_password varchar(10) not null,
        member_created_date datetime
);
insert into member5(id,member_email,member_password, member_created_date)
				values(1,'member1@email.com','1111', sysdate());
select * from member5;
insert into member5(id,member_email,member_password)
				values(2,'member2@email.com','2222');

create table member6 (
	id bigint not null unique,
		member_email varchar(20) not null unique,
		member_password varchar(10) not null,
        member_created_date datetime default now()
);
insert into member6(id, member_email, member_password)
				values(1,'member1@email.com','1111'); -- 값을 지정하지 않아도 '디폴트'로 기본값 자동설정
select * from member6;

create table member7 (
	id bigint primary key,
		member_email varchar(20) not null unique,
		member_password varchar(10) not null,
        member_created_date datetime default now()
);
insert into member7(id, member_email, member_password)
				values(1,'member1@email.com','1111'); 
-- error 1062
 insert into member7(id, member_email, member_password)
				values(1,'member2@email.com','2222');   -- 이미 등록된 같은 값을 저장하면 에러
select * from member7;

create table member8 (
		id bigint,
		member_email varchar(20) not null unique,
		member_password varchar(10) not null,
        member_created_date datetime default now(),
        constraint pk_member8 primary key(id)
);

-- 제약조건 확인
select * from information_schema.table_constraints;

-- 20230330 ----------------------------------------------------------------
-- 참조관계
-- 게시판과 댓글의 관계
-- drop 
drop table if exists board1; -- drop 삭제/if exist 만약 있으면/sql은 확인불가:오류>if문 생성필요
create table board1(
	id bigint, -- 글번호
    board_writer varchar(20) not null, -- 작성자 //unique 상태면 작성자1명은 글 1번밖에 작성불가
    board_contents varchar(500), -- 내용
    constraint pk_board1 primary key(id)
);
-- 댓글 테이블 : 댓글은 존재하는 게시글에만 작성 가능하며,
-- 게시글의 글번호(id) 를 참조하는 관계로 정의
drop table if exists comment1;-- 보드1과 코멘트1 테이블 존재시, 보드 삭제시 부모로 선 삭제 불가
create table comment1 (
	id bigint, -- 댓글 번호
    comment_writer varchar(20) not null , -- 댓글 작성자
    comment_contents varchar(200) , -- 댓글 내용
    board1_id bigint, -- 어떤 게시글에 작성된 댓글인지 글번호 정보가 필요함
    -- 댓글테이블(comment1) 의 pk 지정
	constraint pk_comment1 primary key(id),
    -- 참조관계 지정을 위해 comment1 테이블의 board1_id 컬럼을
    -- board1 테이블의 id 컬럼을 참조하는 관계로 정의
    constraint fk_comment1 foreign key(board1_id) references board1(id)
);

insert into board1(id, board_writer, board_contents)
	values(1, 'writer1', 'contents1');
insert into board1(id, board_writer, board_contents)
	values(2, 'writer2', 'contents2');
insert into board1(id, board_writer, board_contents)
	values(3, 'writer2', 'contents3');
insert into board1(id, board_writer, board_contents)
	values(4, 'writer2', 'contents4');
select * from board1;

-- 댓글 데이터 저장
-- 1번 게시글에 대한 댓글
insert into comment1(id, comment_writer, comment_contents, board1_id)
	values(1, 'c writer1', 'c contents1', 1);
-- 1번 게시글에 대한 2번째 댓글
insert into comment1(id, comment_writer, comment_contents, board1_id)
	values(2, 'c writer2', 'c contents2', 1);
 -- 2번 게시글에 대한 댓글
insert into comment1(id, comment_writer, comment_contents, board1_id)
	values(3, 'c writer3', 'c contents3', 2);
-- 5번 게시글에 대한 댓글
insert into comment1(id, comment_writer, comment_contents, board1_id)
	values(4, 'c writer4', 'c contents4', 5);
    -- 참조대상 > 부모테이블에 있는 값만 사용가능 / 없으면 불가능
select * from comment1;

-- 부모 데이터 삭제   // 삭제할 때는 조건의 pk 컬럼이름을 이용하여 진행 ===============
-- 1,2번 게시글에는 댓글이 있고, 3,4번 게시글에는 댓글이 없음
select * from board1;
-- 3번 게시글 삭제
delete from board1 where id=3;
-- 2번 게시글 삭제 > error 1451 / 2번에는 자식데이터가 있어 2번 부모데이터는 삭제불가능
delete from board1 where id=2;
-- 2번 게시글에 작성된 댓글 삭제 (댓글번호 3) > 이후 2번게시글 삭제 진행 / 삭제완료 가능
delete from comment1 where id=3;
delete from board1 where id=2;

-- 부모 데이터 삭제시 자식 데이터도 함께 삭제 ======================================
drop table if exists board2; 
create table board2(
	id bigint, -- 글번호
    board_writer varchar(20) not null, -- 작성자 
    board_contents varchar(500), -- 내용
    constraint pk_board2 primary key(id)
);
drop table if exists comment2;
create table comment2 (
	id bigint, -- 댓글 번호
    comment_writer varchar(20) not null , -- 댓글 작성자
    comment_contents varchar(200) , -- 댓글 내용
    board2_id bigint, -- 어떤 게시글에 작성된 댓글인지 글번호 정보가 필요함
	constraint pk_comment2 primary key(id),
    constraint fk_comment2 foreign key(board2_id) references board2(id)
    on delete cascade
    -- ㄴ on delete cascade : 부모데이터 삭제 시 자식데이터도 함께 삭제
);
-- 게시글 4개 작성
insert into board2(id, board_writer, board_contents)
	values(1, 'writer1', 'contents1');
insert into board2(id, board_writer, board_contents)
	values(2, 'writer2', 'contents2');
insert into board2(id, board_writer, board_contents)
	values(3, 'writer3', 'contents3');
insert into board2(id, board_writer, board_contents)
	values(4, 'writer4', 'contents4');
select * from board2;
-- 1,2 번 게시글에 댓글 작성
insert into comment2(id, comment_writer, comment_contents, board2_id)
	values(1, 'c writer1', 'c contents1', 1);
insert into comment2(id, comment_writer, comment_contents, board2_id)
	values(2, 'c writer2', 'c contents2', 1);
insert into comment2(id, comment_writer, comment_contents, board2_id)
	values(3, 'c writer3', 'c contents3', 2);
-- 3번 게시글 삭제
delete from board2 where id=3;
-- 2번 게시글 삭제
delete from board2 where id=2; -- 부모데이터 삭제하면 자식데이터 같이 삭제
select * from comment2;


-- on delete set null ----------------------------------------------
drop table if exists board3; 
create table board3(
	id bigint, -- 글번호
    board_writer varchar(20) not null, -- 작성자 
    board_contents varchar(500), -- 내용
    constraint pk_board2 primary key(id)
);
drop table if exists comment3;
create table comment3 (
	id bigint, -- 댓글 번호
    comment_writer varchar(20) not null , -- 댓글 작성자
    comment_contents varchar(200) , -- 댓글 내용
    board3_id bigint, -- 어떤 게시글에 작성된 댓글인지 글번호 정보가 필요함
	constraint pk_comment3 primary key(id),
    constraint fk_comment3 foreign key(board3_id) references board3(id)
    on delete set null
    -- ㄴ on delete set null : 자식 데이터는 유지되지만 참조 컬럼은 null 로 바꿈
);
-- 게시글 4개 작성
insert into board3(id, board_writer, board_contents)
	values(1, 'writer1', 'contents1');
insert into board3(id, board_writer, board_contents)
	values(2, 'writer2', 'contents2');
insert into board3(id, board_writer, board_contents)
	values(3, 'writer3', 'contents3');
insert into board3(id, board_writer, board_contents)
	values(4, 'writer4', 'contents4');
select * from board3;
-- 1,2 번 게시글에 댓글 작성
insert into comment3(id, comment_writer, comment_contents, board3_id)
	values(1, 'c writer1', 'c contents1', 1);
insert into comment3(id, comment_writer, comment_contents, board3_id)
	values(2, 'c writer2', 'c contents2', 1);
insert into comment3(id, comment_writer, comment_contents, board3_id)
	values(3, 'c writer3', 'c contents3', 2);
-- 3번 게시글 삭제
delete from board3 where id=3;
-- 2번 게시글 삭제
delete from board3 where id=2; -- 자식데이터는 남아있고, 부모데이터는 삭제하여 null로 표시
select * from comment3;

-- 수정 쿼리---------==================================================================
-- 1번 게시글 내용을 안녕하세요로 수정
select * from board3;
update board3 set board_contents='안녕하세요' where id=1;
-- 4번 게시글 작성자를 작성자4 , 내용을 곧 점심시간 으로 수정
update board3 set board_writer = '작성자', board_contents= '곧 점심시간' where id =4;

-- id 컬럼에 자동 번호 적용하기 ------------auto_increment : pk 지정 필요, 필수임-------------
drop table if exists board4; 
create table board4(
	id bigint auto_increment, -- 글번호
    board_writer varchar(20) not null, -- 작성자 
    board_contents varchar(500), -- 내용
    constraint pk_board4 primary key(id)
);
insert into board4(board_writer, board_contents) -- id 자동적용>컬럼이름 id 없이 조회
	values('writer1', 'contents1');
insert into board4(board_writer, board_contents)
	values('writer2', 'contents2');
select * from board4;

-- 20230330 오후 ------------=============================
create table book(
	id bigint auto_increment,
    b_bookname varchar(20) not null,
    b_publisher varchar(10) not null,
    b_price varchar(10),
	constraint pk_book primary key(id)
);
insert into book(b_bookname, b_publisher, b_price)
	values('축구의 역사', '굿스포츠', 7000);
insert into book(b_bookname, b_publisher, b_price)
	values('축구스카우팅 리포트', '나무수', 13000);
insert into book(b_bookname, b_publisher, b_price)
	values('축구의 이해', '대한미디어', 22000);
insert into book(b_bookname, b_publisher, b_price)
	values('배구 바이블', '대한미디어', 35000);
insert into book(b_bookname, b_publisher, b_price)
	values('피겨 교본', '굿스포츠', 8000);
    insert into book(b_bookname, b_publisher, b_price)
	values('피칭 단계별기술', '굿스포츠', 6000);
insert into book(b_bookname, b_publisher, b_price)
	values('야구의 추억', '이상미디어', 20000);
    insert into book(b_bookname, b_publisher, b_price)
	values('야구를 부탁해', '이상미디어', 13000);
insert into book(b_bookname, b_publisher, b_price)
	values('올림픽 이야기', '삼성당', 7500);
insert into book(b_bookname, b_publisher, b_price)
	values('olympic champions', 'pearson', 13000);

select * from book;



create table customer(
	id bigint auto_increment,
    c_name varchar(5) not null,
    c_address varchar(15) not null,
    c_phone varchar(20),
	constraint pk_customer primary key(id)
);
insert into customer(c_name, c_address, c_phone)
	values('손흥민', '영국 런던', '000-5000-0001');
insert into customer(c_name, c_address, c_phone)
	values('김연아', '대한민국 서울', '000-6000-0001');
insert into customer(c_name, c_address, c_phone)
	values('김연경', '중국 상하이', '000-7000-0001');
insert into customer(c_name, c_address, c_phone)
	values('류현진', '캐나다 토론토', '000-8000-0001');
insert into customer(c_name, c_address)
	values('이강인', '스페인 마요르카');
select * from customer;

create table orders (
  id bigint auto_increment,
  customer_id  bigint,
  book_id  bigint, 
  o_saleprice int,
  o_orderdate date,
  constraint pk_orders primary key(id),
  constraint fk_orders_c foreign key(customer_id) references customer(id),
  constraint fk_orders_b foreign key(book_id) references book(id)
);
insert into orders(customer_id, book_id, o_saleprice, o_orderdate) values (1, 1, 6000, str_to_date('2021-07-01','%Y-%m-%d')); 
insert into orders(customer_id, book_id, o_saleprice, o_orderdate) values (1, 3, 21000, str_to_date('2021-07-03','%Y-%m-%d')); 
insert into orders(customer_id, book_id, o_saleprice, o_orderdate) values (2, 5, 8000, str_to_date('2021-07-03','%Y-%m-%d')); 
insert into orders(customer_id, book_id, o_saleprice, o_orderdate) values (3, 6, 6000, str_to_date('2021-07-04','%Y-%m-%d')); 
insert into orders(customer_id, book_id, o_saleprice, o_orderdate) values (4, 7, 20000, str_to_date('2021-07-05','%Y-%m-%d')); 
insert into orders(customer_id, book_id, o_saleprice, o_orderdate) values (1, 2, 12000, str_to_date('2021-07-07','%Y-%m-%d')); 
insert into orders(customer_id, book_id, o_saleprice, o_orderdate) values (4, 8, 13000, str_to_date( '2021-07-07','%Y-%m-%d')); 
insert into orders(customer_id, book_id, o_saleprice, o_orderdate) values (3, 10, 12000, str_to_date('2021-07-08','%Y-%m-%d')); 
insert into orders(customer_id, book_id, o_saleprice, o_orderdate) values (2, 10, 7000, str_to_date('2021-07-09','%Y-%m-%d')); 
insert into orders(customer_id, book_id, o_saleprice, o_orderdate) values (3, 8, 13000, str_to_date('2021-07-10','%Y-%m-%d')); 

select * from orders;
-- ======================================================================================
-- 1. 모든 도서의 가격과 도서명 조회 
select b_bookname, b_price from book;
-- 2. 모든 출판사 이름 조회
select b_publisher from book;
-- 2.1 중복값을 제외한 출판사 이름 조회 
select distinct b_publisher from book;
-- 3. BOOK테이블의 모든 내용 조회 
select * from book;
-- 4. 20000원 미만의 도서만 조회 
select * from book where b_price < 20000 ;
-- 5. 10000원 이상 20000원 이하인 도서만 조회
select * from book where b_price between 10000 and 20000; -- 이상, 이하의 경우에만 가능
select * from book where b_price >= 10000 and b_price <= 20000;
-- 6. 출판사가 굿스포츠 또는 대한미디어인 도서 조회 
select * from book where b_publisher = '굿스포츠' or b_publisher = '대한미디어';
select * from book where b_publisher in('굿스포츠', '대한미디어');
-- 7. 도서명에 축구가 포함된 모든 도서를 조회 -- 포함 > like
select * from book where b_bookname like '%축구%';
-- 8. 도서명의 두번째 글자가 '구'인 도서 조회 -- 해당 위치에 맞는 글자 확인 > _ 언더바 활용 
select * from book where b_bookname like '_구%';
-- 9. 축구 관련 도서 중 가격이 20000원 이상인 도서 조회
select * from book where b_bookname like '%축구%' and b_price >= 20000;
-- 10. 책 이름순으로 전체 도서 조회 -- 한,영이 섞여있는 경우 정렬 순서 상 영어가 먼저임 , 오름차순> 영어 맨처음
select * from book order by b_bookname asc;
-- 11. 도서를 가격이 낮은 것 부터 조회하고 같은 가격일 경우 도서명을 가나다 순으로 조회
select * from book order by b_price asc, b_bookname asc;

-- ================================================================================
select * from orders;
-- 12. 주문 도서의 총 판매액 조회 -- orders 테이블 관련
 select sum(o_saleprice) from orders;
-- 13. 1번 고객이 주문한 도서 총 판매액 조회 

-- 14. ORDERS 테이블로 부터 평균판매가, 최고판매가, 최저판매가 조회 

-- 15. 고객별로 주문한 도서의 총 수량과 총 판매액 조회

-- 16. 가격이 8,000원 이상인 도서를 구매한 고객에 대해 고객별 주문 도서의 총 수량 조회 (GROUP BY 활용)
--    (단, 8,000원 이상 도서 두 권 이상 구매한 고객만) 

-- 17. 김연아고객(고객번호 : 2) 총 구매액

-- 18. 김연아 고객이 구매한 도서의 수

-- 19. 서점에 있는 도서의 총 권수

-- 20. 출판사의 총 수 

-- 21. 7월 4일 ~ 7일 사이에 주문한 도서의 주문번호 조회 

-- 22. 7월 4일 ~ 7일 사이에 주문하지 않은 도서의 주문번호 조회









