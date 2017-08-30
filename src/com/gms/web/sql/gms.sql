-- ************************
-- 2017.08.02
-- [1]MAJOR_TAB
-- [2]SUBJECT_TAB
-- [3]MEMBER_TAB
-- [4]PROF_TAB
-- [5]STUDENT_TAB
-- [6]GRADE_TAB
-- [7]BOARD_TAB
-- ************************
DROP SEQUENCE article_seq;
CREATE SEQUENCE seq
 START WITH     2000
 INCREMENT BY   1
 NOCACHE
 NOCYCLE;
-- ************************
-- [1]MAJOR_TAB
-- 2017.08.02
-- article_seq,id,title,
-- content,hitcount,regdate
-- ************************
-- DDL
select * from major;
alter table major add subj_id varchar2(10);
CREATE TABLE MAJOR(
	major_id VARCHAR2(10),
	title VARCHAR2(10),
	
	PRIMARY KEY(major_id)
);
-- DML
INSERT INTO Major(major_id,title)
VALUES('','');
-- ************************
-- [2]SUBJECT_TAB
-- 2017.08.02
-- subj_id,title,major_id
-- ************************
-- DDL
CREATE TABLE Subject(
	subj_id VARCHAR2(10),
	title VARCHAR2(10),
	major_id VARCHAR2(10),
	PRIMARY KEY(subj_id),
	FOREIGN KEY(major_id) REFERENCES Major(major_id)
		ON DELETE CASCADE
);
-- DML
INSERT INTO Subject(subj_id,title,major_id)
VALUES('','','');
-- ********************
-- [3]MEMBER_TAB
-- 2017.08.02
-- member_id,name,password,
-- ssn,regdate,major_id,
-- phone,email,profile
-- *******************
-- DDL
CREATE TABLE Member(
	member_id VARCHAR2(10),
	name VARCHAR2(10),
	password VARCHAR2(10),
	ssn VARCHAR2(15),
	regdate DATE,
	major_id VARCHAR2(10),
	phone VARCHAR2(20),
	email VARCHAR2(20),
	profile VARCHAR2(20),
	PRIMARY KEY(member_id),
	FOREIGN KEY(major_id) REFERENCES Major(major_id)
		ON DELETE CASCADE
);
DROP TABLE Member;
-- DML
INSERT INTO Member(member_id,name,password,ssn,regdate,major_id,phone,email,profile)
VALUES('mankiew','맨큐','1','701201-123456',SYSDATE,'economics','010-1234-5678','mankiew@test.com','mankiew.jpg');
select * from member;
SELECT 
member_id,name,password,ssn,major_id,
phone,email,profile,regdate 
FROM Member;

SELECT COUNT(*) AS count FROM Member;
UPDATE Member SET password='2' WHERE member_id='hong';
DELETE FROM Member WHERE member_id='choi';
-- ************************
-- [4]PROF_TAB
-- 2017.08.02
-- member_id,salary
-- ************************
-- DDL
CREATE TABLE Prof(
	member_id VARCHAR2(10),
	salary VARCHAR2(10),
	PRIMARY KEY(member_id),
	FOREIGN KEY(member_id) REFERENCES Member(member_id)
		ON DELETE CASCADE
);
-- DML
INSERT INTO Prof(member_id,salary)
VALUES('gogh','5000');
-- ************************
-- [5]STUDENT_TAB
-- 2017.08.02
-- member_id,stu_no
-- ************************
-- DDL
CREATE TABLE Student(
	member_id VARCHAR2(10),
	stu_no VARCHAR2(8),
	PRIMARY KEY(member_id),
	FOREIGN KEY(member_id) REFERENCES Member(member_id)
		ON DELETE CASCADE
);
DROP TABLE Student;
-- DML


-- ************************
-- [6]GRADE_TAB
-- 2017.08.02
-- grade_seq,score,exam_date,
-- subj_id,member_id
-- ************************
-- DDL
CREATE TABLE Grade(
	grade_seq NUMBER,
	score VARCHAR2(3),
	exam_date VARCHAR2(12),
	subj_id VARCHAR2(10),
	member_id VARCHAR2(10),
	PRIMARY KEY(grade_seq),
	FOREIGN KEY(member_id) REFERENCES Member(member_id)
		ON DELETE CASCADE,
	FOREIGN KEY(subj_id) REFERENCES Subject(subj_id)
		ON DELETE CASCADE
);
ALTER TABLE Grade
RENAME COLUMN id TO member_id;
DROP TABLE Grade;
-- DML
SELECT * FROM Grade;
INSERT INTO Grade(grade_seq,score,exam_date,subj_id,member_id)
VALUES(seq.nextval,'90','2017-03','java','hong');
-- member_id 를 입력하면 평균점수를 반환하는 sql
select * from member;
select avg(score)
from (select distinct
	m.member_id id ,m.name name ,mj.title major,
	g.SCORE score,sj.title subject,g.exam_date
from member m,student s,grade g,subject sj,major mj
where 
    m.member_id=s.member_id 
    and m.member_id=g.member_id
    and sj.MAJOR_ID=mj.MAJOR_ID
    and sj.subj_id=g.subj_id) t
