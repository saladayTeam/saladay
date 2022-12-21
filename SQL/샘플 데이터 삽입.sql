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
-- 메인토핑('M')
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
VALUES (SEQ_OPTION_NO.NEXTVAL, 'M', '페퍼로니', '/resources/images/menu/topping/페퍼로니.png', 1500, DEFAULT);
INSERT INTO "OPTION"
VALUES (SEQ_OPTION_NO.NEXTVAL, 'M', '햄', '/resources/images/menu/topping/햄.png', 1000, DEFAULT);
INSERT INTO "OPTION"
VALUES (SEQ_OPTION_NO.NEXTVAL, 'M', '치즈', '/resources/images/menu/topping/치즈.png', 1000, DEFAULT);

-- 소스('S')
INSERT INTO "OPTION"
VALUES (SEQ_OPTION_NO.NEXTVAL, 'S', '마요네즈', '/resources/images/menu/topping/마요네즈.png', 500, DEFAULT);
INSERT INTO "OPTION"
VALUES (SEQ_OPTION_NO.NEXTVAL, 'S', '핫칠리', '/resources/images/menu/topping/핫칠리.png', 500, DEFAULT);
INSERT INTO "OPTION"
VALUES (SEQ_OPTION_NO.NEXTVAL, 'S', '스위트칠리', '/resources/images/menu/topping/스위트칠리.png', 500, DEFAULT);
INSERT INTO "OPTION"
VALUES (SEQ_OPTION_NO.NEXTVAL, 'S', '스위트어니언', '/resources/images/menu/topping/스위트어니언.png', 500, DEFAULT);
INSERT INTO "OPTION"
VALUES (SEQ_OPTION_NO.NEXTVAL, 'S', '허니머스타스', '/resources/images/menu/topping/허니머스타스.png', 500, DEFAULT);
INSERT INTO "OPTION"
VALUES (SEQ_OPTION_NO.NEXTVAL, 'S', '레드와인식초', '/resources/images/menu/topping/레드와인식초.png', 500, DEFAULT);

-- 서브토핑('T')
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


-- 구독상품 PACKAGE 테이블 샘플 데이터 삽입
INSERT INTO "PACKAGE"
VALUES(SEQ_PACKAGE_NO.NEXTVAL, '[1주] 샐러드 3팩 패키지', 1, '/resources/images/menu/package/1weekSample.png');
INSERT INTO "PACKAGE"
VALUES(SEQ_PACKAGE_NO.NEXTVAL, '[1주] 샐러드 5팩 패키지', 1, '/resources/images/menu/package/1weekSample.png');
INSERT INTO "PACKAGE"
VALUES(SEQ_PACKAGE_NO.NEXTVAL, '[1주] 샐러드 7팩 패키지', 1, '/resources/images/menu/package/1weekSample.png');
INSERT INTO "PACKAGE"
VALUES(SEQ_PACKAGE_NO.NEXTVAL, '[2주] 샐러드 3팩 패키지', 2, '/resources/images/menu/package/2weekSample.png');
INSERT INTO "PACKAGE"
VALUES(SEQ_PACKAGE_NO.NEXTVAL, '[2주] 샐러드 5팩 패키지', 2, '/resources/images/menu/package/2weekSample.png');
INSERT INTO "PACKAGE"
VALUES(SEQ_PACKAGE_NO.NEXTVAL, '[2주] 샐러드 7팩 패키지', 2, '/resources/images/menu/package/2weekSample.png');



-- 주문 ORDER 테이블 샘플 데이터 삽입
-- (주문번호 1) 주문 ORDER 테이블 샘플 데이터 삽입 1
-- 2번 회원(유저일)이 1번 패키지(1주/3팩)를 주문했을 경우 주문한 메뉴 테이블, 주문한 메뉴별 옵션 테이블, 배송테이블까지 INSERT
INSERT INTO "ORDER"
VALUES(SEQ_ORDER_NO.NEXTVAL, DEFAULT, NULL, 33200, DEFAULT, '유저일', '01011111234', '04540,,서울시 중구 남대문로 120,,2층', 2, 1);

