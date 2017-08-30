-- id,name,password,ssn,regdate
INSERT INTO Member(id,name,password,ssn,regdate)
VALUES('hong','홍길동','1','800101-123456',SYSDATE);
INSERT INTO Member(id,name,password,ssn,regdate)
VALUES('hong1','홍길동','1','830101-223456',SYSDATE);
INSERT INTO Member(id,name,password,ssn,regdate)
VALUES('hong2','홍길동','1','910101-123456',SYSDATE);
INSERT INTO Member(id,name,password,ssn,regdate)
VALUES('kim','김유신','1','950101-123456',SYSDATE);
INSERT INTO Member(id,name,password,ssn,regdate)
VALUES('yoo','유관순','1','890101-223456',SYSDATE);
INSERT INTO Member(id,name,password,ssn,regdate)
VALUES('song','송혜교','1','900101-223456',SYSDATE);
INSERT INTO Member(id,name,password,ssn,regdate)
VALUES('song2','송중기','1','930101-123456',SYSDATE);
INSERT INTO Member(id,name,password,ssn,regdate)
VALUES('kim','김하윤','1','930101-223456',SYSDATE);
INSERT INTO Member(id,name,password,ssn,regdate)
VALUES('lee','이순신','1','820101-123456',SYSDATE);
INSERT INTO Member(id,name,password,ssn,regdate)
VALUES('byun','변용주','1','860101-123456',SYSDATE);
INSERT INTO Member(id,name,password,ssn,regdate)
VALUES('cho1','조봉암','1','840101-123456',SYSDATE);
INSERT INTO Member(phone)
VALUES('010-1234-4567');
UPDATE Member SET phone='010-1234-4567';
SELECT id FROM Member;
SELECT * FROM Member;
SELECT * FROM Member WHERE name='홍길동';
SELECT * FROM Member WHERE id='hong';
SELECT COUNT(*) AS count FROM Member;
UPDATE Member SET password='2' WHERE id='hong';
DELETE FROM Member WHERE id='choi';
--id,title,content
--article_seq,hitcount
--regdate
INSERT INTO Board(article_seq,id,title,content,hitcount,regdate)
VALUES(article_seq.nextval,'kim','대중을 있는','주는 얼마나 크고 품에 대중을 있는',0,SYSDATE);
SELECT * FROM Member;
SELECT * FROM Major;
SELECT COUNT(*) FROM BOARD;
SELECT * FROM Board WHERE id='hong';
UPDATE Board SET title='bonjour',content='comment cava' WHERE article_seq=1000;
SELECT * FROM Subject;
INSERT INTO Subject(subj_id,title,major_id) VALUES ('python','파이썬','computer');
UPDATE Member SET major_id='computer';
SELECT * FROM BOARD;
SELECT * FROM Grade;
SELECT DISTINCT id FROM BOARD WHERE id LIKE '%o%';
SELECT * FROM Member WHERE id ='hong' ORDER BY name;
SELECT * FROM Member ORDER BY ssn DESC, name ASC;
SELECT SUM(ARTICLE_SEQ) FROM BOARD;
SELECT * FROM student;
SELECT * FROM Member m, Board b, Grade g
WHERE m.id=b.id AND m.id=g.id
ORDER BY ARTICLE_SEQ ASC;

