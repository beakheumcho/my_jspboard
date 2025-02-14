-- 1. bookuser 테이블에 회원정보 저장하기

CREATE TABLE bookuser (
	id VARCHAR2(20) primary key, 
	name NVARCHAR2(20) NOT NULL , 
	email VARCHAR2(20) unique, 
	age NUMBER(3,0), 
	reg_date DATE default sysdate, 
	password VARCHAR2(64)
   );

INSERT INTO BOOKUSER VALUES ('twice','박모모','momo@daum.net',39,TIMESTAMP'2022-02-05 00:00:00.0','1234');
INSERT INTO BOOKUSER VALUES ('mina012','김미나','kimm@gmail.com',20,TIMESTAMP'2022-02-07 15:03:06.0','1234');
INSERT INTO BOOKUSER VALUES ('hongGD','홍길동','giluug@naver.com',30,TIMESTAMP'2022-02-07 00:00:00.0','1234');
INSERT INTO BOOKUSER VALUES ('wonder','이나나','nana@korea.kr',22,TIMESTAMP'2022-02-05 00:00:00.0','1234');
INSERT INTO BOOKUSER VALUES ('sana','이사나','yu@naver.com',22,TIMESTAMP'2022-08-04 14:42:05.0','1234');
   
SELECT * FROM bookuser ; 


