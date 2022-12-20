-- Saladay 테이블 데이터 삽입


-- member 샘플 데이터 삽입
-- 관리자, 샘플 회원 총 11명

-- 관리자
INSERT INTO "MEMBER"
VALUES(SEQ_MEMBER_NO.NEXTVAL, 'admin@saladay.co.kr', 'pass!', '관리자',
   '김샐러드', '01063406324', NULL, DEFAULT, DEFAULT, 0);

-- 샘플회원 10명
INSERT INTO "MEMBER"
VALUES(SEQ_MEMBER_NO.NEXTVAL, 'user01@saladay.co.kr', 'pass!', '유저일',
   '유저일', '01011111234', NULL, DEFAULT, DEFAULT, DEFAULT);
INSERT INTO "MEMBER"
VALUES(SEQ_MEMBER_NO.NEXTVAL, 'user02@saladay.co.kr', 'pass!', '유저이',
   '유저이', '01022221234', NULL, DEFAULT, DEFAULT, DEFAULT);
INSERT INTO "MEMBER"
VALUES(SEQ_MEMBER_NO.NEXTVAL, 'user03@saladay.co.kr', 'pass!', '유저삼',
   '유저삼', '01033331234', NULL, DEFAULT, DEFAULT, DEFAULT);
INSERT INTO "MEMBER"
VALUES(SEQ_MEMBER_NO.NEXTVAL, 'user04@saladay.co.kr', 'pass!', '유저사',
   '유저사', '01044441234', NULL, DEFAULT, DEFAULT, DEFAULT);
INSERT INTO "MEMBER"
VALUES(SEQ_MEMBER_NO.NEXTVAL, 'user05@saladay.co.kr', 'pass!', '유저오',
   '유저오', '01055551234', NULL, DEFAULT, DEFAULT, DEFAULT);
INSERT INTO "MEMBER"
VALUES(SEQ_MEMBER_NO.NEXTVAL, 'user06@saladay.co.kr', 'pass!', '유저육',
   '유저육', '01066661234', NULL, DEFAULT, DEFAULT, DEFAULT);
INSERT INTO "MEMBER"
VALUES(SEQ_MEMBER_NO.NEXTVAL, 'user07@saladay.co.kr', 'pass!', '유저칠',
   '유저칠', '01077771234', NULL, DEFAULT, DEFAULT, DEFAULT);
INSERT INTO "MEMBER"
VALUES(SEQ_MEMBER_NO.NEXTVAL, 'user08@saladay.co.kr', 'pass!', '유저팔',
   '유저팔', '01088881234', NULL, DEFAULT, DEFAULT, DEFAULT);
INSERT INTO "MEMBER"
VALUES(SEQ_MEMBER_NO.NEXTVAL, 'user09@saladay.co.kr', 'pass!', '유저구',
   '유저구', '01099991234', NULL, DEFAULT, DEFAULT, DEFAULT);
INSERT INTO "MEMBER"
VALUES(SEQ_MEMBER_NO.NEXTVAL, 'user10@saladay.co.kr', 'pass!', '유저십',
   '유저십', '01010101234', NULL, DEFAULT, DEFAULT, DEFAULT);

-- 배송 관리 데이터 삽입
INSERT INTO DELIVERY_MANAGE VALUES('A', '결제완료');
INSERT INTO DELIVERY_MANAGE VALUES('B', '배송준비중');
INSERT INTO DELIVERY_MANAGE VALUES('C', '배송중');
INSERT INTO DELIVERY_MANAGE VALUES('D', '배송완료');


-- 메뉴 데이터 삽입
INSERT INTO MENU 
VALUES(SEQ_MENU_NO.NEXTVAL, '로스트 치킨', 7900, '/resources/images/menu/salad/로스트치킨.png', '오븐에 구워 담백한 저칼로리 닭가슴살의 건강한 풍미', DEFAULT);

