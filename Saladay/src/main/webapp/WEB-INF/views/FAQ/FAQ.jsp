<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>


<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>FAQ</title>
    
    <link rel="stylesheet" href="/resources/css/main/header.css">
    <link rel="stylesheet" href="/resources/css/FAQ/FAQ.css">
    <link rel="stylesheet" href="/resources/css/main/footer.css">
    
	<script src="https://kit.fontawesome.com/72842759a7.js" crossorigin="anonymous"></script>
</head>

<body>

    <main>
        <jsp:include page="/WEB-INF/views/main/header.jsp"></jsp:include>

        
        <div class="faq-header">
            <h1 class="main-title">가장 자주 하는 질문 FAQ</h1>
        </div>



        <div class="faq-content">
            <ul class="faq" >
                <li>
                    <input type="checkbox" id="qna-1">
                    <label for="qna-1" class="question"><i class="fa-solid fa-q">&nbsp;</i>드레싱 별도 구매 가능한가요?</label>
                    <div class="answer">
                        <i class="fa-solid fa-a">&nbsp;</i>
                        <span>드레싱의 개별 구매는 불가하신 점 안내드립니다.
                        구독 결제 시 옵션 추가 구매 가능하나 별도 구매는 이루어지고 있지 않으니 양해부탁드립니다.</span>
                    </div>
                </li>

                <li>
                    <input type="checkbox" id="qna-2">
                    <label for="qna-2" class="question"><i class="fa-solid fa-q">&nbsp;</i>샐러데이의 식재료는 GMO FREE 인가요?</label>
                    <div class="answer">
                        <i class="fa-solid fa-a">&nbsp;</i>
                        <span>샐러데이의 메뉴 제조 시 사용되는 주요 식재료(채소, 드레싱, 가공육 등)는 GMO(유전자 재조합 농산물)를 원료로 사용하지 않은 안심할 수 있는 식품입니다.
                        GMO식품은 과학적으로 위해성이 입증된 적은 없으나 섭취할 경우 인체에 나쁜 영향을 미칠 수 있다는 우려가 있습니다.
                        앞으로도 믿고 드실 수 있는, 건강하고 맛있는 한 끼를 제공하는 샐러데이가 되겠습니다.</span>
                    </div>
                </li>

                <li>
                    <input type="checkbox" id="qna-3">
                    <label for="qna-3" class="question"><i class="fa-solid fa-q">&nbsp;</i>닭가슴살에 검은 입자가 보이는데 무엇인가요?</label>
                    <div class="answer">
                        <span><i class="fa-solid fa-a">&nbsp;</i></span>
                        <span>샐러데이에서 사용 중인 닭가슴살은 '샐러데이'와 'CJ제일제당'이 직접 개발한 시즈닝으로 마리네이드 후 조리되는 제품입니다.
                        문의주신, 닭가슴살에 검게 보이는 입자는 흑후추 및 향신료에 포함된 타임, 로즈마리, 레드페퍼, 오레가노 등과 같은 허브류 등이 블렌딩된 시즈닝입니다.
                        닭가슴살의 풍미와 부드러움을 더해주는 시즈닝이므로 안심하고 드셔도 된다는 점 안내드립니다.</span>
                    </div>
                </li>
                </ul>
        </div>


    </main>    
    <jsp:include page="/WEB-INF/views/main/footer.jsp"></jsp:include>
</body>
</html>