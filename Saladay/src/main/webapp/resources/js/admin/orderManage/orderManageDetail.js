// 주문한 메뉴 목록 상세 조회
const showIcon = document.getElementById("icon");
const showArea = document.querySelector(".show-area");

if (showIcon != null) {
    showIcon.addEventListener("change", () => {
    if (showIcon.checked) {
        showArea.style.display = "block";
    } else {
        showArea.style.display = "none";
    }
    });
}