INSERT INTO MENU 
VALUES(SEQ_MENU_NO.NEXTVAL, '스파이시 바비큐', 8900, '/resources/images/menu/salad/스파이시바비큐.png', '부드러운 풀드포크에 매콤한 맛을 더했다!
자꾸만 생각 날 매콤한 맛을 샐러데이 스파이시 바비큐로 만나보세요!', DEFAULT);

INSERT INTO MENU 
VALUES(SEQ_MENU_NO.NEXTVAL, '치킨 베이컨 아보카도', 9900, '/resources/images/menu/salad/치킨베이컨아보카도.png', '담백하게 닭가슴살로 만든 치킨 슬라이스와 베이컨, 부드러운 아보카도의 만남', DEFAULT);

INSERT INTO MENU 
VALUES(SEQ_MENU_NO.NEXTVAL, '샐러데이 클럽', 7900, '/resources/images/menu/salad/샐러데이클럽.png', '고소한 베이컨, 담백한 치킨 슬라이스에 햄까지 더해진 완벽한 앙상블', DEFAULT);

INSERT INTO MENU 
VALUES(SEQ_MENU_NO.NEXTVAL, '치킨 슬라이스', 8900, '/resources/images/menu/salad/치킨슬라이스.png', '닭가슴살로 만든 치킨 슬라이스로 즐기는 담백한 맛!', DEFAULT);

INSERT INTO MENU 
VALUES(SEQ_MENU_NO.NEXTVAL, '이탈리안비엠티', 8900, '/resources/images/menu/salad/이탈리안비엠티.png', '페퍼로니, 살라미 그리고 햄이 만들어내는 최상의 조화! 샐러데이의 스테디셀러!', DEFAULT);

INSERT INTO MENU 
VALUES(SEQ_MENU_NO.NEXTVAL, '풀드 포크 바비큐', 9900, '/resources/images/menu/salad/풀포크.png', '훈연한 미국 스타일의 풀드 포크 바비큐가 가득 올라간 풍미 가득한 샐러드', DEFAULT);

INSERT INTO MENU 
VALUES(SEQ_MENU_NO.NEXTVAL, '스테이크 & 치즈', 9900, '/resources/images/menu/salad/스테이크치즈.png', '육즙이 쫙~풍부한 비프 스테이크의 풍미 가득 스테이크 & 치즈 샐러드!', DEFAULT);

INSERT INTO MENU 
VALUES(SEQ_MENU_NO.NEXTVAL, '스파이시 이탈리안', 9900, '/resources/images/menu/salad/스파이시이탈리안.png', '살라미, 페퍼로니가 입안 한가득! 진짜 이탈리아의 맛 가득한 샐러드', DEFAULT);

INSERT INTO MENU 
VALUES(SEQ_MENU_NO.NEXTVAL, '쉬림프', 8900, '/resources/images/menu/salad/쉬림프.png', '탱글한 식감이 그대로 살아있는 통새우가 5마리가 샐러드에 쏙 ! Fresh함이 그대로~', DEFAULT);

INSERT INTO MENU 
VALUES(SEQ_MENU_NO.NEXTVAL, '베지 샐러데이', 6000, '/resources/images/menu/salad/베지.png', '기본에 충실한 베지 샐러드', DEFAULT);


-- 옵션 데이터 삽입
INSERT INTO "OPTION"
VALUES (SEQ_OPTION_NO.NEXTVAL, 'M', '베이컨', '/resources/images/menu/topping/베이컨.png', 1000, DEFAULT);
INSERT INTO "OPTION"
VALUES (SEQ_OPTION_NO.NEXTVAL, 'M', '치킨', '/resources/images/menu/topping/치킨.png', 1000, DEFAULT);
INSERT INTO "OPTION"
VALUES (SEQ_OPTION_NO.NEXTVAL, 'M', '스테이크', '/resources/images/menu/topping/스테이크.png', 3000, DEFAULT);
INSERT INTO "OPTION"
VALUES (SEQ_OPTION_NO.NEXTVAL, 'M', '에그마요', '/resources/images/menu/topping/에그마요.png', 2000, DEFAULT);
INSERT INTO "OPTION"
VALUES (SEQ_OPTION_NO.NEXTVAL, 'M', '참치', '/resources/images/menu/topping/참치.png', 1000, DEFAULT);
INSERT INTO "OPTION"
VALUES (SEQ_OPTION_NO.NEXTVAL, 'M', '페퍼로니', '/resources/images/menu/topping/에그마요.png', 1500, DEFAULT);
INSERT INTO "OPTION"
VALUES (SEQ_OPTION_NO.NEXTVAL, 'M', '햄', '/resources/images/menu/topping/에그마요.png', 1000, DEFAULT);
INSERT INTO "OPTION"
VALUES (SEQ_OPTION_NO.NEXTVAL, 'M', '치즈', '/resources/images/menu/topping/치즈.png', 1000, DEFAULT);

INSERT INTO "OPTION"
VALUES (SEQ_OPTION_NO.NEXTVAL, 'S', '마요네즈', '/resources/images/menu/topping/마요네즈.png', 500, DEFAULT);
INSERT INTO "OPTION"
VALUES (SEQ_OPTION_NO.NEXTVAL, 'S', '사워소스', '/resources/images/menu/topping/사워소스.png', 500, DEFAULT);
INSERT INTO "OPTION"
VALUES (SEQ_OPTION_NO.NEXTVAL, 'S', '스위트칠리', '/resources/images/menu/topping/스위트칠리.png', 500, DEFAULT);
INSERT INTO "OPTION"
VALUES (SEQ_OPTION_NO.NEXTVAL, 'S', '케찹', '/resources/images/menu/topping/케찹.png', 500, DEFAULT);
INSERT INTO "OPTION"
VALUES (SEQ_OPTION_NO.NEXTVAL, 'S', '허니머스타스', '/resources/images/menu/topping/허니머스타스.png', 500, DEFAULT);
INSERT INTO "OPTION"
VALUES (SEQ_OPTION_NO.NEXTVAL, 'S', '홀그레인 머스타드', '/resources/images/menu/topping/홀그레인 머스타드.png', 500, DEFAULT);

INSERT INTO "OPTION"
VALUES (SEQ_OPTION_NO.NEXTVAL, 'T', '라디치오', '/resources/images/menu/topping/라디치오.png', 1000, DEFAULT);
INSERT INTO "OPTION"
VALUES (SEQ_OPTION_NO.NEXTVAL, 'T', '로메인', '/resources/images/menu/topping/로메인.png', 1000, DEFAULT);
INSERT INTO "OPTION"
VALUES (SEQ_OPTION_NO.NEXTVAL, 'T', '멀티리프', '/resources/images/menu/topping/멀티리프.png', 1000, DEFAULT);
INSERT INTO "OPTION"
VALUES (SEQ_OPTION_NO.NEXTVAL, 'T', '양상추', '/resources/images/menu/topping/양상추.png', 1000, DEFAULT);
INSERT INTO "OPTION"
VALUES (SEQ_OPTION_NO.NEXTVAL, 'T', '적근대', '/resources/images/menu/topping/적근대.png', 1000, DEFAULT);
INSERT INTO "OPTION"
VALUES (SEQ_OPTION_NO.NEXTVAL, 'T', '적양배추', '/resources/images/menu/topping/적양배추.png', 1000, DEFAULT);



COMMIT;