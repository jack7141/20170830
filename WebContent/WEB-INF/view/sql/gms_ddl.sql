-- id,name,password,ssn,regdate
CREATE SEQUENCE article_seq
 START WITH     1000
 INCREMENT BY   1
 NOCACHE
 NOCYCLE;
CREATE TABLE Member(
	id VARCHAR2(10),
	name VARCHAR2(10),
	password VARCHAR2(10),
	ssn VARCHAR2(15),
	regdate DATE,
	PRIMARY KEY(id)
);
SELECT * FROM Member;
SELECT * FROM Board;
DROP TABLE Member;
DROP TABLE Board;
-- id,title,content;
--	article_seq,hitcount;
-- regdate
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
ALTER TABLE Member ADD phone VARCHAR2(13);
ALTER TABLE Member ADD email VARCHAR2(35);

--2017-07-27
SELECT * FROM Member;
SELECT * FROM Major;
SELECT * FROM Subject;
SELECT * FROM Grade;


CREATE TABLE Major(
	major_id VARCHAR2(10),
	title VARCHAR2(10),
	PRIMARY KEY(major_id)
);
DROP TABLE Subject;
CREATE TABLE Subject(
	subj_id VARCHAR2(10),
	title VARCHAR2(10),
	PRIMARY KEY(subj_id)
);

CREATE SEQUENCE grade_seq
 START WITH     1000
 INCREMENT BY   1
 NOCACHE
 NOCYCLE;

CREATE TABLE Grade(
	grade_seq NUMBER,
	id VARCHAR2(10),
	score VARCHAR2(10),
	exam_date VARCHAR2(10),
	subj_id VARCHAR2(10),
	PRIMARY KEY(grade_seq) 
	--FOREIGN KEY(id) REFERENCES Member(id)
	--	ON DELETE CASCADE
	--FOREIGN KEY(subj_id) REFERENCES Subject(subj_id)
	--	ON DELETE CASCADE 
);

ALTER TABLE Member ADD profile VARCHAR2(30);

ALTER TABLE Member
ADD CONSTRAINT member_fk_major
FOREIGN KEY (major_id)
REFERENCES major (major_id)


ALTER TABLE Subject ADD major_id VARCHAR2(10);
ALTER TABLE Subject
ADD CONSTRAINT subject_fk_major
FOREIGN KEY (major_id)
REFERENCES Major(major_id)
ON DELETE CASCADE;


ALTER TABLE Grade
ADD CONSTRAINT grade_fk_subject
FOREIGN KEY (subj_id)
REFERENCES Subject (subj_id)
ON DELETE CASCADE;

ALTER TABLE Grade
ADD CONSTRAINT grade_fk_member
FOREIGN KEY (id)
REFERENCES Member (id)
ON DELETE CASCADE;