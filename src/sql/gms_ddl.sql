CREATE TABLE Member(
	id VARCHAR2(10),
	name VARCHAR2(10),
	password VARCHAR2(10),
	ssn VARCHAR2(15),
	regdate DATE,
	PRIMARY KEY(id)
);
	DROP TABLE Member;

	--id, title, content, regdate;
	--articleSeq, hitCount;
	
	SELECT * FROM Member;
	SELECT * FROM Board;
	SELECT * FROM Grade;
	
	CREATE SEQUENCE article_seq
	START WITH 1000
	INCREMENT BY 1
	NOCACHE
	NOCYCLE;
	
	drop sequence article_seq;

	DROP TABLE BOARD;
	
	SELECT * FROM tab;
	
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
ALTER TABLE Grade
RENAME COLUMN id TO member_id;

CREATE TABLE Prof(
	member_id VARCHAR2(10),
	salary VARCHAR2(8),
	PRIMARY KEY(member_id),
	FOREIGN KEY(member_id) REFERENCES Member(member_id)
		ON DELETE CASCADE
);
ALTER TABLE Prof Modify salary VARCHAR2(10);


