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


    <main>

        <div class="signUp-header">
            <a href="/">
                <img src="/resources/images/saladay-logo.png" alt="logo" class="logo">
            </a>
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
                <span class="signUp-message" id="authKeyMessage"></span>
                
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
                        <span class="open-btn-1" onclick="open1">자세히 >></span>
                        <input type="checkbox" id="agree1">
                    </div>
                    
                    <div class="modal1 hidden1">
  					<div class="bg1"></div>
                    <div class="modal-1">
						<span class="close-btn-1" onclick="close1">✖</span>
                    	<textarea name="" id="" cols="30" >
                

1.  샐러데이에 오신 것을 환영합니다!

주식회사 샐러데이(이하 ‘샐러데이’ 라고만 합니다)는 샐러데이에서 제공하는 서비스 이용과 관련하여 여러분과 샐러데이의 권리와 의무에 관한 사항을 규정하기 위하여 본 이용약관(이하 ‘본 이용약관’이라고만 합니다)을 만들었습니다.

*PC통신, 스마트폰 앱, 무선 등을 이용하는 전자상거래에 대해서도 그 성질에 반하지 않는 한 준용합니다.

2.  용어의 정의

본 이용약관에서 사용하는 용어의 정의는 다음과 같습니다.

①  “서비스"는 구현되는 단말기(PC, 스마트폰, 태블릿 등의 각종 유무선 장치를 포함합니다)와 상관없이 이용자가 이용할 수 있는 샐러데이의 서비스 및 이와 관련한 제반 서비스를 말합니다.

②  “이용자"는 샐러데이에 접속하여 이 약관에 따라 샐러데이가 제공하는 서비스를 받는 회원 및 비회원을 말합니다.

③  “회원"은 샐러데이에 개인정보를 제공하여 회원등록을 한 사람으로서, 샐러데이가 제공하는 서비스를 계속적으로 이용하거나 이용할 수 있는 자를 말합니다.

④  “비회원"은 회원에 가입하지 않고 샐러데이가 제공하는 서비스를 이용하는 자를 말합니다.

⑤  “아이디(ID)“는 회원 식별과 서비스 이용을 위하여 회원이 정하고 샐러데이가 승인하는 이메일 주소를 말합니다.

⑥  “비밀번호"는 회원이 부여 받은 “아이디"와 일치되는 회원임을 확인하고 비밀보호를 위해 회원 자신이 정한 문자 또는 숫자의 조합을 말합니다.

⑦  “게시물"은 “이용자"가 서비스를 이용함에 있어 샐러데이가 운영하는 홈페이지에 게시한 부호ㆍ문자ㆍ음성ㆍ음향ㆍ화상ㆍ동영상 등의 정보 형태의 글, 사진, 동영상 및 각종 파일과 링크 등을 말합니다.

⑧  “포인트”란 샐러데이가 제공하는 서비스에서만 재화 등을 구입하고 그 대가를 지급하는데 사용할 수 있는 전자적 증표 또는 그 증표에 관한 정보를 말합니다.

⑨  “정기배송”이란 샐러데이가 정하는 일정 기간 동안 일정한 수량의 재화를 주기적으로 배송하는 서비스를 말합니다.

⑩  “프코스팟 배송”이란 배송 당일 아침 샐러데이가 정하는 시간 이전에 대금을 결제하는 경우, 해당 프코스팟 배송시간에 최대한 맞추어 지정 장소로 재화를 무료로 배송하는 서비스를 말합니다.

⑪  “새벽배송”이란 배송 전일 오후 샐러데이가 정하는 시간 이전에 대금을 결제하는 경우, 배송 당일(결제 다음날) 새벽 샐러데이가 정하는 시간 이전에 이용자가 정하는 장소로 재화를 배송하는 서비스를 말합니다.

⑫  “퀵배송”이란 배송 당일 아침 샐러데이가 정하는 시간 이전에 대금을 결제하는 경우, 이용자가 정하는 장소로 점심시간에 맞추어 재화를 배송하는 서비스를 말합니다.

⑬  “GS25 프코스팟 배송”이란 지정된 GS25 내 비치된 BOX25로 샐러데이가 정하는 시간 이전에 대금을 결제하는 경우엔 당일 배송 또는 익일 배송되며 배송시간에 최대한 맞추어 재화를 무료로 배송하는 서비스를 말합니다.

⑭  “프코스팟 신청”이란 특정 장소를 프코스팟 배송의 배송지로 지정하기 위하여 이용자가 샐러데이가 정하는 방법에 따라 신청하는 것을 말합니다.

3.  약관의 명시와 개정

본 이용약관은 여러분이 쉽게 알아볼 수 있도록 게시되며, 샐러데이는 본 이용약관에 개정이 있는 경우 사전에 이를 여러분에게 고지하겠습니다.

①  샐러데이는 이 약관의 내용을 이용자가 쉽게 알 수 있도록 서비스 초기 화면에 게시합니다. 다만, 약관의 내용은 이용자가 연결화면을 통하여 볼 수 있도록 합니다.

②  샐러데이는 전자상거래 등에서의 소비자 보호에 관한 법률, 약관의 규제에 관한 법률, 전자문서 및 전자거래 기본법, 전자금융거래법, 전자서명법, 정보통신망 이용촉진 및 정보 보호 등에 관한 법률, 방문판매 등에 관한 법률, 소비자 기본법 등 관련 법을 위배하지 않는 범위 내에서 이 약관을 개정할 수 있습니다

③  샐러데이가 약관을 개정할 경우에는 적용일자 및 개정사유를 명시하여 샐러데이 서비스 홈페이지를 통하여 적용일자 7일 이전부터 적용일자 전일까지 공지합니다.

④  샐러데이가 약관을 개정할 경우에는 그 개정약관은 적용일자 이후에 체결되는 계약에만 제공되고 그 이전에 이미 체결된 계약에 대해서는 개정 전 약관이 그대로 적용됩니다.

⑤  샐러데이가 전항에 따라 개정약관을 공지하면서 회원에게 7일 이내에 의사표시를 하지 않으면 의사표시가 표명된 것으로 본다는 뜻을 공지 또는 개별 통지하였음에도 불구하고 회원이 명시적으로 거부의 의사표시를 하지 아니한 경우, 회원이 개정약관에 동의한 것으로 봅니다.

⑥  회원이 개정약관 적용에 동의하지 않는 경우 샐러데이는 개정약관의 내용을 적용할 수 없으며, 이 경우 회원은 이용계약을 해지할 수 있습니다. 다만, 기존 약관을 적용할 수 없는 특별한 사정이 있는 경우에는 샐러데이도 이용계약을 해지할 수 있습니다.

4.  회원 가입

샐러데이 서비스 회원가입은 여러분이 본 이용약관의 내용에 동의하여 회원 가입 신청을 하고 샐러데이가 승인함으로써 이루어집니다.

①  샐러데이는 회원가입 신청에 대해 승낙함을 원칙으로 합니다. 다만, 샐러데이는 다음 각 호에 해당하는 신청에 대하여는 승낙을 하지 않거나 사후 회원 자격을 박탈할 수 있습니다.

