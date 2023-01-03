// 별점 검색한 경우 selected option 고정
(()=>{
    const reviewRating = document.getElementById("reviewRating").className;
    $("#reviewRating").val(reviewRating).prop('selected', true);
})();


/* 숫자에 따라 별점 표시 */
$(".1").html("&#9733; &#9734; &#9734; &#9734; &#9734;");
$(".2").html("&#9733; &#9733; &#9734; &#9734; &#9734;");
$(".3").html("&#9733; &#9733; &#9733; &#9734; &#9734;");
$(".4").html("&#9733; &#9733; &#9733; &#9733; &#9734;");
$(".5").html("&#9733; &#9733; &#9733; &#9733; &#9733;");