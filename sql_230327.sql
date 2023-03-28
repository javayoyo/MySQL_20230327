-- 주석입니다./대쉬 쓰고 띄어쓰기 안하면 주석 적용 안됨
-- 주석안돼요
-- 계정 생성 / 대소문자 구분 없음 / sql은 소문자사용, 오라클은 대문자로 사용
-- 사용자이름 : user1, 비밀번호 : 1234 / 사용자는 유일해야함, 중복 불가
create user user1@localhost identified by '1234';
-- ctrl + enter 실행 > 실행시 녹색은 정상, 빨강은 오류
-- database 생성 / 한줄씩 실행되므로, 쓰고 실행필요
create database database1;
-- 권한부여
grant all privileges on datatbase1.* to user1@localhost;
-- 현재 생성된 계정 목록 확인
use mysql;
select user from user;

drop user user1@localhost; -- 계정 삭제

-- 계정 : user2, 비번 : 9999 로 계정 만들고
-- database 999 에 대한 접속 권한 부여하고
-- 해당계정으로 접속해서 database999 사용되는지 확인
create user user2@localhost identified by '9999';
create database database999;
grant all privileges on database999.* to user2@localhost;
use mysql;
select user from user;

create user user_dbclass@localhost identified by '1234';
create database db_dbclass;

grant all privileges on db_dbclass.* to user_dbclass@localhost;