1.	가입 신청자가 이 약관에 의하여 이전에 회원자격을 상실한 적이 있는 경우, 단 샐러데이의 회원 재가입 승낙을 얻은 경우에는 예외로 함.	
2.	허위의 정보를 기재하거나, 샐러데이가 제시하는 내용을 기재하지 않은 경우
3.	이용자의 귀책사유로 인하여 승인이 불가능하거나 기타 규정한 제반 사항을 위반하며 신청하는 경우	
4.	만 14세 미만인 자
5.	샐러데이의 운영과 관련하여 근거 없는 사실 또는 허위의 사실을 적시하거나 유포하여 샐러데이의 명예를 실추시키거나 샐러데이의 신뢰성을 해하는 경우
6.	샐러데이의 이용과정에서 직원에게 폭언, 협박 또는 음란한 언행, 이에 준하는 행동으로 샐러데이의 운영을 방해하는 경우
7.	샐러데이를 통해 구입한 상품 또는 용역에 특별한 하자가 없는데도 불구하고 일부 사용 후 상습적인 취소/전부 또는 일부 반품, 이의 제기 등으로 회사의 업무를 방해하는 경우
8.	샐러데이가 본인 확인 절차를 실시할 경우 본인 확인이 되지 않거나 본인이 아님이 확인된 경우
9.	이미 가입된 샐러데이의 회원의 개인정보(이름, 전화번호, 주소 등)와 동일한 경우
10.	부정한 용도 또는 영리를 추구할 목적으로 서비스를 이용하는 경우
11.	동일/유사한 아이디, 전화번호, 주소 등의 회원정보를 통하여 부정한 사용을 하는 것으로 의심되는 경우
12.	샐러데이로부터 서비스 제한, 회원 자격 정지 조치 등을 받은 회원이 그 조치기간 중에 이용계약을 임의해지하고 재이용신청을 하는 경우
13.	무단으로 샐러데이의 재화, 용역, 정보를 수집하거나 외부에 제출, 게시, 이용하여 샐러데이의 저작권, 상표권 등 지식재산권을 침해하는 경우
14.	이름, 주소, 전화번호 등 회원정보를 종합하여 실질적으로 동일인으로 인정되는 기존 회원이 다른 ID로 회원가입 또는 중복가입한 경우

②  회원이 제1항에 해당하는 경우, 샐러데이는 회원에게 제공한 혜택(적립금, 쿠폰 등)을 회수하거나 서비스 이용 제한(배송 취소 등)의 조치를 취할 수 있습니다.

③  샐러데이는 회원 가입신청에 있어 전문기관을 통한 실명확인 및 본인인증을 요청할 수 있습니다.

④  샐러데이는 서비스 관련 설비의 여유가 없거나, 기술상 또는 업무상 문제가 있는 경우에는 승낙을 유보할 수 있습니다.

⑤  샐러데이가 회원가입 신청을 승낙하지 아니하거나 유보한 경우, 샐러데이는 이를 신청자에게 알릴 의무를 지지 아니합니다.

⑥  회원 가입 시기는 샐러데이가 신청 절차 상에서 회원가입을 신청한 자에게 가입완료를 표시한 시점으로 합니다.

5.  “아이디”와 “비밀번호”의 관리

“아이디”와 “비밀번호”의 관리 의무는 여러분께 있습니다.

①  회원의 “아이디"와 “비밀번호"에 관한 관리책임은 회원에게 있으며, 이를 제3자가 이용하도록 하여서는 안 됩니다.

②  샐러데이는 개인정보 유출 우려가 있거나, 반사회적이거나 미풍양속에 어긋나거나 샐러데이 운영자로 오인하게 할 우려가 있는 경우, 회원의 “아이디"의 이용을 제한할 수 있습니다.

③  회원은 “아이디” 및 “비밀번호"가 도용되거나 제3자가 사용하고 있음을 인지한 경우에는 이를 즉시 샐러데이에 통지하고 샐러데이의 안내에 따라야 합니다.

④  회원이 “아이디” 및 “비밀번호"가 도용되거나 제3자가 사용하고 있음을 인지한 경우에는 해당 회원이 샐러데이에 그 사실을 통지하지 않거나, 통지한 경우에도 샐러데이의 안내에 따르지 않아 발생한 불이익에 관하여는 회원이 책임을 부담합니다.

6.  샐러데이의 서비스

샐러데이는 여러분에게 다음과 같은 서비스들을 제공합니다.

①  재화 등에 대한 정보 제공 및 구매계약 체결

②  구매계약이 체결된 재화 등의 배송 및 용역의 제공

③  위와 관련한 부대 서비스

④  기타 샐러데이가 추가 개발하거나 다른 회사와의 제휴 등을 통해 회원에게 제공하는 서비스

7.   구매신청 및 대금의 결제
이용자는 다음 각호 또는 이와 유사한 절차에 의하여 재화 구매를 신청합니다.

1.	재화 등의 검색 및 선택
2.	일반주문 또는 정기배송주문 등 주문방법 선택
3.	프코스팟 배송, GS25 프코스팟 배송, 새벽배송 또는 퀵배송 등 배송방법 선택
4.	구매할 재화 등의 선택 및 수량의 선택
5.	배송 받고 싶은 날짜 선택
6.	재화 구매 신청(바로 주문 단추 클릭)
7.	받는 사람의 성명, 전화번호, 배송지 주소 등 배송에 필요한 정보 입력, 사용할 할인 쿠폰 및 포인트 입력
8.	도착 시간 확인, 개인정보 수집·이용에 대한 내용, 배송비 등의 비용부담과 관련한 내용에 대한 확인 및 동의
9.	결제하기	


8.   결제하기

①  샐러데이에서 구매한 재화 또는 용역에 대한 대금 결제는 다음 각 호 중 샐러데이가 제공하는 방법으로 합니다.
1.	폰뱅킹, 인터넷뱅킹, 메일 뱅킹 등의 각종 계좌이체
2.	선불카드, 직불카드, 신용카드 등의 각종 카드 결제
3.	온라인 무통장입금
4.	전자화폐에 의한 결제	
5.	수령 시 대금지급	
6.	샐러데이가 지급한 포인트, 할인쿠폰에 의한 결제	
7.	샐러데이가 계약을 맺었거나 샐러데이가 인정한 상품권에 의한 결제	
8.	기타 전자적 지급 방법에 의한 대금 지급 등	

②  제1항 제2호의 방법에 의해 대금을 결제하는 경우 이용자는 샐러데이가 정하는 방법으로 결제에 필요한 정보를 입력하여 카드를 등록하여야 합니다.

1.	이용자가 입력한 카드번호 및 비밀 번호 등의 카드 정보는 샐러데이가 저장하거나 관리하지 않습니다.
2.	이용자가 구매 신청한 재화 등에 대하여 결제를 요청하면, 나이스정보통신㈜ 등 결제대행사(결제대행사는 사정에 따라 변경 가능)가 이용자가 입력한 카드 정보를 이용하여 결제 업무를 수행합니다.

③  이용자가 대금 결제와 관련하여 잘못 입력한 정보로 인해 발생하는 문제에 대한 책임은 이용자에게 있습니다.

④  샐러데이는 이용자의 결제수단에 대하여 정당한 사용권한 보유여부를 확인할 수 있으며 필요한 경우 해당 거래진행의 정지 및 소명자료의 제출을 요청할 수 있습니다.

9.  계약의 성립

①  이용자가 제7조와 같은 구매신청을 하고, 제8조와 같이 결제를 한 후, 샐러데이가 결제되었음을 확인하는 통지가 전자적으로 화면에 표시되는 방법 등으로 이용자에게 도달한 시점에 이용자와 샐러데이 사이에 재화 등의 구매 계약이 성립한 것으로 봅니다.

②  샐러데이는 다음 각 호의 사항이 확인된 경우 계약을 취소할 수 있습니다.

1.	신청 내용에 허위, 기재누락, 오기가 있는 경우	
2.	구매신청 이용자가 회원 자격이 제한, 정지 또는 상실된 회원으로 확인된 경우
3.	구매신청 이용자가 재판매의 목적으로 재화 등을 중복 구매하는 등 사이트의 거래질서를 방해하거나 방해할 우려가 있는 경우	
4.	기타 구매신청에 승낙하는 것이 샐러데이의 기술상 현저히 지장이 있다고 판단하는 경우

10.  재화등의 제공

①  샐러데이는 이용자가 제7조에 따라 구매신청을 하면서 선택한 배송 방법과 배송 받고 싶은 날짜에 재화등을 공급하여야 한다.