-- (주문번호 1) 주문한 메뉴 테이블 insert 1번 패키지 4, 5, 6번 샐러드를 선택
INSERT INTO "ORDER_MENU"
VALUES(SEQ_ORDER_MENU_NO.NEXTVAL, 1, 4);
INSERT INTO "ORDER_MENU"
VALUES(SEQ_ORDER_MENU_NO.NEXTVAL, 1, 5);
INSERT INTO "ORDER_MENU"
VALUES(SEQ_ORDER_MENU_NO.NEXTVAL, 1, 6);

-- (주문번호1) 주문한 메뉴 중 1번째 샐러드(메뉴번호4)에 1번(M), 9번(S), 15번(T) 옵션 각 1개, 2개, 3개씩 선택
INSERT INTO "ORDER_MENU_OPTION" VALUES(1, 1, 1);
INSERT INTO "ORDER_MENU_OPTION" VALUES(1, 9, 2);
INSERT INTO "ORDER_MENU_OPTION" VALUES(1, 15, 3);

-- (주문번호1) 주문한 메뉴 중 2번째 샐러드(메뉴번호5)에 2번(M), 10번(S), 16번(T) 옵션 각 1개씩 선택
INSERT INTO "ORDER_MENU_OPTION" VALUES(2, 2, 1);
INSERT INTO "ORDER_MENU_OPTION" VALUES(2, 10, 1);
INSERT INTO "ORDER_MENU_OPTION" VALUES(2, 16, 1);

-- (주문번호1) 주문한 메뉴 중 3번째 샐러드(메뉴번호6)는 옵션 선택X

-- (주문번호1) 가격 계산
SELECT
   (SELECT (MENU_PRICE+(SELECT OPTION_PRICE FROM "OPTION" WHERE OPTION_NO=1)
   +(SELECT OPTION_PRICE*2 FROM "OPTION" WHERE OPTION_NO=9)
   +(SELECT OPTION_PRICE*3 FROM "OPTION" WHERE OPTION_NO=15)) MENU_PRICE FROM MENU WHERE MENU_NO=4)+
   (SELECT (MENU_PRICE+(SELECT OPTION_PRICE FROM "OPTION" WHERE OPTION_NO=2)
   +(SELECT OPTION_PRICE FROM "OPTION" WHERE OPTION_NO=10)
   +(SELECT OPTION_PRICE FROM "OPTION" WHERE OPTION_NO=16)) MENU_PRICE FROM MENU WHERE MENU_NO=5)+
   (SELECT MENU_PRICE FROM MENU WHERE MENU_NO=6
   ) ORDER_PRICE
FROM DUAL;

-- (주문번호1) 배송 DELIVERY 테이블 INSERT (리뷰작성용 샘플이라 배송일 SYSDATE, 배송완료로 입력)
INSERT INTO "DELIVERY"
VALUES(SEQ_DELIVERY_NO.NEXTVAL, SYSDATE, 1, 'D');
-- (주문번호1) 연관 테이블 샘플 데이터 삽입 완료

-- (주문번호 2) 주문 ORDER 테이블 샘플 데이터 삽입 2
-- 3번 회원(유저이)이 4번 패키지(2주/3팩)를 주문했을 경우 주문한 메뉴 테이블, 주문한 메뉴별 옵션 테이블, 배송테이블까지 INSERT
INSERT INTO "ORDER"
VALUES(SEQ_ORDER_NO.NEXTVAL, DEFAULT, NULL, 62400, DEFAULT, '유저이', '01022221234', '04540,,서울시 중구 남대문로 120,,2층', 3, 4);


-- (주문번호 2) 주문한 메뉴 테이블 insert 4번 패키지 7, 8, 9번 샐러드를 선택
INSERT INTO "ORDER_MENU"
VALUES(SEQ_ORDER_MENU_NO.NEXTVAL, 2, 7);
INSERT INTO "ORDER_MENU"
VALUES(SEQ_ORDER_MENU_NO.NEXTVAL, 2, 8);
INSERT INTO "ORDER_MENU"
VALUES(SEQ_ORDER_MENU_NO.NEXTVAL, 2, 9);

