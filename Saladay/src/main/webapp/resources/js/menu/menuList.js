const option = document.getElementsByClassName("option-name");

// option[0].addEventListener("click", ()=>{
//     console.log("호잇");
//     option[0].style.backgroundColor="#17633d";
//     option[0].style.color="#ddd";
// })
// option[1].addEventListener("click", ()=>{
//     console.log("호잇");
//     option[1].style.backgroundColor="#17633d";
//     option[1].style.color="#ddd";
// })
// option[2].addEventListener("click", ()=>{
//     console.log("호잇");
//     option[2].style.backgroundColor="#17633d";
//     option[2].style.color="#ddd";
// })
// option[3].addEventListener("click", ()=>{
//     console.log("호잇");
//     option[3].style.backgroundColor="#17633d";
//     option[3].style.color="#ddd";
// })

let URL = window.location.href;
let splitURL = URL.split("/");
let lastURL = splitURL[splitURL.length - 1];
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