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
	image      VARCHAR2(50)  NULL,      -- 사진
	rate 			INTEGER			NULL			-- 평점
);

select * from recipe;

insert into recipe values (1, 'ttt@choongang.com', '한식', 120, '돼지고기', '김치찌개', 2, 2, 'true', sysdate, '21421421.jpg', 5);