-- (주문번호2) 주문한 메뉴 중 1번째 샐러드(메뉴번호7)는 옵션X

-- (주문번호2) 주문한 메뉴 중 2번째 샐러드(메뉴번호8)에 14번(S) 옵션 1개 선택
INSERT INTO "ORDER_MENU_OPTION" VALUES(5, 14, 1);

-- (주문번호2) 주문한 메뉴 중 3번째 샐러드(메뉴번호9)에 18번(T) 옵션 1개 선택
INSERT INTO "ORDER_MENU_OPTION" VALUES(6, 18, 1);

-- (주문번호2) 가격 계산(2주니까 *2)
SELECT
   ((SELECT MENU_PRICE FROM MENU WHERE MENU_NO=7)+
   (SELECT (MENU_PRICE+(SELECT OPTION_PRICE FROM "OPTION" WHERE OPTION_NO=14)
   ) MENU_PRICE FROM MENU WHERE MENU_NO=8)+
   (SELECT (MENU_PRICE+(SELECT OPTION_PRICE FROM "OPTION" WHERE OPTION_NO=18)
   ) MENU_PRICE FROM MENU WHERE MENU_NO=9))*2
 ORDER_PRICE
FROM DUAL;

-- (주문번호2) 배송 DELIVERY 테이블 INSERT (리뷰작성용 샘플이라 배송일 SYSDATE, 배송완료로 입력)
INSERT INTO "DELIVERY"
VALUES(SEQ_DELIVERY_NO.NEXTVAL, SYSDATE, 2, 'D');
INSERT INTO "DELIVERY"
VALUES(SEQ_DELIVERY_NO.NEXTVAL, SYSDATE, 2, 'D');
-- (주문번호2) 연관 테이블 샘플 데이터 삽입 완료

-- (주문번호 3) 주문 ORDER 테이블 샘플 데이터 삽입 3
-- 4번 회원(유저삼)이 2번 패키지(1주/5팩)를 주문했을 경우 주문한 메뉴 테이블, 주문한 메뉴별 옵션 테이블, 배송테이블까지 INSERT
INSERT INTO "ORDER"
VALUES(SEQ_ORDER_NO.NEXTVAL, DEFAULT, NULL, 49500, DEFAULT, '유저삼', '01033331234', '04540,,서울시 중구 남대문로 120,,2층', 4, 2);

-- (주문번호 3) 주문한 메뉴 테이블 insert 2번 패키지 1, 2, 3, 4, 5번 샐러드를 선택
INSERT INTO "ORDER_MENU"
VALUES(SEQ_ORDER_MENU_NO.NEXTVAL, 3, 1);
INSERT INTO "ORDER_MENU"
VALUES(SEQ_ORDER_MENU_NO.NEXTVAL, 3, 2);
INSERT INTO "ORDER_MENU"
VALUES(SEQ_ORDER_MENU_NO.NEXTVAL, 3, 3);
INSERT INTO "ORDER_MENU"
VALUES(SEQ_ORDER_MENU_NO.NEXTVAL, 3, 4);
INSERT INTO "ORDER_MENU"
VALUES(SEQ_ORDER_MENU_NO.NEXTVAL, 3, 5);

-- (주문번호3) 주문한 메뉴 중 1, 2, 3, 4번째 샐러드(메뉴번호1, 2, 3, 4)는 옵션X

-- (주문번호3) 주문한 메뉴 중 5번째 샐러드(메뉴번호5)에 3번(M) 옵션 2개 선택
INSERT INTO "ORDER_MENU_OPTION" VALUES(11, 3, 2);

-- (주문번호3) 가격 계산
SELECT
   ((SELECT MENU_PRICE FROM MENU WHERE MENU_NO=1)+
   (SELECT MENU_PRICE FROM MENU WHERE MENU_NO=2)+
   (SELECT MENU_PRICE FROM MENU WHERE MENU_NO=3)+
   (SELECT MENU_PRICE FROM MENU WHERE MENU_NO=4)+
   (SELECT (MENU_PRICE+(SELECT OPTION_PRICE*2 FROM "OPTION" WHERE OPTION_NO=3)
   ) MENU_PRICE FROM MENU WHERE MENU_NO=5))
 ORDER_PRICE
