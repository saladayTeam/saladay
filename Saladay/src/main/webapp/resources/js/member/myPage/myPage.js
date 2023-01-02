


//URL주소가 맨 뒤가 ""일 때 radio 버튼 체크
let URL = window.location.href;
let splitURL = URL.split("/");
let lastURL = splitURL[splitURL.length - 1];

if(lastURL == "info") {
    document.getElementById("myPageType1").checked = true;
}

if(lastURL == "myPageChangePw"){
    document.getElementById("myPageType2").checked = true;
}

if(lastURL == "selectMyOrder"){
    document.getElementById("myPageType3").checked = true;
}

if(lastURL == "selectMyReview"){
    document.getElementById("myPageType4").checked = true;
}

if(lastURL == "secession"){
    document.getElementById("myPageType5").checked = true;
}