②  이용자가 배송 받고 싶은 날을 선택하지 아니하고 재화 등에 대한 구매신청을 한 경우에는 재화 등에 대한 대금을 결제한 날로부터 3영업일 이내에 재화등의 공급에 필요한 조치를 하여야 합니다.

③  샐러데이는 청약을 받은 재화등을 공급하기 곤란하다는 것을 알았을 때에는 지체 없이 그 사유를 이용자에게 알리고, 이용자가 재화 등에 대한 대금을 지급한 날로부터 3영업일 이내에 환급하거나 환급에 필요한 조치를 하여야 한다.

11.  환급

①  샐러데이는 이용자가 품절 등의 사유로 구매신청한 재화 등을 인도 또는 제공하기 곤란하다는 것을 알았을 때에는 지체없이 그 사유를 이용자에게 통지하고, 사전에 재화 등의 대금을 받은 경우에는 대금을 받은 날로부터 3 영업일 이내에 환급하거나 환급에 필요한 조치를 취합니다.

②  제1항에 따라 선지급식 통신판매에서 재화등의 대금을 환급하거나 환급에 필요한 조치를 하여야 하는 경우에는 제13조 제1항부터 제3항까지의 규정을 준용한다.

12.  청약철회 등

①  샐러데이와 재화 등의 구매에 관한 계약을 체결한 이용자는 제7조에 따라 구매신청한 날로부터 7일 이내에 해당 계약에 관한 청약철회등을 할 수 있습니다. 그 외의 경우의 청약철회에 관하여는 「전자상거래 등에서의 소비자보호에 관한 법률」의 규정에 따릅니다.

②  이용자는 다음 각 호의 어느 하나에 해당하는 경우에는 샐러데이의 의사에 반하여 제1항에 따른 청약철회등을 할 수 없습니다. 다만, 샐러데이가 본 조 제3항의 조치를 하지 아니한 경우에는 본 항 제2호 및 제3호의 규정에 해당하는 경우에도 청약철회등을 할 수 있습니다.


1.	이용자에게 책임이 있는 사유로 재화등이 멸실되거나 훼손된 경우. 다만, 재화등의 내용을 확인하기 위하여 포장 등을 훼손한 경우는 제외한다.
2.	소비자의 사용 또는 일부 소비로 재화등의 가치가 현저히 감소한 경우	
3.	시간이 지나 다시 판매하기 곤란할 정도로 재화등의 가치가 현저히 감소한 경우
4.	그 밖에 샐러데이에게 회복할 수 없는 중대한 피해가 예상되는 경우로서 사전에 해당 거래에 대하여 별도로 그 사실을 고지하고 이용자에게 서면(전자문서를 포함한다)에 의한 동의를 받은 경우

③  샐러데이는 제2항 제2호 및 제3호의 규정에 따라 청약철회가 불가능한 재화등의 경우에는 그 사실을 재화등의 포장이나 그 밖에 이용자가 쉽게 알 수 있는 곳에 명확하게 표시하는 등의 방법으로 청약철회등의 권리 행사가 방해받지 아니하도록 조치하여야 합니다.

④  이용자는 제1항 및 제2항에도 불구하고 재화등의 내용이 표시·광고의 내용과 다르거나 계약내용과 다르게 이행된 경우에는 그 재화등을 공급받은 날로부터 3개월 이내, 그 사실을 안 날 또는 알 수 있었던 날로부터 30일 이내에 청약철회등을 할 수 있습니다.

⑤  이용자가 제1항 또는 제4항에 따른 청약철회등을 서면으로 하는 경우에는 그 의사표시가 적힌 서면을 발송한 날에 효력이 발생합니다.

13.  청약철회 등의 효과

①  이용자는 제12조에 따라 청약철회등을 한 경우에는 이미 공급받은 재화등을 반환하여야 합니다.

②  샐러데이는 재화를 공급한 경우에는 제1항에 따라 재화를 반환받은 날, 재화등을 공급하지 않은 경우에는 제12조 제1항 또는 제4항에 따라 청약철회등을 한 날로부터 3영업일 이내에 이미 지급받은 재화등의 대금을 환급합니다. 이 경우 샐러데이가 이용자에게 재화 등의 대금 환급을 일방적으로 지연한 때에는 그 지연기간에 대하여 「전자상거래 등에서의 소비자보호에 관한 법률 시행령」 제21조의3에서 정하는 이율을 곱하여 산정한 지연이자를 지급합니다.

③  샐러데이는 제1항 및 제2항에 따라 재화 등의 대금을 환급할 때 이용자가 신용카드 등의 결제수단으로 재화 등의 대금을 지급한 경우에는 지체 없이 해당 결제수단을 제공한 사업자(이하 “결제업자”라고 합니다)에게 재화 등의 대금 청구를 정지하거나 취소하도록 요청합니다. 다만, 샐러데이가 결제업자로부터 대금을 이미 받은 때에는 지체 없이 그 대금을 결제업자에게 환급하고, 그 사실을 이용자에게 알립니다.

④  제12조 제1항에 따른 청약철회등의 경우 공급받은 재화등의 반환에 필요한 비용은 이용자가 부담하며, 샐러데이는 소비자에게 청약철회등을 이유로 위약금이나 손해배상을 청구하지 않습니다.

⑤  제12조 제4항에 따른 청약철회 등의 경우 재화 등의 반환에 필요한 비용은 샐러데이가 부담합니다.

14.  포인트

①  샐러데이는 포인트를 발행하여 무상으로 지급하고 임의로 기간을 정하여 소멸시키거나 발행, 지급량을 조정할 수 있습니다.

②  회원이 상품 구매나 이벤트 등을 통하여 샐러데이로부터 제공받은 포인트는 샐러데이가 정한 기간에 샐러데이가 정한 방법으로만 이용할 수 있습니다.

③  포인트는 만료기간이 빠른 순서로 사용되며, 유효기간이 만료되거나 이용계약이 종료되면 적립된 포인트 중 미 사용된 포인트는 소멸됩니다.

④  포인트는 샐러데이가 별도로 명시한 경우를 제외하고는 타인에게 양도할 수 없으며, 유상으로 거래하거나 현금을 전환할 수 없으며, 부정한 목적이나 용도로 사용할 수 없습니다.

⑤  이용자가 부정한 방법으로 포인트를 획득하거나 경우 부정한 목적이나 용도로 포인트를 사용하는 경우 샐러데이는 포인트의 사용을 제한 또는 회수하거나 포인트를 사용한 구매신청을 취소하거나 회원자격을 정지 또는 박탈하거나 형사 고발 등 필요한 조치를 취할 수 있습니다.

⑥  제1항부터 제5항에도 불구하고, 포인트의 사용 조건에 관한 사항은 샐러데이 정책에 따라 달라질 수 있습니다.

15. 할인쿠폰

①  할인쿠폰은 회원에게 무상으로 발행되는 것으로 샐러데이는 회원이 할인쿠폰을 사이트에서 상품 구매 시 적용할 수 있도록 그 사용대상, 사용방법, 사용기간, 구매가 할인액 등을 정할 수 있습니다. 할인 쿠폰의 종류 또는 내용은 샐러데이의 정책에 따라 달라질 수 있습니다.

②  샐러데이는 할인쿠폰의 사용대상, 사용방법, 사용기간, 할인금액 등을 사이트에 별도로 표시하거나 통지합니다.

③  할인쿠폰은 현금으로 환급될 수 없으며, 할인쿠폰의 사용기간이 만료되거나 구매 취소 시 또는 이용계약이 종료되면 소멸됩니다.

④  회원은 할인쿠폰을 제 3자에게 또는 다른 아이디로 양도할 수 없으며, 유상으로 거래하거나 현금으로 전환할 수 없습니다.