FROM DUAL;

-- (주문번호3) 배송 DELIVERY 테이블 INSERT (리뷰작성용 샘플이라 배송일 SYSDATE, 배송완료로 입력)
INSERT INTO "DELIVERY"
VALUES(SEQ_DELIVERY_NO.NEXTVAL, SYSDATE, 3, 'D');
-- (주문번호3) 연관 테이블 샘플 데이터 삽입 완료


-- 장바구니 관련 샘플 데이터 삽입

-- (장바구니번호1) 장바구니 CART 테이블 샘플 데이터 삽입 1
-- 5번회원(유저사)이 1번 패키지(1주/3팩)를 장바구니에 담았을 경우 장바구니에 담은 메뉴 테이블, 장바구니 메뉴별 옵션 테이블까지 INSERT
INSERT INTO "CART"
VALUES(SEQ_CART_NO.NEXTVAL, 5, 1);

-- (장바구니번호1) 장바구니에 담은 메뉴 테이블 INSERT 1번패키지 4, 5, 6번 샐러드 선택
INSERT INTO "CART_MENU"
VALUES(SEQ_CART_MENU_NO.NEXTVAL, 1, 4);
INSERT INTO "CART_MENU"
VALUES(SEQ_CART_MENU_NO.NEXTVAL, 1, 5);
INSERT INTO "CART_MENU"
VALUES(SEQ_CART_MENU_NO.NEXTVAL, 1, 6);

-- (장바구니번호1) 장바구니에 담은 메뉴 중 1번째 샐러드(메뉴번호4)에 1번(M), 9번(S), 15번(T) 옵션 각 1개, 2개, 3개씩 선택
INSERT INTO "CART_MENU_OPTION" VALUES(1, 1, 1);
INSERT INTO "CART_MENU_OPTION" VALUES(1, 9, 2);
INSERT INTO "CART_MENU_OPTION" VALUES(1, 15, 3);

-- (장바구니번호1) 장바구니에 담은 메뉴 중 2번째 샐러드(메뉴번호5)에 2번(M), 10번(S), 16번(T) 옵션 각 1개씩 선택
INSERT INTO "CART_MENU_OPTION" VALUES(2, 2, 1);
INSERT INTO "CART_MENU_OPTION" VALUES(2, 10, 1);
INSERT INTO "CART_MENU_OPTION" VALUES(2, 16, 1);

-- (장바구니번호1) 장바구니에 담은 메뉴 중 3번째 샐러드(메뉴번호6)는 옵션 선택X
-- (장바구니번호1) 연관 테이블 샘플 데이터 삽입 완료

-- (장바구니번호2) 장바구니 CART 테이블 샘플 데이터 삽입 2
-- 6번회원(유저오)이 4번 패키지(2주/3팩)를 장바구니에 담았을 경우 장바구니에 담은 메뉴 테이블, 장바구니 메뉴별 옵션 테이블까지 INSERT
INSERT INTO "CART"
VALUES(SEQ_CART_NO.NEXTVAL, 6, 4);


-- (장바구니번호2) 장바구니에 담은 메뉴 테이블 INSERT 4번 패키지 7, 8, 9번 샐러드를 선택
INSERT INTO "CART_MENU"
VALUES(SEQ_CART_MENU_NO.NEXTVAL, 2, 7);
INSERT INTO "CART_MENU"
VALUES(SEQ_CART_MENU_NO.NEXTVAL, 2, 8);
INSERT INTO "CART_MENU"
VALUES(SEQ_CART_MENU_NO.NEXTVAL, 2, 9);

-- (장바구니번호2) 장바구니에 담은 메뉴 중 1번째 샐러드(메뉴번호7)는 옵션X

-- (장바구니번호2) 장바구니에 담은 메뉴 중 2번째 샐러드(메뉴번호8)에 14번(S) 옵션 1개 선택
INSERT INTO "CART_MENU_OPTION" VALUES(5, 14, 1);

