let menu_tap = document.querySelector(".menu__icon");
let menu_view = document.querySelector(".menu__main");
menu_tap.addEventListener("click", function(e){
    menu_view.classList.toggle("_active");
});