⑤  샐러데이는 회원이 샐러데이가 승인하지 않은 방법으로 할인쿠폰을 획득하거나 부정한 목적이나 용도로 할인쿠폰을 사용하는 경우 할인쿠폰의 사용을 제한하거나 할인쿠폰을 사용한 구매신청을 취소하거나 회원자격을 정지할 수 있습니다.

⑥  회원 탈퇴 시 샐러데이로부터 발급받은 할인쿠폰 중 미사용한 할인쿠폰은 즉시 소멸되며, 탈퇴 후 재가입하더라도 소멸된 할인쿠폰은 복구되지 아니합니다.

16.  샐러데이의 의무

샐러데이는 여러분에게 서비스를 제공함에 있어서 양질의 서비스를 제공하기 위해 노력하고 관련 법령을 준수할 것임을 약속드립니다.

①  샐러데이는 관련법과 이 약관이 금지하거나 미풍양속에 반하는 행위를 하지 않으며, 계속적이고 안정적으로 서비스를 제공하기 위하여 노력합니다.

②  샐러데이는 이용자가 안전하게 서비스를 이용할 수 있도록 개인정보(신용정보 포함)보호를 위해 보안시스템을 갖추고 개인정보처리방침을 공시하고 준수합니다.

③ 샐러데이는 관련 법령을 준수하고, 회원을 위한 고객센터를 운영하면서 각종 민원 해소를 위해 노력합니다.

17. 이용자의 의무

여러분께서는 샐러데이의 서비스를 이용함에 있어서 관련 법령과 다음과 같은 의무사항을 준수하셔야 합니다.

①  이용자는 샐러데이의 서비스를 이용함에 있어서 다음 행위를 하여서는 안됩니다.


1.	허위내용의 등록, 타인의 개인정보, 신용 및 금융정보, 연락처, 아이디 도용 및 임의사용
2.	샐러데이가 게시한 정보를 변경하거나 고의로 변경을 시도하는 행위	
3.	샐러데이가 정한 정보 이외의 정보(컴퓨터 프로그램 등) 등의 송신 또는 게시
4.	제3자의 지식재산권을 침해하거나, 명예를 훼손하거나 업무를 방해하거나, 공서양속에 반하는 등의 불법 게시물을 샐러데이 게시판에 게시하는 행위	
5.	샐러데이의 동의 없이 영리를 목적으로 서비스를 사용하는 행위	
6.	샐러데이가 이용자를 위해서 시행하는 각종 이벤트 서비스(할인쿠폰 등)을 샐러데이의 서비스정책에 맞지 않도록 사용하는 행위
7.	현금융통을 위하여 신용카드를 사용하거나, 금융감독원 기타 수사기관의 제재를 받을 수 있는 거래 요청, 샐러데이의 정당한 관련서류 제출 요구에 응하지 않는 행위	
8.	샐러데이의 고객불만사항 처리절차 중 통상적인 범위를 벗어나는 욕설, 성적 비하 등 비인격적 언행 표출 및 위력과시 등 공포감을 유발하는 행위	
9.	“정보통신망법"을 위반한 불법통신 및 해킹, 악성프로그램의 배포, 접속권한 초과행위	
10.	기타 불법적이거나 부당한 행위	

②  이용자는 관계 법령, 이 약관의 규정, 이용안내 및 서비스와 관련하여 공지한 주의사항, 샐러데이가 통지하는 사항을 준수하여야 하며, 기타 샐러데이의 업무에 방해되는 행위를 하여서는 안 됩니다.

③  샐러데이는 이용자가 위와 같은 이용자의 의무를 이행하지 않은 경우 해당 이용자에게 의무 불이행 사실을 고지하면서 샐러데이와 이용자 사이의 서비스 이용계약 체결을 거부하거나 이미 체결된 서비스 이용계약을 일방적으로 해지할 수 있고, 해당 이용자의 회원 자격을 박탈할 수 있습니다.

18.  부정이용의 금지

①  샐러데이는 다음 각호에 해당하는 경우를 부정 이용 행위로 봅니다.

1.	타인의 개인정보, 금융정보를 불법으로 취득하거나 본인의 동의 없이 이용하여 재화 등을 구매한 일체의 행위

2.	샐러데이가 제공하는 이벤트를 통해 부정한 방법으로 참여하여 포인트를 적립하고 이용한 경우	

3.	기타 다음과 같은 행위 등을 반복하여 샐러데이의 건전한 운영을 해하거나 샐러데이의 서비스 운영을 고의로 방해하는 경우
	
i.    샐러데이의 운영에 관련하여 허위 사실을 적시하거나 유포하여 샐러데이의 명예를 실추시키거나 샐러데이의 신뢰성을 해하는 경우

ii.     샐러데이의 운영 과정에서 폭언, 음란한 언행, 협박, 인과 관계가 입증되지 않는 피해에 대한 보상 (포인트, 현금, 재화 등) 및 요구 등으로 업무 환경을 심각히 해하는 경우

iii.    샐러데이를 통해 구입한 재화 또는 서비스에 특별한 하자가 없음에도 불구하고, 일부 이용 후 일부 또는 전부의 반품을 지속적으로 요구하는 경우

iv.     임시 이메일 서비스(일회용 이메일 서비스, 시스템에 의한 계정 생성 포함)를 통하여 가입하여 서비스를 이용하는 경우

v.     샐러데이 또는 샐러데이 임직원이나 운영진을 사칭하여 타인을 속이거나 이득을 취하는 등 피해와 혼란을 주는 경우


②  샐러데이는 전항에 따른 부정 이용자가 발견 되었을 경우, 다음 각호에 따른 조치를 취할 수 있습니다.

1.	[1차 발견 시] 샐러데이는 해당 위반 사실을 부정 이용자에게 경고합니다. 샐러데이는 경고와 함께 이용제한 ID로 등록되어 서비스 이용을 정지시킬 수 있으며 부정 이용을 통해 취득한 포인트 등의 이용을 중지할 수 있습니다. 재화의 경우, 회수 조치 또는 배상을 요구할 수 있습니다.

2.	[2차 발견 시] 샐러데이는 위반 내용을 부정 이용자에게 고지하고, 필요시 법적인 대응을 할 수 있습니다. 샐러데이는 회원에게 30일 간의 소명기간을 부여하고, 회원이 소명기간 내 정당한 사유를 제시하지 못할 경우 회원 등록을 말소시키고, 서비스 이용을 제한할 수 있습니다.	

③  이용자는 제2항의 조치에 이의가 있는 경우, 샐러데이 고객지원팀에 이에 관하여 소명할 수 있으며 소명 결과에 따라 샐러데이 서비스 이용에 관한 별도의 조치를 받을 수 있습니다.

19.  지식재산권 등의 귀속

샐러데이의 서비스 홈페이지 및 샐러데이가 작성한 컨텐츠에 대한 저작권 등의 지식재산권과 무형적 권리는 샐러데이에 귀속합니다.

①  샐러데이의 서비스 홈페이지에 표시되는 컨텐츠와 코드(code), 샐러데이가 작성하여 홈페이지에 게시한 글, 그림 및 동영상 등의 게시물(이하 ‘컨텐츠등’이라고만 합니다)에 대한 지식재산권 등 무형적 권리는 샐러데이에 귀속합니다.

②  샐러데이는 서비스와 관련하여 이용자에게 샐러데이가 정한 이용조건에 따라 샐러데이가 부여한 계정과 홈페이지에 게재된 컨텐츠 등을 이용할 수 있는 권리만을 부여하며, 이용자는 샐러데이에게 지식재산권 등이 귀속된 컨텐츠등을 샐러데이의 사전 허락 없이 복제, 전송, 배포, 출판, 방송, 수정 및 기타의 방법으로 이용하거나 제3자가 이용하게 하여서는 아니되며, 해당 컨텐츠등에 대한 2차적 저작물 작성, 링크의 게재 등을 하여서는 아니됩니다.