-- (장바구니번호2) 장바구니에 담은 메뉴 중 3번째 샐러드(메뉴번호9)에 18번(T) 옵션 1개 선택
INSERT INTO "CART_MENU_OPTION" VALUES(6, 18, 1);

-- (장바구니번호2) 연관 테이블 샘플 데이터 삽입 완료


-- (장바구니번호3) 장바구니 CART 테이블 샘플 데이터 삽입 3
-- 7번회원(유저육)이 2번 패키지(1주/5팩)를 장바구니에 담았을 경우 장바구니에 담은 메뉴 테이블, 장바구니 메뉴별 옵션 테이블까지 INSERT
INSERT INTO "CART"
VALUES(SEQ_CART_NO.NEXTVAL, 7, 2);

-- (장바구니번호3) 장바구니에 담은 메뉴 테이블 INSERT 2번 패키지 1, 2, 3, 4, 5번 샐러드를 선택
INSERT INTO "CART_MENU"
VALUES(SEQ_CART_MENU_NO.NEXTVAL, 3, 1);
INSERT INTO "CART_MENU"
VALUES(SEQ_CART_MENU_NO.NEXTVAL, 3, 2);
INSERT INTO "CART_MENU"
VALUES(SEQ_CART_MENU_NO.NEXTVAL, 3, 3);
INSERT INTO "CART_MENU"
VALUES(SEQ_CART_MENU_NO.NEXTVAL, 3, 4);
INSERT INTO "CART_MENU"
VALUES(SEQ_CART_MENU_NO.NEXTVAL, 3, 5);

-- (장바구니번호3) 장바구니에 담은 메뉴 중 1, 2, 3, 4번째 샐러드(메뉴번호1, 2, 3, 4)는 옵션X

-- (장바구니번호3) 장바구니에 담은 메뉴 중 5번째 샐러드(메뉴번호5)에 3번(M) 옵션 2개 선택
INSERT INTO "CART_MENU_OPTION" VALUES(11, 3, 2);
-- (장바구니번호3) 연관 테이블 샘플 데이터 삽입 완료

-- 리뷰 기능 관련 테이블 INSERT (주문한 메뉴 번호 1~11)
-- 2번 회원이 주문한 메뉴 3개(주문한 메뉴 번호 1~3)
INSERT INTO "REVIEW"
VALUES(SEQ_REVIEW_NO.NEXTVAL, 5, '샐러드 맛있어요 하하하', DEFAULT, DEFAULT, 2, 1);
INSERT INTO "REVIEW"
VALUES(SEQ_REVIEW_NO.NEXTVAL, 4, '샐러드 맛있어요 하하하', DEFAULT, DEFAULT, 2, 2);
INSERT INTO "REVIEW"
VALUES(SEQ_REVIEW_NO.NEXTVAL, 3, '샐러드 맛있어요 하하하', DEFAULT, DEFAULT, 2, 3);
-- 3번 회원이 주문한 메뉴 3개(주문한 메뉴 번호 4~6)
INSERT INTO "REVIEW"
VALUES(SEQ_REVIEW_NO.NEXTVAL, 5, '샐러드 맛있어요 호호호', DEFAULT, DEFAULT, 3, 4);
INSERT INTO "REVIEW"
VALUES(SEQ_REVIEW_NO.NEXTVAL, 4, '샐러드 맛있어요 호호호', DEFAULT, DEFAULT, 3, 5);
INSERT INTO "REVIEW"
VALUES(SEQ_REVIEW_NO.NEXTVAL, 3, '샐러드 맛있어요 호호호', DEFAULT, DEFAULT, 3, 6);
-- 4번 회원이 주문한 메뉴 5개(주문한 메뉴 번호 7~11)
INSERT INTO "REVIEW"
VALUES(SEQ_REVIEW_NO.NEXTVAL, 5, '샐러드 맛있어요 하하..', DEFAULT, DEFAULT, 4, 7);
INSERT INTO "REVIEW"
VALUES(SEQ_REVIEW_NO.NEXTVAL, 4, '샐러드 맛있어요 하하..', DEFAULT, DEFAULT, 4, 8);
INSERT INTO "REVIEW"
VALUES(SEQ_REVIEW_NO.NEXTVAL, 3, '샐러드 맛있어요 하하..', DEFAULT, DEFAULT, 4, 9);
INSERT INTO "REVIEW"
VALUES(SEQ_REVIEW_NO.NEXTVAL, 2, '샐러드 맛있어요 하하..', DEFAULT, DEFAULT, 4, 10);
INSERT INTO "REVIEW"
VALUES(SEQ_REVIEW_NO.NEXTVAL, 1, '샐러드 맛있어요 하하..', DEFAULT, DEFAULT, 4, 11);

