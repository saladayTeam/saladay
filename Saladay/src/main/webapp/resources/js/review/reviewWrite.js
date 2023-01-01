const drawStar = (target) => {
    document.querySelector(".rw-star span").style.width = `${target.value * 20}%`;
    console.log(target.value);
}