③  이용자가 서비스 내에 게시하는 “게시물"은 검색결과 내지 서비스 및 관련 프로모션 등에 노출될 수 있으며, 해당 노출을 위해 필요한 범위 내에서는 일부 수정, 복제, 편집되어 게시될 수 있습니다. 이 경우 샐러데이는 저작권법 및 관련 법규를 준수하며, 이용자는 언제든지 고객센터 등을 통해 해당 게시물에 대해 삭제, 검색결과 제외, 비공개 등의 조치 요청을 할 수 있습니다.

20.  불법정보 유통의 금지

이용자는 샐러데이 서비스를 이용하면서 다음 각호와 같은 타인의 권리를 침해하거나 위법한 정보를 유통시키거나 게시하여서는 아니되며, 이에 대한 책임은 이용자가 부담합니다.


1.	음란한 부호ㆍ문언ㆍ음향ㆍ화상 또는 영상을 배포ㆍ판매ㆍ임대하거나 공공연하게 전시하는 내용의 정보
2.	사람을 비방할 목적으로 공공연하게 사실이나 거짓의 사실을 드러내어 타인의 명예를 훼손하는 내용의 정보	
3.	공포심이나 불안감을 유발하는 부호ㆍ문언ㆍ음향ㆍ화상 또는 영상을 반복적으로 상대방에게 도달하도록 하는 내용의 정보	
4.	정당한 사유 없이 정보통신시스템, 데이터 또는 프로그램 등을 훼손ㆍ멸실ㆍ변경ㆍ위조하거나 그 운용을 방해하는 내용의 정보	
5.	「청소년 보호법」에 따른 청소년유해매체물로서 상대방의 연령 확인, 표시의무 등 법령에 따른 의무를 이행하지 아니하고 영리를 목적으로 제공하는 내용의 정보	
6.	법령에 따라 금지되는 사행행위에 해당하는 내용의 정보	
7.	「정보통신망 이용촉진 및 정보보호 등에 관한 법률」 또는 개인정보 보호에 관한 법령을 위반하여 개인정보를 거래하는 내용의 정보	
8.	총포ㆍ화약류(생명ㆍ신체에 위해를 끼칠 수 있는 폭발력을 가진 물건을 포함한다)를 제조할 수 있는 방법이나 설계도 등의 정보
9.	법령에 따라 분류된 비밀 등 국가기밀을 누설하는 내용의 정보	
10.	「국가보안법」에서 금지하는 행위를 수행하는 내용의 정보	
11.	제3자의 저작권, 상표권 등 지식재산권을 침해하는 내용의 정보
12.	그 밖에 범죄를 목적으로 하거나 교사(敎唆) 또는 방조하는 내용의 정보	
13.	샐러데이 또는 제3자의 업무를 방해하는 내용의 정보	
14.	샐러데이로부터 사전 승인받지 아니한 상업 광고 및 판촉 내용의 정보	
15.	기타 공서양속에 반하는 내용의 정보	

21.  이용자의 불법 게시물에 대한 임시조치

이용자는 샐러데이에게 이용자의 권리를 침해하는 게시물에 대하여 게시중단 또는 삭제 등을 요청할 수 있으며, 샐러데이는 이에 적절한 조치를 취하여야 합니다.

①  이용자의 게시물이 사생활 침해나 명예훼손 등 타인의 권리를 침해하거나 저작권을 침해하는 게시물인 경우, 그 침해를 받은 자는 샐러데이에게 침해 사실을 소명하여 그 게시물의 삭제 또는 반박내용의 게재(이하 ‘삭제등’이라고 합니다)를 요청할 수 있습니다.

②  샐러데이는 제1항에 따른 해당 게시물의 삭제등을 요청받으면 지체 없이 삭제·임시조치 등의 필요한 조치를 하고 즉시 신청인 및 해당 게시물의 게시자에게 알립니다. 이 경우 샐러데이는 필요한 조치를 한 사실을 해당 게시판에 공시하는 등의 방법으로 이용자가 알 수 있도록 하여야 합니다.

③  샐러데이는 제1항에 따른 게시물의 삭제요청에도 불구하고 권리의 침해 여부를 판단하기 어렵거나 이해당사자 간에 다툼이 예상되는 경우에는 해당 정보에 대한 접근을 임시적으로 차단하는 조치(이하 ‘임시조치’라고 합니다)를 할 수 있습니다. 이 경우 임시조치의 기간은 30일 이내로 샐러데이가 정할 수 있습니다.

④  샐러데이는 전항에 따른 권리자의 요청이 없는 경우라도 어떠한 게시물이 권리침해가 있거나 법령에 위반되는 위법한 게시물임이 명백하고, 이를 구체적으로 인식하였을 때는 해당 게시물의 게시중단 등의 임시조치를 취할 수 있습니다.

⑤  샐러데이는 샐러데이 서비스와 관련한 게시물의 삭제, 차단 및 임시조치의 절차와 관련하여 정하지 않은 사항은 정보통신망 이용촉진 및 정보보호 등에 관한 법률, 저작권법 등 관련 법령과 규정한 절차를 따릅니다.

22.  회원의 탈퇴

이용자는 언제든지 회원 탈퇴를 신청하여 탈퇴할 수 있습니다.

①  회원은 언제든지 마이페이지에서의 회원탈퇴 기능 이용 및 고객센터에 요청하는 등의 방법으로 회원 탈퇴를 신청할 수 있으며, 샐러데이는 관련 법령 등이 정하는 바에 따라 이를 즉시 처리하여야 합니다.

②  샐러데이는 회원이 탈퇴할 경우, 관련 법령 및 개인정보취급방침에 따라 샐러데이가 회원정보를 보유하는 경우를 제외하고는 탈퇴 즉시 회원의 정보를 삭제합니다.

23.  정보의 고지 방법

①  샐러데이가 이용자에게 어떠한 정보를 고지를 하는 경우 이메일 전송, 문자메시지 전송, 모바일 메신저, 모바일 앱 푸쉬알림을 통한 메시지 발송 등의 전자적 방법을 이용할 수 있습니다.

②  샐러데이가 이용자 전체에 대한 고지를 하는 경우는 7일 이상 샐러데이의 홈페이지 게시판 또는 팝업창을 통해 게시함으로써 제1항의 통지에 갈음할 수 있습니다.

24.  마케팅 및 광고성 정보의 제공

샐러데이는 이용자의 동의를 얻어 광고 등의 다양한 정보를 이용자에게 제공할 수 있습니다.

①  샐러데이는 이용자의 동의를 얻어 이용자가 서비스 이용 중 필요하다고 인정되는 다양한 정보를 공지사항이나 전자우편, 휴대전화 문자 메시지나 모사전송, 모바일 앱 푸쉬알림 등의 방법으로 이용자에게 제공할 수 있습니다.

②  이용자는 관련 법령에 따른 거래관련 정보 및 고객문의 등에 대한 답변 등을 제외하고 광고성 정보에 관하여는 언제든지 이메일, 휴대전화 문자 메시지, 모바일 앱 푸쉬알림 등에 대한 수신 거절을 할 수 있습니다.

③  샐러데이는 광고성 정보를 전송하려고 하는 경우로서 법령이 허용하는 경우 외에는 이용자의 사전 동의를 받아서 전송합니다. 광고성 정보가 아닌 계약관계 유지 및 안내에 필요한 이용자의 거래관련 정보 및 고객문의 등에 대한 회신에 있어서는 동의를 필요로 하지 않습니다.

④  샐러데이가 광고성 정보를 전송하는 경우, 광고가 게재된 이메일 등을 수신한 이용자는 이메일 등에 안내된 수신거절 방법을 이용하여 광고성 정보 수신을 거절할 수 있습니다. 광고성 정보가 아닌 계약관계 유지 및 안내에 필요한 이용자의 거래관련 정보 및 고객문의 등에 대한 회신에 있어서는 동의를 필요로 하지 않습니다.

25.  면책 조항

