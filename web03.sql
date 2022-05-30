create table board(seq number primary key,
title varchar2(100) not null,
content varchar2(800) not null,
nickname varchar2(20),
regdate date,
visited number
);
drop table board;

select * from board;
select * from board where seq=2;

insert into board values(1, 'test 제목1', 'test 내용1', 'admin', sysdate, 0);
insert into board values((select nvl(max(seq), 0)+1 from board), 'test 제목2', 'test 내용2', 'admin', sysdate, 0);
insert into board values((select nvl(max(seq), 0)+1 from board), 'test 제목3', 'test 내용3', 'admin', sysdate, 0);
insert into board values((select nvl(max(seq), 0)+1 from board), 'test 제목4', 'test 내용4', 'admin', sysdate, 0);
insert into board values((select nvl(max(seq), 0)+1 from board), 'test 제목5', 'test 내용5', 'admin', sysdate, 0);
insert into board values((select nvl(max(seq), 0)+1 from board), 'test 제목6', 'test 내용6', 'admin', sysdate, 0);
insert into board values((select nvl(max(seq), 0)+1 from board), 'test 제목7', 'test 내용7', 'admin', sysdate, 0);
insert into board values((select nvl(max(seq), 0)+1 from board), 'test 제목8', 'test 내용8', 'admin', sysdate, 0);
insert into board values((select nvl(max(seq), 0)+1 from board), 'test 제목9', 'test 내용9', 'admin', sysdate, 0);
insert into board values((select nvl(max(seq), 0)+1 from board), 'test 제목10', 'test 내용10', 'admin', sysdate, 0);
insert into board values((select nvl(max(seq), 0)+1 from board), 'test 제목11', 'test 내용11', 'admin', sysdate, 0);
insert into board values((select nvl(max(seq), 0)+1 from board), 'test 제목12', 'test 내용12', 'admin', sysdate, 0);

update board set title=?, content=?, nickname=?, regdate=sysdate where seq=?;

delete from board where seq=?;

commit;

drop table member;
create table member(userid varchar2(20) primary key,
userpw varchar2(300) not null,
username varchar2(50) not null,
email varchar2(100) not null,
tel varchar2(20) not null,
addr1 varchar2(200),
addr2 varchar2(100),
postcode varchar2(50),
regdate date default sysdate,
birth date,
userpoint number default 100,
visited number default 0
);

insert into member values('admin', '1234','관리자', 'admin@naver.com', '010-1234-1234', '서울시 은평구','서울시 은평구', '은평로123', sysdate, '1991-11-13', 5, 1);
insert into member values('aaaa', '8878','홍길동', 'aaaa@naver.com', '010-2222-2323', '인천시 부평구','인천시 부평구', '부평로123', sysdate, '1995-01-12', 5, 0);
insert into member values('bbbb', '4343','이순신', 'bbbb@naver.com', '010-1578-4344', '서울시 서초구','서울시 서초구', '서초로123', sysdate, '1987-02-23', 5, 0);
insert into member values('cccc', '2222','을지문덕', 'cccc@naver.com', '010-1248-7587', '서울시 구로구','서울시 구로구', '대림로123', sysdate, '1988-05-19', 5, 1);
insert into member values('dddd', '1515','주몽', 'dddd@naver.com', '010-5353-3015', '서울시 강남구','서울시 강남구','대치로123', sysdate, '1989-10-12', 5, 1);
alter table member add username varchar2(50);

select to_char(regdate, 'yyyy-MM-dd HH24:mi:ss') as cdate from member;
-- alter table modify birth varchar2();

commit;
select * from member;

drop table goods;
-- 상품 테이블
create table goods(gno number primary key,  -- 상품코드
gcategory varchar2(100),    -- 카테고리
gname varchar2(100),    -- 상품명
gprice number,  -- 가격
gcolor varchar2(40),    -- 색상
amount number,  -- 수량
gsize varchar2(40), -- 크기
gcontent varchar2(1000),    -- 설명
gimage varchar2(1000),  -- 이미지
best number,    -- 인기도
regdate date);  -- 등록일

-- 더미 데이터 추가
insert into goods values ();

-- 해당 상품 제거
delete from goods where gno=?

-- 해당 상품 정보 수정
update goods set gcategory=?, gname=?, gprice=?, gcolor=?, amount=?, gsize=?, gcontent=?, gimage=?, best=?, regdate=sysdate where gno=?   
-- update goods set gimage='002.jpg' where gno=2;


-- 해당 상품 검색
select * from goods where gno=?;
select * from goods where gcategory=? and gno=?;

update goods set gimage='001.jpg' where gno=1;

-- delete from goods gno=3;

drop table basket;
-- 장바구니
create table basket(bno number primary key, -- 장바구니번호
userid varchar2(20),    -- 사용자아이디
gno number,             -- 상품코드
gcolor varchar2(40),    -- 색상
amount number,          -- 수량
gsize varchar2(40),     -- 크기
bdate Date);            -- 장바구니 담긴 날짜

-- 장바구니 담기
insert into basket values ();

-- 장바구니 정보 변경
update basket set gno=?, gcolor=?, amount=?, gsize=?, bdate=sysdate where bno=?;

-- 장바구니 삭제
delete from basket where bno=?;

-- 장바구니 검색
select * from basket;

drop table payment;
-- 주문
create table payment(ono number primary key, -- 결제번호
    paytype varchar2(20),   -- 결제방식
    payno varchar2(30),     -- 결제카드번호
    money number,           -- 결제금액
    sdate date,             -- 결제일
    gno number,             -- 상품코드
    amount number,          -- 수량
    userid varchar2(20),    -- 사용자아이디
	rname varchar2(30),     -- 수신자명
    tel varchar2(20),       -- 수신자전화번호
    addr1 varchar2(200),    -- 수신자 기본주소
    addr2 varchar2(100),    -- 수신자 상세주소
    postcode varchar2(10),  -- 수신자 우편번호
    transno varchar2(50),   -- 배송코드
    transco varchar2(50),   -- 배송회사
    rstatus varchar2(20),   -- 수신상태
    rdate date,             -- 도착일
	memo varchar2(100)     -- 메모
);

select * from payment;

drop table db_access;
-- 접속자 정보 저장 테이블
CREATE TABLE db_access (
  no number primary key,
  request_uri varchar(100),
  query_string varchar(200),
  remote_address varchar(30),
  server_name varchar(60),
  server_port varchar(10),
  locale varchar(20),
  browser varchar(200),
  referer varchar(255),
  session_id varchar(80),
  user_id varchar(20),
  response_time number,
  reg_date date default sysdate
);

commit;

-- drop table db_access;

select * from db_access;






