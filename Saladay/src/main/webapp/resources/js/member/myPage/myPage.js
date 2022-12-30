


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


// URL주소가 맨 뒤가 ""일 때 class 추가 
if(lastURL == "menuList") {
    document.getElementById("type1").classList.add("checked");
    document.getElementById("type2").classList.remove("checked");
    document.getElementById("type3").classList.remove("checked");
    document.getElementById("type4").classList.remove("checked");

    document.getElementById("a1").classList.add("checked2");
    document.getElementById("a2").classList.remove("checked2");
    document.getElementById("a3").classList.remove("checked2");
    document.getElementById("a4").classList.remove("checked2");
}
if(lastURL == "mainTopping") {
    document.getElementById("type1").classList.remove("checked");
    document.getElementById("type2").classList.add("checked");
    document.getElementById("type3").classList.remove("checked");
    document.getElementById("type4").classList.remove("checked");

    document.getElementById("a1").classList.remove("checked2");
    document.getElementById("a2").classList.add("checked2");
    document.getElementById("a3").classList.remove("checked2");
    document.getElementById("a4").classList.remove("checked2");
}

if(lastURL == "subTopping") {
    document.getElementById("type1").classList.remove("checked");
    document.getElementById("type2").classList.remove("checked");
    document.getElementById("type3").classList.add("checked");
    document.getElementById("type4").classList.remove("checked");

    document.getElementById("a1").classList.remove("checked2");
    document.getElementById("a2").classList.remove("checked2");
    document.getElementById("a3").classList.add("checked2");
    document.getElementById("a4").classList.remove("checked2");
}

if(lastURL == "sourceList") {
    document.getElementById("type1").classList.remove("checked");
    document.getElementById("type2").classList.remove("checked");
    document.getElementById("type3").classList.remove("checked");
    document.getElementById("type4").classList.add("checked");

    document.getElementById("a1").classList.remove("checked2");
    document.getElementById("a2").classList.remove("checked2");
    document.getElementById("a3").classList.remove("checked2");
    document.getElementById("a4").classList.add("checked2");
}