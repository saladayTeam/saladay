document.getElementById('menu-calorie');
document.getElementById('menu-calorie');

const select = document.getElementsByClassName("select");

// 칼로리 총합
let total = 0;

for(let sel of select){
    // select박스 선택됐을 때
    sel.addEventListener("change", e=>{
        if(document.querySelector(".empty-text") != null){
            document.querySelector(".empty-text").remove();
        }

        // 선택된 select의 value값(칼로리) 가져오기
        let selectMenuCal = e.target.value;
        
        // 더해줌
        total += Number(selectMenuCal);
        document.querySelector("#totalCal").innerText = total;

        // 메뉴 이름 가져와서 텍스트로 넣어주기
        let selectMenuName;
        for(let option of e.target.children){
            if(option.selected){
                selectMenuName = option.innerText;
                break;
            }
        }

        // 선택된 메뉴+칼로리값 넣어줄 div 생성
        const selectContainer = document.createElement("div");
        selectContainer.classList.add("select-container");

        // 메뉴명
        const menuName = document.createElement("div");
        menuName.classList.add("menu-name");
        menuName.innerText = selectMenuName;

        // 칼로리
        const menuCalorie = document.createElement("div");
        menuCalorie.classList.add("menu-calorie");
        menuCalorie.innerText = `(${selectMenuCal} Kcal)`;

        // 삭제 버튼
        const deleteBtn = document.createElement("div");
        deleteBtn.classList.add("delete-btn");

        // --------------------------------------
        // 삭제버튼 이벤트
        deleteBtn.addEventListener("click", e=>{
            // 선택된 메뉴의 텍스트
            const aaa = e.target.previousElementSibling.innerText;
            // 칼로리
            const temp = /[0-9]+[.\d]*/.exec(aaa);
            total -= Number(temp[0]);
            document.querySelector("#totalCal").innerText = total;
            e.target.parentElement.remove();

            if(total == 0){
                emptyFn();
            }
        })
        // --------------------------------------


        // 휴지통 이미지
        const img = document.createElement("img");
        img.setAttribute("src", "/resources/images/icon/쓰레기.png");
        deleteBtn.append(img);

        // 조립
        selectContainer.append(menuName, menuCalorie, deleteBtn);
        document.querySelector(".empty").append(selectContainer);

        
    })
}

// 선택한 메뉴 없을 때 함수
function emptyFn(){
    document.querySelector(".empty").innerHTML = "<div class='empty-text'>선택된 메뉴, 토핑, 소스가 없습니다.</div>";
}

// 페이지 로딩 시 함수 호출
emptyFn();