where t.id='hong';

select avg(score)
from (select 
		m.member_id id ,m.name name ,
		g.score score,g.exam_date exam_date
	 from Grade g 
		inner join Subject s on g.subj_id=s.subj_id
		inner join Member m on m.member_id=g.member_id
) t
where t.id='hong';

-- ************************
-- [7]BOARD_TAB
-- 2017.08.02
-- article_seq,id,title,
-- content,hitcount,regdate
-- ************************
-- DDL
CREATE TABLE Board(
	article_seq NUMBER,
	id VARCHAR2(10),
	title VARCHAR2(20),
	content VARCHAR2(100),
	hitcount NUMBER,
	regdate DATE,
	PRIMARY KEY(article_seq),
	FOREIGN KEY(id) REFERENCES Member(id)
		ON DELETE CASCADE
);
DROP TABLE Board;
-- DML
INSERT INTO Board(article_seq,id,title,content,hitcount,regdate)
VALUES(seq.nextval,'kim','대중을 있는',
	'주는 얼마나 크고 품에 대중을 있는',0,SYSDATE);
SELECT * FROM Board;
SELECT COUNT(*) FROM BOARD;
SELECT * FROM Board WHERE id='hong';
UPDATE Board SET title='bonjour',content='comment cava' WHERE article_seq=1000;
SELECT DISTINCT member_id 
FROM Board 
WHERE member_id LIKE '_i%';

SELECT DISTINCT ssn,name  
FROM Member m, Board b
WHERE m.id=b.id AND ROWNUM <= 10;

SELECT ssn,name 
FROM Member m, Board b,Grade g
WHERE m.id=b.id OR m.id=g.id;

-- ************************
-- [8]TEST_TAB
-- 2017.08.03
-- article_seq,id,title,
-- content,hitcount,regdate
-- ************************

create table male(
	couple_id number primary key,
	name varchar2(10)
);
create table female(
	couple_id number primary key,
	name varchar2(10)
);

select * from member where member_id like 'hong';
select * from major;
select * from member;
select rownum num,t.*
from (select * 
from member m join major j
on m.member_id = j.member_id) t
;
select * from student;
drop table student;

create view student (num,id,name,ssn,regdate,phone,email,title)
as
select rownum num, t.*
from(select 
		a.member_id id, a.name, rpad(substr(a.ssn,1,8),14,'*') ssn, 
		to_char(a.regdate,'yyyy-MM-dd') regdate, a.phone, a.email,
		listagg(s.title,',') within group(order by s.title) title
	from member a
		left join major m on a.member_id like m.member_id
		left join subject s on m.subj_id like s.subj_id
		group by a.member_id, a.name, a.ssn, a.regdate, a.phone, a.email
		order by regdate 
	)t
order by rownum desc;


select 
a.member_id, a.name, a.ssn, a.regdate, a.phone, a.email,
	listagg(s.title,',') within group(order by s.title) title
from member a
left join major m on a.member_id like m.member_id
left join subject s on m.subj_id like s.subj_id
group by a.member_id, a.name, a.ssn, a.regdate, a.phone, a.email;

select listagg(title,',') within group(order by title) title
from subject;



select * from student
where rownum <= 5;
;

select  t.*
from (select * from student
where num >((select count(*) from student) -5)) t
;


SELECT t2.*
FROM (SELECT ROWNUM seq,t.*
FROM (SELECT *FROM student ORDER BY num DESC) t) t2
WHERE t2.seq BETWEEN 6 AND 10;

SELECT t2.* 
FROM (SELECT ROWNUM seq,t.* 
   	  FROM (SELECT * 
   	  			FROM student 
   	  			ORDER BY num DESC) t) t2
WHERE t2.seq BETWEEN 1 AND 5;




select * from student;



select rownum, s.*
from student s
where rownum between 6 and 10;

select t.*
from (select rownum rnum, s.* 
		from student s)t
where t.rnum between 1 and 5;

SELECT t2.*
FROM (SELECT ROWNUM seq,t.*
  FROM (SELECT *
  FROM student
  WHERE name like '%홍%'
  ORDER BY num DESC) t) t2
WHERE t2.seq BETWEEN 1 AND 5;











