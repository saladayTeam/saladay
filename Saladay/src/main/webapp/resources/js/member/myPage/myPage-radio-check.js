


//URL주소가 맨 뒤가 ""일 때 radio 버튼 체크
let URL3 = window.location.href;
let splitURL3 = URL3.split("?");
let split2URL3 = splitURL3[0].split("/");
let lastURL3 = split2URL3[split2URL3.length - 1];

if(lastURL3 == "info") {
    document.getElementById("myPageType1").checked = true;
}

if(lastURL3 == "myPageChangePw"){
    document.getElementById("myPageType2").checked = true;
}

if(lastURL3 == "selectMyOrder"){
    document.getElementById("myPageType3").checked = true;
}

if(lastURL3 == "selectCancelOrder"){
    document.getElementById("myPageType4").checked = true;
}

if(lastURL3 == "selectMyReview"){
    document.getElementById("myPageType5").checked = true;
}

if(lastURL3 == "secession"){
    document.getElementById("myPageType6").checked = true;
}


