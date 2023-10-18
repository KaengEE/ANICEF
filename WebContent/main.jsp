<%@page import="animal.Animal"%>
<%@page import="animal.AnimalDAO"%>
<%@page import="java.util.ArrayList"%>
<%@page import="info.Info"%>
<%@page import="info.InfoDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>ANICEF</title>
<!-- 폰트어썸 -->
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.1.0/css/all.min.css" />

<link rel="stylesheet" href="./css/main.css" />

<!-- 구글map api -->
<script defer
	src="https://maps.googleapis.com/maps/api/js?key=AIzaSyDSZde-PxrDwRESceiEEaCvXO0W3j5uxJs&callback=initMap"></script>
</head>
<body>
	<%
		//세션의 userID가 있으면 가져온다. 
	String userID = null; //유저ID가 null이 아니면 가져오기
	if (session.getAttribute("userID") != null) {
		userID = (String) session.getAttribute("userID");
	}
	%>
	<!-- 헤더 시작  -->
	<jsp:include page="header.jsp" />
	<!-- 헤더 종료  -->
	<!-- 메인 시작 -->
	<div class="main">
		<!-- 메인 화면 1 -->
		<div class="box main_content1">
			<div class="info">
				<h4>공지사항</h4>
				<ul class="info_list">
					<%
						InfoDAO infodao = new InfoDAO();
					ArrayList<Info> list = infodao.getInfoList();

					for (int i = 0; i < list.size(); i++) {
					%>
					<li><a
						href="userinfoview.jsp?id=<%=list.get(i).getInfo_id()%>"> <%=list.get(i).getInfo_title()%></a></li>
					<%
						}
					%>
				</ul>


			</div>
			<h2>
				ANICEF는 <br /> 안락사 없는 보호소로 <br /> 모든 동물들이 새로운 가족을 맞이 할 때 까지<br />
				안락사 없이 끝까지 케어하는 <br /> 보호소를 운영하고 있습니다. <br />
			</h2>
		</div>
		<!-- 메인 화면 2 -->
		<div class="box main_content2">
			<h3 class="main_title">보호중인 동물</h3>
			<div class="gallery">
				<%
					AnimalDAO animalDao = new AnimalDAO();
				ArrayList<Animal> list2 = animalDao.getListAll();

				for (int i = 0; i < list2.size(); i++) {
				%>
				<div>
					<a href="animalDetailPage.jsp?id=<%=list2.get(i).getId()%>">
					<img src="./images/<%=list2.get(i).getMain_image()%>" /></a>
				</div>
				<%
					}
				%>
			</div>
		</div>
		<!-- 메인 화면 3 -->
		<!-- li누르면 이동하게끔 map.js 이벤트 -->
		<div class="box main_content3">
			<h3 class="main_title2">지점 찾기</h3>
			<ul class="place_list" id="locationList">
				<li class="mapli" data-lat="37.618928" data-lng="127.103668"><a
					href="#">전체보기</a></li>
				<li class="mapli" data-lat="37.618928" data-lng="127.103668"><a
					href="#">서울/인천</a></li>
				<li class="mapli" data-lat="37.266983" data-lng="127.027116"><a
					href="#">경기</a></li>
				<li class="mapli" data-lat="37.772007" data-lng="127.895537"><a
					href="#">충청강원</a></li>
				<li class="mapli" data-lat="35.181249" data-lng="129.071876"><a
					href="#">부산/경상/전라</a></li>
			</ul>
			<div id="map" style="height: 400px; width: 500px;"></div>
		</div>

		<script src="./js/app.js"></script>
		<script>
      let infowindow;
      let markers = [];
      
      window.initMap = function () {
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
    </script>
    	<!-- 푸터 시작 -->
		<jsp:include page="footer.jsp" />
		<!-- 푸터 종료 -->
	</div>
</body>
</html>