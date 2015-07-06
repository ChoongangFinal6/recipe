drop table material;

CREATE TABLE material (
	no       INTEGER      NOT NULL, -- 일련번호
	material VARCHAR2(30) NOT NULL, -- 이름
	category VARCHAR2(10) NULL      -- 단위코드
);

select * from MATERIAL;

insert into MATERIAL values (1, '돼지고기', 'meat');
insert into MATERIAL values (2, '소고기', 'meat');
insert into MATERIAL values (3, '양고기', 'meat');
insert into MATERIAL values (4, '쌀', 'grain');
insert into MATERIAL values (5, '보리', 'grain');
insert into MATERIAL values (6, '옥수수', 'grain');
insert into MATERIAL values (7, '토마토', 'vegetable');
insert into MATERIAL values (8, '배추', 'vegetable');
insert into MATERIAL values (9, '상추', 'vegetable');
insert into MATERIAL values (10, 'kimchi', 'vegetable');
insert into MATERIAL values (11, '두부', 'grain');
insert into MATERIAL values (12, '간장', 'source');
insert into MATERIAL values (13, '김치', 'vegetable');
insert into MATERIAL values (14, '된장', 'source');
insert into MATERIAL values (15, '물', 'water');



-- 단위
CREATE TABLE unit (
	no       INTEGER      NOT NULL, -- 일련번호
	unit     VARCHAR2(10) NOT NULL, -- 단위
	unitCode VARCHAR2(10) NOT NULL  -- 단위코드
);


drop table recipe;

-- 레시피
CREATE TABLE recipe (
	no         INTEGER       primary key, -- 글번호
	email      VARCHAR2(100) NOT NULL, -- 아이디(이메일)
	country   VARCHAR2(50)  NULL,     -- 국가
	time       INTEGER       NOT NULL, -- 시간
	material   VARCHAR2(500) NOT NULL, -- 재료
	name       VARCHAR2(255) NOT NULL, -- 요리명
	difficulty INTEGER       NULL,     -- 난이도
	amount       INTEGER       NULL,     -- 인분
	oven       VARCHAR2(5)   NULL,     -- 오븐
	writeDate  DATE          NOT NULL, -- 작성일
	lastimage VARCHAR2(50) NULL, -- 마지막 사진
	rate 		NUMBER(5,2)			NULL			-- 평점
);

select * from recipe;

insert into recipe values (1, 'ttt@choongang.com', 'china', 120, '돼지고기,spoon,1,닭고기,spoon,2', '김치찌개', 2, 2, 'Y', sysdate, '마지막 사진', 0);



drop table content;

CREATE TABLE content (
	postNo		INTEGER	 NOT NULL,
	no		INTEGER		NOT NULL, 
	image		VARCHAR2(500)		NULL,
	content		VARCHAR2(1000)		NULL	
);

select * from content;

select * from reply;

insert into content values (1, 1, '사진', '내용');


drop table rating;

CREATE TABLE rating (
	no			INTEGER		NOT NULL,
	postNo		INTEGER		NOT NULL,
	rate		INTEGER		NOT NULL,
	email		VARCHAR2(100)	NOT NULL,
	inputDate	DATE		NOT NULL
);

insert into rating values (0, 0, 0, '1',sysdate);

CREATE OR REPLACE PROCEDURE avgRate
  (postno_v IN rating.postNo%type) 
IS 
  avg_v NUMBER;
BEGIN 
  select round(avg(rate),2) into avg_v from rating where postNo=postno_v;
  update recipe set rate=avg_v where no = postno_v;
  COMMIT; 
END avgRate; 
/
