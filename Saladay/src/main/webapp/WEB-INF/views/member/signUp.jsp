<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>


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

    <section class="signUp-box">
        <!-- 회원가입 타이틀 -->
        <div class="signUp-header">
            <img src="/resources/images/saladay-logo.png" alt="">
        </div>

        <!-- 입력영역 -->
        <form class="signUp-content" action="/member/signUp" method="POST" name="signUp-frm"  >
            
            <!-- 아이디(이메일) 입력 -->
            <div class="signUp-row">
                <label for="memberEmail">아이디(이메일)</label>
                <div class="input-area">
                    <input type="text" name="memberEmail" id="memberEmail" placeholder="아이디(이메일)"
                    maxlength="50" autocomplete="off" >
                    <button type="button" class="verify-btn">인증번호 받기</button> 
                </div>
                <span class="signUp-message">입력한 형식이 올바르지 않으니 다시 확인해주세요.</span>
            </div>
        
        
            <!-- 인증번호 입력 -->
            <div class="signUp-row verify-frm">
                <label for="verify">인증번호</label>
                <div class="input-area">
                    <input type="text" name="verify" id="verify" placeholder="인증번호 입력"
                    maxlength="6" autocomplete="off">
                    <button type="button" class="verify-btn">인증하기</button> 
                </div>
                <span class="signUp-message">인증되었습니다.</span>
            </div>
            
            <!-- 닉네임 -->
            <div class="signUp-row">
                <label for="memberNickname">닉네임</label>
                <div class="input-area">
                    <input type="text" name="memberNickname" id="memberNickname" maxlength="20" 
                    placeholder="닉네임" autocomplete="off" >
                </div>
                <span class="signUp-message">닉네임을 입력해주세요.</span>
            </div>
            
            <!-- 비밀번호 입력 -->
            <div class="signUp-row">
                <label for="input-area">비밀번호</label>
                <div class="input-area">
                    <input type="password" name="memberPw" id="memberPw" maxlength="50"
                    placeholder="비밀번호" autocomplete="off" onKeyPress="return checkCapsLock(event)">
                </div>
                <span class="signUp-message">비밀번호 형식이 올바르지 않습니다.</span>
            </div>
            
            
            <!-- 비밀번호 확인 -->
            <div class="signUp-row">   
                <label for="memberPwConfirm">비밀번호확인</label>
                <div class="input-area">
                    <input type="password" name="memberPwConfirm" id="memberPwConfirm" maxlength="50"
                    placeholder="비밀번호 확인"  autocomplete="off" onKeyPress="return checkCapsLock(event)">
                </div>
                <span class="signUp-message">비밀번호가 일치하지 않습니다.</span>
            </div>   
            
            <!-- 이름 -->
            <div class="signUp-row">
                <label for="memberName">이름</label>
                <div class="input-area">
                    <input type="text" name="memberName" id="memberName" maxlength="30" 
                    placeholder="이름" autocomplete="off" >
                </div>
                <span class="signUp-message">이름을 입력해주세요.</span>
            </div>
            
            
            <!-- 전화번호 입력 영역 -->
            <div class="signUp-row">
                <label for="memberTel">전화번호</label>
                <div class="input-area">
                    <input type="text" name="memberTel" id="memberTel" autocomplete="off"
                    placeholder="(-없이 숫자만 입력)" maxlength="11" required>
                </div>
                <span class="signUp-message"> 전화번호를 입력해주세요(-제외)</span>
            </div>
            
            
            <!-- 주소 문자열을 배열로 쪼개기 -->
            <c:set var="addr" value=""/>
            
            <!-- 주소 입력 영역 -->
            <div class="signUp-row">
                <label for="address"> 주소 </label>
            </div>
            
            <div class="address-area">
                <input type="text" name="address" id="sample6_postcode" placeholder="우편번호" 
                maxlength="6" autocomplete="off" > 
                <button type="button" onclick="sample6_execDaumPostcode()">주소검색</button>
            </div>
            
            <div class="address-area">
                <input type="text" name="address" id="sample6_address" placeholder="도로명/지명주소" 
                autocomplete="off" > 
            </div>
            
            <div class="address-area">
                <input type="text" name="address" id="sample6_detailAddress" placeholder="상세주소" 
                autocomplete="off" > 
            </div>
            
            <div class="btn">
                <button type="submit" class="signUp-btn">가입하기</button>
            </div>
        </form>   
    </section>

    
    <!-- 주소입력 -->
    <script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
    <script>
        function sample6_execDaumPostcode() {
            new daum.Postcode({
                oncomplete: function(data) {
                    // 팝업에서 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분.
                    // 각 주소의 노출 규칙에 따라 주소를 조합한다.
                    // 내려오는 변수가 값이 없는 경우엔 공백('')값을 가지므로, 이를 참고하여 분기 한다.
                    var addr = ''; // 주소 변수
                    //사용자가 선택한 주소 타입에 따라 해당 주소 값을 가져온다.
                    if (data.userSelectedType === 'R') { // 사용자가 도로명 주소를 선택했을 경우
                        addr = data.roadAddress;
                    } else { // 사용자가 지번 주소를 선택했을 경우(J)
                        addr = data.jibunAddress;
                    }
                    // 우편번호와 주소 정보를 해당 필드에 넣는다.
                    document.getElementById('sample6_postcode').value = data.zonecode;
                    document.getElementById("sample6_address").value = addr;
                    // 커서를 상세주소 필드로 이동한다.
                    document.getElementById("sample6_detailAddress").focus();
                }
            }).open();
        }
    </script>  
    <script src="https://code.jquery.com/jquery-3.6.1.min.js" integrity="sha256-o88AwQnZB+VDvE9tvIXrMQaPlFFSUTR+nldQm1LuPXQ=" crossorigin="anonymous"></script>

    <script src="/resources/js/member/signUp.js"></script>
</body>
</html>