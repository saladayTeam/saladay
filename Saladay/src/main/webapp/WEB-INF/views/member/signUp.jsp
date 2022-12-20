<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>회원가입</title>
    
    <link rel="stylesheet" href="/resources/css/member/signUp.css">
    
</head>
<body>


    <main>

        <div class="signUp-header">
            <img src="/resources/images/saladay-logo.png" alt="">
        </div>
        
        <section class="signUp-content">
            <form action="/member/signUp" method="POST" name="signUp-frm" id="signUp-frm">
                <label for="memberEmail">
                    <span class="required">*</span> 아이디(이메일)
                </label>
                <!-- 이메일 입력 영역 -->
                <div class="signUp-input-area">
                    <input type="text" name="memberEmail" id="memberEmail" placeholder="아이디(이메일)" maxlength="30" autocomplete="off">
                    <button type="button" id="getAuthKeyBtn">인증번호 받기</button>
                </div>
                <span class="signUp-message" id="memberEmailMessage">메일을 받을 수 있는 이메일을 입력해주세요.</span>
                
                <!-- 인증번호 입력 -->
                <label for="emailCheck">
                    <span class="required">*</span> 인증번호
                </label>
                <div class="signUp-input-area">
                    <input type="text" name="authKey" id="authKey" placeholder="인증번호 입력" maxlength="6" autocomplete="off">
                    <button type="button" id="checkAuthKeyBtn">인증하기</button>
                </div>
                <span class="signUp-message" id="authKeyMessage">인증되었습니다.</span><!-- / 인증번호가 일치하지 않습니다. -->
                
                <!-- 비밀번호/비밀번호 확인 입력 -->
                <label for="memberPw">
                    <span class="required">*</span> 비밀번호
                </label>
                
                <div class="signUp-input-area">
                    <input type="password" name="memberPw" id="memberPw" placeholder="비밀번호" maxlength="20"
                    autocomplete="off" onKeyPress="return checkCapsLock(event)">
                </div>
                <span class="signUp-message" id="memberPwMessage">영어, 숫자, 특수문자(!,@,#,-,_) 5 ~ 20 글자 사이로 입력해주세요.</span>

                <div class="signUp-input-area">
                    <input type="password" name="memberPwConfirm" id="memberPwConfirm" placeholder="비밀번호 확인" maxlength="20"
                    autocomplete="off" onKeyPress="return checkCapsLock(event)">
                </div>
                <span class="signUp-message" id="memberPwConfirmMessage"></span>

                <!-- 이름 입력 -->
                <label for="memberName">
                    <span class="required">*</span> 이름(실명)
                </label>
                
                <div class="signUp-input-area">
                    <input type="text" name="memberName" id="memberName" placeholder="" maxlength="5">
                </div>
                <span class="signUp-message" id="memberNameMessage">한글 2 ~ 5글자</span>


                <!-- 닉네임 입력 -->
                <label for="memberNickname">
                    <span class="required">*</span> 닉네임
                </label>
                
                <div class="signUp-input-area">
                    <input type="text" name="memberNickname" id="memberNickname" maxlength="6">
                </div>
                <span class="signUp-message" id="memberNicknameMessage">특수문자를 제외한 2 ~ 6글자</span>
                
                <!-- 전화번호 입력 -->
                <label for="memberTel">
                    <span class="required">*</span> 전화번호
                </label>
                
                <div class="signUp-input-area">
                    <input type="text" name="memberTel" id="memberTel" placeholder="(-없이 숫자만 입력)" maxlength="11">
                </div>
                <span class="signUp-message" id="memberTelMessage">휴대전화 번호 입력</span>

                <!-- 주소 입력 -->
                <label for="memberAddress">
                    주소
                </label>
                
                <div class="signUp-input-area">
                    <input type="text" name="memberAddress" id="postCode" placeholder="우편번호" maxlength="6" readonly>
                    <button type="button" id="addressSearch">검색</button>
                </div>
                <div class="signUp-input-area">
                    <input type="text" name="memberAddress" id="address" placeholder="도로명/지번 주소" readonly>
                </div>
                <div class="signUp-input-area">
                    <input type="text" name="memberAddress" id="detailAddress" placeholder="상세 주소">
                </div>

                <label for="">
                    <span class="required">*</span>약관 동의
                </label>
                <div class="signUp-input-area agree-area">
                    <div class="agree-label">
                        <label for="agree1">이용약관 동의<span class="required">(필수)</span></label>
                        <a href="/member/TermsOfService">자세히 >></a>
                        <input type="checkbox" id="agree1">
                
                    </div>

                    <div class="agree-label">
                        <label for="agree2">개인정보 수집 및 이용 동의<span class="required">(필수)</span></label>
                        <a href="/member/privacyPolicy">자세히 >></a>
                        <input type="checkbox" id="agree2">
                        
                    </div>

                </div>

                <button id="signUp-btn">가입하기</button>

            </form>
        </section>

        
    </main>
    
    
    <script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
    <script src="https://code.jquery.com/jquery-3.6.1.min.js" integrity="sha256-o88AwQnZB+VDvE9tvIXrMQaPlFFSUTR+nldQm1LuPXQ=" crossorigin="anonymous"></script>
    <!-- <script src="/resources/js/member/validate.js"></script> -->
    
</body>
</html>