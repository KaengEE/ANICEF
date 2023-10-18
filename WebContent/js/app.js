// 네브바 자바스크립트
const toggleBtn = document.querySelector(".navbar_toggleBtn");
const menu = document.querySelector(".navbar_menu");
const icon = document.querySelector(".navbar_icons");

// 토글 버튼 클릭 시 active 클래스가 없으면 적용 , 다시 클릭하면 사라짐
toggleBtn.addEventListener("click", () => {
	menu.classList.toggle("active");
	icon.classList.toggle("active");
});

// 메인화면 스크롤박스 자바스크립트

const boxes = document.querySelectorAll(".box");
//윈도우 창에서 스크롤하면 => checkBoxes 함수 실행
window.addEventListener("scroll", checkBoxes);

function checkBoxes() {
	//윈도우 창의 아래쪽 px를 약간 높게(박수를 보여주거나 사라지는 트리거 포인트)
	//개발자도구에서 window.innerHeight 콘솔 검색하면 높이 나옴
	const triggerBottom = (window.innerHeight / 5) * 4; //창의 높이의 5분의 4지점

	boxes.forEach((box) => {
		//모든 박스에 상단 높이
		const boxTop = box.getBoundingClientRect().top;
		//박스높이 < 트리거포인트 => 박스 보이기(박스에 클래스show 달기)
		if (boxTop < triggerBottom) {
			box.classList.add("show");
		} else {
			box.classList.remove("show");
		}
	});
}
//처음 시작시 실행
checkBoxes();




// 로그인 화면
const loginTitle = document.querySelector(".login_title");

function user_login() {
	loginTitle.innerText = "로그인";
}

function admin_login() {
	loginTitle.innerText = "관리자 로그인";
}