-- 리뷰 이미지 샘플 데이터 삽입(썸네일용 IMG_ORDER 0 하나씩만 삽입)
INSERT INTO "REVIEW_IMG"
VALUES(SEQ_REVIEW_IMG_NO.NEXTVAL, '/resources/images/review/', 'reviewImg.png', 'reviewImg.png', 0, 1);
INSERT INTO "REVIEW_IMG"
VALUES(SEQ_REVIEW_IMG_NO.NEXTVAL, '/resources/images/review/', 'reviewImg.png', 'reviewImg.png', 0, 2);
INSERT INTO "REVIEW_IMG"
VALUES(SEQ_REVIEW_IMG_NO.NEXTVAL, '/resources/images/review/', 'reviewImg.png', 'reviewImg.png', 0, 3);
INSERT INTO "REVIEW_IMG"
VALUES(SEQ_REVIEW_IMG_NO.NEXTVAL, '/resources/images/review/', 'reviewImg.png', 'reviewImg.png', 0, 4);
INSERT INTO "REVIEW_IMG"
VALUES(SEQ_REVIEW_IMG_NO.NEXTVAL, '/resources/images/review/', 'reviewImg.png', 'reviewImg.png', 0, 5);
INSERT INTO "REVIEW_IMG"
VALUES(SEQ_REVIEW_IMG_NO.NEXTVAL, '/resources/images/review/', 'reviewImg.png', 'reviewImg.png', 0, 6);
INSERT INTO "REVIEW_IMG"
VALUES(SEQ_REVIEW_IMG_NO.NEXTVAL, '/resources/images/review/', 'reviewImg.png', 'reviewImg.png', 0, 7);
INSERT INTO "REVIEW_IMG"
VALUES(SEQ_REVIEW_IMG_NO.NEXTVAL, '/resources/images/review/', 'reviewImg.png', 'reviewImg.png', 0, 8);
INSERT INTO "REVIEW_IMG"
VALUES(SEQ_REVIEW_IMG_NO.NEXTVAL, '/resources/images/review/', 'reviewImg.png', 'reviewImg.png', 0, 9);
INSERT INTO "REVIEW_IMG"
VALUES(SEQ_REVIEW_IMG_NO.NEXTVAL, '/resources/images/review/', 'reviewImg.png', 'reviewImg.png', 0, 10);
INSERT INTO "REVIEW_IMG"
VALUES(SEQ_REVIEW_IMG_NO.NEXTVAL, '/resources/images/review/', 'reviewImg.png', 'reviewImg.png', 0, 11);

-- 비번 암호화 pass!
UPDATE MEMBER SET MEMBER_PW ='$2a$10$Ib31oDRifsqCREhr1YDV..Zw5Paq0vNXDAJq28f1gvJ4PN3aRhokK';

-- 리뷰 좋아요
INSERT INTO "LIKE" VALUES (1, 1);
INSERT INTO "LIKE" VALUES (1, 2);
INSERT INTO "LIKE" VALUES (1, 3);
INSERT INTO "LIKE" VALUES (1, 4);
INSERT INTO "LIKE" VALUES (1, 5);
INSERT INTO "LIKE" VALUES (11, 1);
INSERT INTO "LIKE" VALUES (11, 2);
INSERT INTO "LIKE" VALUES (11, 3);
