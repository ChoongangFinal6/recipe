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


