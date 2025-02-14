-- 메인글 테이블
create table community(
  idx number(10) NOT NULL,
  writer varchar2(50) NOT NULL,     --작성자(로그인계정 정보 등)
  title varchar2(100) NOT NULL ,	--글제목
  content varchar2(3000) NOT NULL,	-- 글 내용
  readCount number(10) default '0',    -- 조회수
  createdAt date default sysdate,       -- 작성날짜와시간 기본값
  ip varchar2(15) default '127.0.0.1',  -- 작성자 ip
  commentCount number(10) default '0',   --댓글 갯수
  primary key(idx)
);  
create SEQUENCE community_idx_seq;


-- 데이터 샘플 추가
INSERT INTO community (idx,writer,title,content)
VALUES (community_idx_seq.nextval, 'mina012','알립니다.','오늘 모임 변경안내입니다.');
INSERT INTO community (idx,writer,title,content)
VALUES (community_idx_seq.nextval, 'wonder','공지','공지공지');
INSERT INTO community (idx,writer,title,content)
VALUES (community_idx_seq.nextval, 'twice','하이','하이하이!!');
INSERT INTO community (idx,writer,title,content)
VALUES (community_idx_seq.nextval, 'hongGD','이벤트','이벤트 안내입니다.');
INSERT INTO community (idx,writer,title,content)
VALUES (community_idx_seq.nextval, '강감찬','재공지','재공지재공지');
INSERT INTO community (idx,writer,title,content)
VALUES (community_idx_seq.nextval, '이사나','정회원 공지','정회원 안내입니다.');
INSERT INTO community (idx,writer,title,content)
VALUES (community_idx_seq.nextval, '이사나','정회원 공55지','정회원 안내입니다.');
INSERT INTO community (idx,writer,title,content)
VALUES (community_idx_seq.nextval, '이사나','정회원 공66지','정회원 안내입니다.');
INSERT INTO community (idx,writer,title,content)
VALUES (community_idx_seq.nextval, '이사나','정회원 공77지','정회원 안내입니다.');
INSERT INTO community (idx,writer,title,content)
VALUES (community_idx_seq.nextval, '이사나','정회원 공88지','정회원 안내입니다.');
SELECT * FROM COMMUNITY c ;



-- 필요시 테이블 및 데이터 삭제
DROP TABLE community ;
TRUNCATE  TABLE community ;
DROP SEQUENCE community_idx_seq;

-- ////////////주요 sql //////////////////////////////////////////
-- 전체 글의 갯수 : *count*
SELECT count(*) FROM community ;	
-- idx 최대값 : *maxOf* -> 이 메소드는 각 매퍼 xml에 모두 작성하기
SELECT max(idx) FROM community ;	
-- 메인글 idx (3번)의 글 : selectByIdx 로 완료했음.
SELECT * FROM community f WHERE idx=3;


SELECT * FROM community  ORDER BY idx DESC;
SELECT rownum r ,f.* from
		(SELECT * FROM community  ORDER BY idx DESC) f;
		
-- rownoum 이용한 페이지네이션 sql : 게시판 글목록은 idx 의 내림차순 그리고, rownum 컬럼값으로 10개 또는 20개씩 조회
-- ROWNUM 은 오라클의 컬럼(행번호를 저장하는 메타데이터)
SELECT * FROM 
	(SELECT rownum r ,f.* from
		(SELECT * FROM community  ORDER BY idx DESC) f)
WHERE r BETWEEN 1 AND 10	;		    -- 1page 글목록
-- WHERE r BETWEEN 11 AND 20	;		-- 2page 글목록
--WHERE r BETWEEN 21 AND 30	;		    -- 3page 글목록



-- *setReadCount*
UPDATE community 
SET READCOUNT = READCOUNT +1 
WHERE idx = 3;		--조회수 업데이트(증가)


-- 댓글 개수 업데이트(댓글 추가,삭제 할때 모두 필요함)  : *setCommentCount*
UPDATE community 
SET COMMENTCOUNT = 
	(SELECT count(*) FROM communityComments c WHERE mref=3)
WHERE idx = 3;
