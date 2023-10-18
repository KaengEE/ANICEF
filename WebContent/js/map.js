
let infowindow;
let markers = [];

window.initMap = function() {
	const map = new google.maps.Map(document.getElementById("map"), {
		center: { lat: 37.5400456, lng: 126.9921017 },
		zoom: 8,
	});

	infowindow = new google.maps.InfoWindow();

	const local = [
		{ label: "1", name: "서울센터", lat: 37.618928, lng: 127.103668 },
		{ label: "2", name: "경기센터", lat: 37.266983, lng: 127.027116 },
		{ label: "3", name: "강원센터", lat: 37.772007, lng: 127.895537 },
		{ label: "4", name: "남부센터", lat: 35.181249, lng: 129.071876 },
	];

	const bounds = new google.maps.LatLngBounds();

	local.forEach(({ label, name, lat, lng }) => {
		const marker = new google.maps.Marker({
			position: { lat, lng },
			label,
			map,
		});

		bounds.extend(marker.position);

		markers.push(marker);

		marker.addListener("click", () => {
			map.setZoom(12);
			map.panTo(marker.position);
			infowindow.setContent(name);
			infowindow.open(map, marker);
		});
	});

	// 초기에 모든 마커가 보이도록 설정
	map.fitBounds(bounds);

	// 각 li 요소에 대한 이벤트 핸들러를 추가
	const locationList = document.getElementById("locationList");
	const liElements = locationList.querySelectorAll(".mapli");

	liElements.forEach((li, index) => {
		li.addEventListener("click", () => {
		event.preventDefault(); //기본동작x
			if (index === 0) {
				// "전체보기" 클릭 시 모든 마커가 보이도록 확대
				map.fitBounds(bounds);
			} else {
				const marker = markers[index - 1];
				google.maps.event.trigger(marker, "click");
			}
		});
	});
};