샐러데이는 다음과 같은 경우에 대해 책임을 부담하지 않습니다.

①  샐러데이는 천재지변 또는 이에 준하는 불가항력으로 인하여 서비스를 제공할 수 없는 경우에는 서비스 제공에 관한 책임을 지지 않습니다.

②  샐러데이는 천재지변, 컴퓨터 등 정보통신설비의 보수, 점검, 교체, 고장 및 통신두절 등의 사유가 발생한 경우에는 서비스 제공을 일시적으로 중단할 수 있으며, 이와 관련하여 고의 또는 중대한 과실이 없는 한 어떠한 책임도 부담하지 않습니다.

③  샐러데이는 이용자의 귀책사유로 인한 서비스 이용의 장애에 대하여 책임을 지지 않습니다.

④  샐러데이는 재화의 재료정보를 표기함으로써 이용자의 알러지 등 개인적인 사정에 의하여 이용자에게 발생한 피해에 대해 책임을 부담하지 않습니다.

⑤  샐러데이는 이용자가 서비스를 이용하여 기대하는 수익을 상실한 것에 대하여 책임을 지지 않으며, 그 밖의 서비스를 통하여 얻은 자료로 인한 손해에 관하여 책임을 지지 않습니다.

⑥  샐러데이는 이용자가 게재한 정보, 자료, 사실의 신뢰도, 정확성 등 내용에 관하여 책임을 지지 않습니다.

⑦  샐러데이는 이용자의 귀책사유로 서비스 이용에 장애가 발생하는 것에 대하여 책임을 부담하지 않습니다.

⑧  샐러데이는 회원 간 또는 회원과 비회원 간에 샐러데이 서비스를 매개로 하여 거래등을 하여 발생한 사안에 관해서는 책임을 지지 않습니다

26.  분쟁해결 및 약관의 해석

①  샐러데이는 이용자가 제기하는 정당한 의견이나 불만을 반영하고 그 피해를 보상 처리하기 위하여 서비스팀을 설치하여 운영합니다.

②  샐러데이는 이용자로부터 제기되는 불만사항과 이와 관련한 의견에 대해 우선적으로 처리합니다. 다만, 신속하게 처리하기 어려운 경우에는 이용자에게 그 사유와 함께 처리 일정을 알려드립니다.

③  본 이용약관의 규정이 대한민국 강행법규와 상충하는 경우에는 그 강행법규에 따르고, 이로 인해 본 이용약관 중 일부 조항의 효력이 정지되는 경우에도 다른 조항의 효력에는 영향을 미치지 않습니다.

27.  재판권 및 준거법

샐러데이와 이용자간 분쟁에 대하여는 대한민국의 법률을 적용하며, 샐러데이와 이용자 사이에 분쟁이 발생하여 소송이 제기되는 경우에는 서울중앙지방법원을 관할법원으로 합니다.

부  칙
1.	이 약관은 2022년 12월 19일부터 시행합니다.	
2.	종전의 약관은 이 약관으로 대체됩니다.


            

		            	</textarea>
		            
		            </div>
		            </div>
		       

                    <div class="agree-label">
                        <label for="agree2">개인정보 수집 및 이용 동의<span class="required">(필수)</span></label>
                        <span class="open-btn-2" onclick="open2">자세히 >></span>
                        <input type="checkbox" id="agree2">
                    </div>
                    
                    <div class="modal2 hidden2">
  					<div class="bg2"></div>
                    <div class="modal-2">
						<span class="close-btn-2" onclick="close2">✖</span>
			        	<textarea name="" id="" cols="30">
샐러데이 개인정보 처리방침

주식회사 샐러데이(이하 '샐러데이'라고만 합니다)는 샐러데이가 제공하는 서비스의 기획부터 종료까지 「정보통신망 이용촉진 및 정보보호 등에 관한 법률」(이하 ‘정보통신망법’이라고만 합니다) 등 국내의 개인정보 보호 관련 법령을 철저히 준수합니다. 샐러데이는 이용자의 개인정보 보호 및 권익을 보호하고 개인정보와 관련한 이용자의 고충을 원활하게 처리할 수 있도록 다음과 같은 처리방침을 두고 있습니다.

본 개인정보처리방침의 목차는 아래와 같습니다.

1.	개인정보처리방침의 의의

2.	수집하는 개인정보의 항목과 수집ㆍ이용 목적 (필수 안내사항)

3.	개인정보의 수집 방법 (필수 안내사항)

4.	개인정보의 제공 및 위탁 (필수 안내사항)

5.	개인정보의 보유 기간 (필수 안내사항)

6.	개인정보의 파기 (필수 안내사항)

7.	정보주체와 법정대리인의 권리·의무 및 그 행사 방법 (필수 안내사항)

8.	개인정보의 안정성 확보조치에 관한 사항

9.	개인정보 자동 수집 장치의 설치·운영 및 그 거부에 관한 사항 (필수 안내사항)

10.	개인정보 보호책임자 및 담당자 안내 (필수 안내사항)

11.	본 개인정보처리방침의 적용 범위

12.	개인정보처리방침 변경 전 고지 의무



1. 개인정보처리방침의 의의

샐러데이는 본 개인정보처리방침을 정보통신망법을 기준으로 작성하되, 샐러데이가 제공하는 서비스 내에서의 이용자 개인정보 처리 현황을 최대한 알기 쉽고 상세하게 설명하기 위해 노력하였습니다.

이는 쉬운 용어를 사용한 개인정보처리방침 작성 원칙인 ‘Plain Language Privacy Policy(쉬운 용어를 사용한 개인정보처리방침)’와 2019. 6. 25일 시행된 정보통신망법 제22조 제3항을 반영한 것입니다.

개인정보처리방침은 다음과 같은 중요한 의미를 가지고 있습니다.

•     샐러데이가 어떤 정보를 수집하고, 수집한 정보를 어떻게 사용하며, 필요에 따라 누구와 이를 공유(‘위탁 또는 제공’)하며, 이용목적을 달성한 정보를 언제·어떻게 파기하는지 등의 정보를 투명하게 제공합니다.

•     정보주체로서 이용자는 자신의 개인정보에 대해 어떤 권리를 가지고 있으며, 이를 어떤 방법과 절차로 행사할 수 있는지를 알려드립니다. 또한, 부모 등 법정대리인이 만 14세 미만 아동의 개인정보 보호를 위해 어떤 권리를 행사할 수 있는지도 함께 안내합니다.

•     개인정보 침해사고가 발생하는 경우, 추가적인 피해를 예방하고 이미 발생한 피해를 복구하기 위해 누구에게 연락하여 어떤 도움을 받을 수 있는지 알려드립니다.

•     샐러데이와 샐러데이의 서비스 이용자 간에 개인정보와 관련한 권리 및 의무 관계를 규정함으로써 이용자의 개인정보 자기결정권을 보장합니다.

2. 수집하는 개인정보의 항목과 수집ㆍ이용 목적

샐러데이는 다음과 같이 개인정보 항목을 수집·이용하고 있습니다.

* 수집항목 중 필수항목이란 서비스의 본질적 기능을 수행하기 위해 반드시 필요한 정보이며, 선택항목이란 서비스 이용 자체에 영향을 미치지는 않으나 이용자에게 부가적인 가치를 제공하기 위해 추가로 수집하는 정보입니다.

 

•     홈페이지 회원가입 시 수집하는 개인 정보

¬  수집하는 개인정보 항목

-     회원 가입 시 이름, 이메일주소, 휴대전화번호를 필수항목으로 수집합니다.

-     회사명, 성별, 생년월일을 선택항목으로 수집합니다.

-     이용자가 만 14세 미만 아동인 경우에는 법정대리인의 이름, 이메일 주소, 휴대전화번호를 추가로 수집합니다.

¬  수집·이용 목적

