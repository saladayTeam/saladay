const deleteCart = document.getElementById("delete-cart");
deleteCart.addEventListener("click", () => {
  if (confirm("장바구니를 삭제할까요?")) {
    location.href = "/cart/delete";
  } else {
    return;
  }
});

const total = document.getElementById("total");
total.addEventListener("click", () => {
  location.href = "/order";
});
