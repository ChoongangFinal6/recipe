drop table reply;
select * from comment;
-----------------------------------------------------------------


-- 레시피
CREATE TABLE recipe (
	no         INTEGER       NOT NULL, -- 글번호
	email      VARCHAR2(100) NOT NULL, -- 아이디(이메일)
	country    VARCHAR2(50)  NULL,     -- 국가
	time       INTEGER       NOT NULL, -- 시간
	material   VARCHAR2(500) NOT NULL, -- 재료
	name       VARCHAR2(255) NOT NULL, -- 요리명
	difficulty INTEGER       NULL,     -- 난이도
	amount     INTEGER       NULL,     -- 인분
	oven       VARCHAR2(2)   NULL,     -- 오븐
	writeDate  DATE          NOT NULL, -- 작성일
	lastImage  VARCHAR2(50)  NULL,     -- 사진
	rate       INTEGER       NULL      -- 평점
);

-- 레시피
ALTER TABLE recipe
	ADD
		CONSTRAINT PK_recipe -- 레시피 기본키
		PRIMARY KEY (
			no -- 글번호
		);

-- todo
CREATE TABLE todo (
	no       INTEGER       NOT NULL, -- 일련번호
	title    VARCHAR2(255) NOT NULL, -- 제목
	email    VARCHAR2(100) NOT NULL, -- 아이디(이메일)
	duration INTEGER       NULL,     -- 기간
	endTime  DATE          NOT NULL, -- 마감시간
	location VARCHAR2(100) NULL,     -- 장소
	finish   VARCHAR2(1)   NULL,     -- 완료
	repeat   INTEGER       NULL      -- 반복(일단위)
);

-- todo
ALTER TABLE todo
	ADD
		CONSTRAINT PK_todo -- todo 기본키
		PRIMARY KEY (
			no -- 일련번호
		);

-- partner
CREATE TABLE partner (
	no    INTEGER       NOT NULL, -- 일련번호
	email VARCHAR2(100) NULL,     -- 이메일
	phone VARCHAR2(100) NULL,     -- 전화
	time  DATE          NOT NULL  -- 연락시간
);

-- rating
CREATE TABLE rating (
	no        INTEGER       NOT NULL, -- 일련번호
	postNo    INTEGER       NOT NULL, -- 글번호
	rate      INTEGER       NOT NULL, -- 평점
	email     VARCHAR2(100) NOT NULL, -- 아이디(이메일)
	inputDate INTEGER       NOT NULL  -- 입력일
);

-- rating
ALTER TABLE rating
	ADD
		CONSTRAINT PK_rating -- rating 기본키
		PRIMARY KEY (
			no,     -- 일련번호
			postNo  -- 글번호
		);

-- 댓글
CREATE TABLE rTodo (
	id    INTEGER       NOT NULL, -- id
	no    INTEGER       NOT NULL, -- 글번호
	email VARCHAR2(100) NOT NULL, -- 아이디(이메일)
	time  INTEGER       NOT NULL  -- 시간
);

-- 댓글
ALTER TABLE rTodo
	ADD
		CONSTRAINT PK_rTodo -- 댓글 기본키
		PRIMARY KEY (
			id, -- id
			no  -- 글번호
		);

-- 재료
CREATE TABLE material (
	no       INTEGER      NOT NULL, -- 일련번호
	material VARCHAR2(30) NOT NULL, -- 이름
	category VARCHAR2(20) NULL      -- 분류
);

-- 재료
ALTER TABLE material
	ADD
		CONSTRAINT PK_material -- 재료 기본키
		PRIMARY KEY (
			no -- 일련번호
		);

-- 단위
CREATE TABLE unit (
	no       INTEGER      NOT NULL, -- 일련번호
	unit     VARCHAR2(10) NOT NULL, -- 단위
	category VARCHAR2(20) NOT NULL  -- 분류
);

-- 단위
ALTER TABLE unit
	ADD
		CONSTRAINT PK_unit -- 단위 기본키
		PRIMARY KEY (
			no -- 일련번호
		);

-- 국가
CREATE TABLE country (
	no      INTEGER            NOT NULL, -- 일련번호
	country <데이터 타입 없음> NOT NULL  -- 국가
);

-- 국가
ALTER TABLE country
	ADD
		CONSTRAINT PK_country -- 국가 기본키
		PRIMARY KEY (
			no -- 일련번호
		);


-- 댓글
CREATE TABLE reply (
	no         INTEGER       NOT NULL, -- 일련번호
	postNo     INTEGER       NOT NULL, -- 글번호
	email      VARCHAR2(40)  NOT NULL, -- 작성자
	content    VARCHAR2(1000) NULL,     -- 내용
	writeDate  DATE          NULL,     -- 작성일
	ref        INTEGER       NULL,     -- 참조댓글
	refId      VARCHAR2(40) NULL      -- 참조아이디
);

-- 댓글
ALTER TABLE reply
	ADD
		CONSTRAINT PK_reply -- 댓글 기본키2
		PRIMARY KEY (
			no,     -- 일련번호
			postNo  -- 글번호
		);

-- 본문
CREATE TABLE content (
	postNo  INTEGER        NOT NULL, -- 글번호
	no      INTEGER        NOT NULL, -- 일련번호
	image   VARCHAR2(50)   NULL,     -- 사진
	content VARCHAR2(4000) NOT NULL  -- 내용
);

-- 본문
ALTER TABLE content
	ADD
		CONSTRAINT PK_content -- 본문 기본키
		PRIMARY KEY (
			postNo, -- 글번호
			no      -- 일련번호
		);

-- partner
ALTER TABLE partner
	ADD
		CONSTRAINT FK_todo_TO_partner -- todo -> partner
		FOREIGN KEY (
			no -- 일련번호
		)
		REFERENCES todo ( -- todo
			no -- 일련번호
		);

-- rating
ALTER TABLE rating
	ADD
		CONSTRAINT FK_recipe_TO_rating -- 레시피 -> rating
		FOREIGN KEY (
			postNo -- 글번호
		)
		REFERENCES recipe ( -- 레시피
			no -- 글번호
		);

-- 댓글
ALTER TABLE rTodo
	ADD
		CONSTRAINT FK_recipe_TO_rTodo -- 레시피 -> 댓글
		FOREIGN KEY (
			no -- 글번호
		)
		REFERENCES recipe ( -- 레시피
			no -- 글번호
		);

-- 댓글
ALTER TABLE rTodo
	ADD
		CONSTRAINT FK_recipe_TO_rTodo2 -- 레시피 -> 댓글2
		FOREIGN KEY (
			no -- 글번호
		)
		REFERENCES recipe ( -- 레시피
			no -- 글번호
		);

-- 댓글
ALTER TABLE comment
	ADD
		CONSTRAINT FK_recipe_TO_comment -- 레시피 -> 댓글3
		FOREIGN KEY (
			postNo -- 글번호
		)
		REFERENCES recipe ( -- 레시피
			no -- 글번호
		);

-- 본문
ALTER TABLE content
	ADD
		CONSTRAINT FK_recipe_TO_content -- 레시피 -> 본문
		FOREIGN KEY (
			postNo -- 글번호
		)
		REFERENCES recipe ( -- 레시피
			no -- 글번호
		);