-     회원 가입 의사의 확인, 이용자 식별, 회원탈퇴 의사 확인 등 회원 관리를 위하여 개인정보를 수집∙이용합니다.

-     재화 및 서비스의 제공 등 회원과의 계약상 의무 이행을 위하여 개인정보를 수집·이용합니다.

-     법령 및 샐러데이 이용약관을 위반하는 회원에 대한 이용 제한 조치, 부정 이용 행위를 포함하여 서비스의 원활한 운영에 지장을 주는 행위에 대한 방지 및 제재, 계정도용 및 부정거래 방지, 약관 개정 등의 고지사항 전달, 분쟁조정을 위한 기록 보존, 민원처리 등 이용자 보호 및 서비스 운영을 위하여 개인정보를 이용합니다.

-     민원 등 사무처리를 위하여 개인정보가 이용될 수 있습니다.

-     이용자의 동의를 얻는 경우, 이벤트 정보 및 참여기회 제공, 광고성 정보 제공 등 홍보, 마케팅 및 프로모션 목적으로 개인정보가 이용될 수 있습니다.

-     이용자가 만 14세 미만 아동인 경우 수집하는 법정대리인의 정보는 이용자의 개인정보 수집 및 이용에 대한 동의를 받기 위하여 수집·이용합니다.

•     재화 주문 과정에서 수집하는 개인정보

¬  수집하는 개인정보 항목

-     이용자가 상품을 주문하는 경우 샐러데이는 이용자의 배송지 주소를 필수항목으로 수집합니다.

-     이용자가 프코스팟 배송으로 상품을 주문하는 경우에는 샐러데이는 프코스팟으로 등록된 배송지 주소(픽업 장소 포함) 중 이용자가 선택한 배송지 주소(픽업 장소 포함)를 필수항목으로 수집합니다.

¬  수집·이용 목적

-     회원과의 계약상 의무 이행으로써 재화를 배송하기 위하여 개인정보를 수집·이용합니다.

•     대금 결제와 관련하여 수집하는 개인정보

¬  수집하는 개인정보 항목

-     개인카드 또는 법인카드의 카드번호, 유효기간, 비밀번호 앞 두 자리, 생년월일을 필수항목으로 수집합니다.

¬  수집·이용 목적

-     이용자가 구매신청 후 재화에 대한 대금 결제를 위하여 개인정보를 수집·이용합니다.

•     고객센터에서의 민원사무 처리와 과정에서 수집하는 개인정보

¬  수집하는 개인정보 항목

-     전화고객센터를 이용하여 민원을 하시는 경우 선택항목으로 발신전화번호가 수집·이용될 수 있습니다.

-     전화고객센터를 이용하여 민원을 하시는 경우 선택항목으로 발신전화번호가 수집·이용될 수 있습니다.

¬  수집·이용 목적

-     민원인의 신원 확인, 민원사항 확인, 민원 처리결과 안내, 분쟁 조정을 위한 기록 보존 등을 위하여 개인정보를 수집·이용합니다.

•     서비스 이용과정에서 IP 주소, 쿠키, 서비스 이용 기록, 기기정보, 위치정보 등이 생성되어 수집될 수 있습니다.

3. 개인정보 수집의 방법

샐러데이는 이용자가 서비스 회원 가입 및 서비스 이용 과정에서 개인정보 수집에 대해 동의하고 직접 정보를 입력함으로써 해당 개인정보를 수집합니다.

샐러데이의 고객센터를 통한 상담 과정에서 웹페이지, 모바일 앱, 이메일, 팩스, 전화 등을 통해 이용자의 개인정보가 수집될 수 있습니다.

샐러데이와 제휴한 외부 기업이나 단체로부터 개인정보를 제공받을 수 있으며, 이러한 경우에는 정보통신망법에 따라 제휴사에서 이용자에게 개인정보 제공 동의 등을 받은 후에 샐러데이에 제공합니다.

이용자는 서비스 이용을 위해 이용자 외 제3자의 개인정보를 샐러데이에 제공해야 할 수 있습니다. 이용자는 해당 개인정보를 샐러데이에 제공하기 전에 샐러데이가 해당 개인정보를 본 개인정보보호처리 방침에 따라 이용한다는 점에 대해 해당 개인정보 주체로부터 동의를 받으셔야 합니다. 이용자가 샐러데이에 이용자 외의 사람의 개인정보를 제공하는 경우, 샐러데이는 이용자가 해당 개인정보 주체로부터 위와 같은 동의를 받은 것으로 간주합니다.

4. 개인정보의 제공 및 위탁

샐러데이는 원칙적으로 이용자의 동의 없이 개인정보를 외부에 제공하지 않습니다.

다만, 이용자가 외부 제휴사의 서비스를 이용하기 위하여 개인정보 제공에 동의한 경우, 그리고 관련 법령(형사소송법, 통신비밀보호법, 전기통신사업법 등)에 따라 샐러데이에 개인정보 제출 의무가 발생한 경우, 이용자의 생명이나 안전에 급박한 위험이 있어 이를 해소하기 위한 경우에 한하여 개인정보를 제공하고 있습니다.

샐러데이는 편리하고 더 나은 서비스를 제공하기 위하여 개인정보 처리 업무 중 일부를 아래와 같이 위탁하고 있으며, 위탁 받은 기관이 정보통신망법 등 관련 법령에 따라 개인정보를 안전하게 처리하도록 관리, 감독하고 있습니다.

 

샐러데이는 위탁계약 체결시 개인정보 보호법 제26조에 따라 위탁업무 수행목적 외 개인정보 처리금지, 기술적·관리적 보호조치, 재위탁 제한, 수탁자에 대한 관리·감독, 손해배상 등 책임에 관한 사항을 계약서 등 문서에 명시하고, 수탁자가 개인정보를 안전하게 처리하는지를 감독하고 있습니다.

위탁업무의 내용이나 수탁자가 변경될 경우에는 지체 없이 본 개인정보 처리방침을 통하여 공개하도록 하겠습니다.

5. 개인정보의 보유 기간

샐러데이는 이용자가 회원 탈퇴 시 부정이용 방지를 위하여 이용자의 개인정보를 30일 동안 보관 후 파기하는 것을 원칙으로 합니다.

다만, 이용자에게 개인정보 보관기간에 대해 별도의 동의를 얻은 경우, 서비스 이용에 따른 채권·채무관계 잔존 시 해당 채권․채무관계 정산 시까지 및 법령에서 일정 기간 정보 보관 의무를 부과하는 경우에는 해당 기간 동안 개인정보를 보관합니다.

관련 법령에서 일정기간 개인정보의 보관을 규정하는 경우는 아래와 같습니다.

 

6. 개인정보의 파기

개인정보 보유기간이 도래하거나 법령에서 보존의무를 부과한 개인정보가 해당 기간이 경과하는 경우 해당 개인정보를 지체 없이 파기합니다.

정보주체로부터 동의 받은 개인정보 보유기간이 경과하거나 처리목적이 달성되었음에도 불구하고 다른 법령에 따라 개인정보를 계속 보존하여야 하는 경우에는, 해당 개인정보를 별도의 데이터베이스(DB)로 옮기거나 보관장소를 달리하여 보존합니다.

개인정보 파기의 절차 및 방법은 다음과 같습니다.

가. 파기절차

샐러데이는 파기 사유가 발생한 개인정보를 선정하고, 샐러데이의 개인정보 보호책임자의 승인을 받아 개인정보를 파기합니다.

나. 파기방법

샐러데이는 전자적 파일 형태로 기록·저장된 개인정보는 기록을 재생할 수 없도록 파기하며, 종이 문서에 기록·저장된 개인정보는 분쇄기로 분쇄하거나 소각하여 파기합니다.

7. 정보주체와 법정대리인의 권리·의무 및 그 행사방법

정보주체(자신의 개인정보를 직접 제공한 이용자와 자기 자신 이외의 자로부터 개인정보가 제공된 자 포함)는 다음과 같은 권리를 행사할 수 있습니다.

이용자는 샐러데이 웹사이트의 ‘마이페이지’에서 자신의 개인정보를 조회하거나 수정할 수 있습니다.

이용자는 언제든지 ‘회원탈퇴’ 등을 통해 언제든지 개인정보의 수집·이용·제공 등의 동의를 철회할 수 있습니다.

정보주체는 샐러데이에게 정보주체의 개인정보, 개인정보의 이용현황 및 제3자 제공현황, 개인정보의 수집·이용·제공 등의 동의 현황에 대해 열람이나 제공을 요구할 수 있고, 오류가 있는 경우에는 그 정정을 요구할 수 있으며, 개인정보 처리의 정지를 요구할 수 있습니다. 샐러데이는 이러한 요구에 대해 지체 없이 필요한 조치를 취하여야 합니다.

정보주체가 만 14세 미만 아동의 경우, 법정대리인이 아동의 개인정보를 조회하거나 수정할 권리, 수집 및 이용 동의를 철회할 권리를 가집니다.

개인정보 열람 및 처리정지 요구는 개인정보보호법 제35조 제4항, 제37조 제2항에 의하여 정보주체의 권리가 제한될 수 있습니다.

다른 법령에서 그 개인정보가 수집 대상으로 명시되어 있는 경우에는 법령에서 정하는 기간 동안은 개인정보를 정정 및 삭제할 수 없습니다.

8. 개인정보의 안정성 확보조치에 관한 사항

샐러데이는 개인정보의 안정성 확보를 위해 다음과 같은 기술적·관리적 조치를 취하고 있습니다.

가. 개인정보를 안전하게 처리하기 위한 내부관리계획의 수립ㆍ시행

나. 개인정보에 대한 불법적인 접근을 차단하기 위한 침입차단시스템 등 접근 통제장치의 설치ㆍ운영

다. 접속기록의 위조ㆍ변조 방지를 위한 조치

라. 개인정보를 안전하게 저장ㆍ전송할 수 있는 암호화기술 등을 이용한 보안조치

마. 백신 소프트웨어의 설치ㆍ운영 등 컴퓨터바이러스에 의한 침해 방지조치

바. 그 밖에 개인정보의 안전성 확보를 위하여 필요한 보호조치

9. 개인정보 자동 수집 장치의 설치·운영 및 그 거부에 관한 사항

샐러데이는 이용자에게 개별적인 맞춤서비스를 제공하기 위해 이용정보를 저장하고 수시로 불러오는 ‘쿠키(cookie)’를 사용합니다.

쿠키는 웹사이트를 운영하는데 이용되는 서버(http)가 이용자의 컴퓨터 브라우저에게 보내는 소량의 정보이며 이용자들의 PC 컴퓨터내의 하드디스크에 저장되기도 합니다.

가. 쿠키의 사용목적: 이용자가 방문한 각 서비스와 웹 사이트들에 대한 방문 및 이용형태, 인기 검색어, 보안접속 여부, 등을 파악하여 이용자에게 최적화된 정보 제공을 위해 사용됩니다.

나. 쿠키의 설치∙운영 및 거부 : 웹브라우저 상단의 도구>인터넷 옵션>개인정보 메뉴의 옵션 설정을 통해 쿠키 저장을 거부 할 수 있습니다.

다. 쿠키 저장을 거부할 경우 맞춤형 서비스 이용에 어려움이 발생할 수 있습니다.

10. 모바일 앱 사용 시 광고 식별자(ADID/IDFA) 수집

회사는 이용자의 ADID/IDFA를 수집할 수 있습니다. ADID/IDFA란 모바일 앱 이용자의 광고 식별 값으로서, 사용자의 맞춤 서비스 제공이나 더 나은 환경의 광고를 제공하기 위한 측정을 위해 수집될 수 있습니다.

[거부방법]

- Android : 설정 -> 구글(구글설정) -> 광고 -> 광고 맞춤설정 선택 해제

- IOS : 설정 -> 개인 정보 보호 -> 광고 -> 광고 추적 제한

11. 온라인 맞춤형 광고 서비스

회사는 다음과 같이 온라인 맞춤형 광고 사업자가 행태 정보를 수집하도록 허용하고 있습니다.

1)   행태정보를 수집 및 처리하는 광고 사업자 : 구글, 페이스북, Naver, 카카오

2)   행태정보 수집 방법 : 이용자가 당사 웹사이트 방문하거나 앱을 실행할 때 자동 수집 및 전송

12. 개인정보 보호책임자 및 담당자 안내

샐러데이는 이용자의 개인정보 관련 문의사항 및 불만 처리 등을 위하여 아래와 같이 개인정보 보호책임자 및 담당자를 지정하고 있습니다.
개인정보보호 책임자 
이름 : 정지윤 직위 : 대표이사 메일 help@saladay.co.kr

개인정보보호 담당자
이름 : 이용하 직위 : 사원 메일 help@saladay.co.kr



기타 개인정보 침해에 대한 신고나 상담이 필요한 경우에 아래 기관에 문의 가능합니다.

•     개인정보침해신고센터 (privacy.kisa.or.kr / 국번없이 118)

•     개인정보 분쟁조정위원회(www.kopico.go.kr/ 1833-6972)

•     대검찰청 사이버수사과 (www.spo.go.kr / 국번없이 1301)

•     경찰청 사이버안전국 (cyberbureau.police.go.kr / 국번없이 182)

13. 본 개인정보처리방침의 적용 범위

본 개인정보처리방침은 샐러데이의 서비스인 ‘샐러데이(saladay.co.kr)’ 및 관련 제반 서비스에 적용되며, 다른 브랜드로 제공되는 서비스에 대해서는 별개의 개인정보처리방침이 적용될 수 있습니다.

14. 개인정보처리방침 변경 전 고지 의무

이 개인정보처리방침은 시행일로부터 적용되며, 법령 및 방침에 따른 변경내용의 추가, 삭제 및 정정이 있는 경우에는 변경사항의 시행 7일 전부터 공지사항을 통하여 고지할 것입니다.

공고일자: 2022년 12월 19일

시행일자: 2022년 12월 19일



            
			        </textarea>
			        
			        </div>
                    </div>
     

                </div>

                <button id="signUp-btn">가입하기</button>

            </form>
        </section>

        
    </main>
    
    
    <script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
    <script src="https://code.jquery.com/jquery-3.6.1.min.js" integrity="sha256-o88AwQnZB+VDvE9tvIXrMQaPlFFSUTR+nldQm1LuPXQ=" crossorigin="anonymous"></script>
    <script src="/resources/js/member/validate.js"></script>
    <%-- session scope 내에 message속성이 존재하는 경우 alert(JS)기능을 이용해서 처리한 메세지 내용 출력 --%>
    <c:if test="${!empty message}">
        <script> 
            alert("${message}");
        </script> 
        <c:remove var="message" />
    </c:if>
    <%--이용약관, 개인정보처리방침 모달창 --%>
    <script>
      const open1 = () => {
	  document.querySelector(".modal1").classList.remove("hidden1");
	  }
		
      const open2 = () => {
    	  document.querySelector(".modal2").classList.remove("hidden2");
      }
      
	  const close1 = () => {
	    document.querySelector(".modal1").classList.add("hidden1");
	  }
	  const close2 = () => {
		    document.querySelector(".modal2").classList.add("hidden2");
	  }
	  
	  document.querySelector(".open-btn-1").addEventListener("click", open1);
	  document.querySelector(".open-btn-2").addEventListener("click", open2);
	  document.querySelector(".close-btn-1").addEventListener("click", close1);
	  document.querySelector(".close-btn-2").addEventListener("click", close2);
	  document.querySelector(".bg1").addEventListener("click", close1);
	  document.querySelector(".bg2").addEventListener("click", close2);
	 </script>
</body>
</html>