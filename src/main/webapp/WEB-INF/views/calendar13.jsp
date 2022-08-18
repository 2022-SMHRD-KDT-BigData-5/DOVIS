<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<link href='https://unpkg.com/boxicons@2.1.2/css/boxicons.min.css'
	rel='stylesheet'>
<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<link rel="stylesheet" href="resources/css/main.css">
<link href='resources/css/calendar-so.css' rel='stylesheet'>
<!-- <script src='calendar.js'></script> -->
<script src="https://cdn.jsdelivr.net/npm/sweetalert2@10"></script>
<!-- alert -->
<script
	src="https://cdn.jsdelivr.net/npm/fullcalendar@5.2.0/main.min.js"></script>
<!-- jquery -->
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<!-- bootstrap 4 -->
<link rel="stylesheet"
	href="https://code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
<link rel="stylesheet"
	href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css">
<!-- Tmap -->
<script src="https://apis.openapi.sk.com/tmap/jsv2?version=1&appKey=l7xxad35e3d4b917425383f7678af3c51008"></script>
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js"></script>
<script
	src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js"></script>
<link href='resources/css/calendar.css' rel='stylesheet'>

<style>
	a{
	color : black;
	}
</style>
<title>DOVIS CALENDAR</title>


</head>

<body>
		<div class="sidebar">
		<div class="logo_content">
			<div class="logo">
				<i class='bx bxs-ghost bx-spin' style='color: #859bfd'></i>
				<div class="logo_name">DOVIS</div>
			</div>
			<i class='bx bx-menu' id="btn"></i>
		</div>
		<ul class="nav_list">
			<li><a href=" dovis.do"> <i class='bx bx-home-alt-2'></i> <span
					class="link_name">home</span>
			</a> <span class="tooltip">home</span></li>
			<li><a href="chat.do"> <i class='bx bx-chat'></i> <span
					class="link_name">message</span>
			</a> <span class="tooltip">message</span></li>
			<li><a href="calendar.do"> <i class='bx bx-calendar'></i> <span
					class="link_name">calendar</span>
			</a> <span class="tooltip">calendar</span></li>
			<li><a href="setting.do"> <i class='bx bx-cog'></i> <span
					class="link_name">setting</span>
			</a> <span class="tooltip">setting</span></li>
			<li class="bye"><a href="logoutcheck.do"> <i class='bx bx-exit'></i> <span
					class="link_name">logout</span>
			</a> <span class="tooltip">logout</span></li>
		</ul>
	</div>
	<div class="home_content">
		<div class="text">

			<div id='calendar'></div>

			<!-- 상세 일정 modal 추가-->
			<div class="modal" id="list_modal">
				<div class="modal_body" aria-hidden="true">
					<div class="modal_table">
						<table border="1px soild">
		                     <tr>
		                        <td colspan="2" id="calendar_title"></td>
		                     </tr>
		                     <tr>
		                        <td colspan="2" id="cate">구분</td>
		                     </tr>
		                     <tr>
		                        <td colspan="2" id="meeting_date"></td>
		                     </tr>
		                     
		                     <tr>
		                        <td>상대 정보</td>
		                        <td id="meeting_pe"></td>
		                     </tr>
		                     <tr>
		                        <td>장소</td>
		                        <td id="meeting_place"></td>
		                     </tr>
		                     <tr>
		                        <td colspan="2" height="200px" align="center" id="map_td" onload="initTmap();">
									<div id="map_div"></div>
									<input type="hidden" class="text_custom" id="searchKeyword" name="searchKeyword">
									<input type="hidden" , id="maplt" value="1111">
									<input type="hidden" , id="maplg">
								</td>
		                     </tr>
		                     <tr>
		                        <td>총 거리</td>
		                        <td id="distance"></td>
		                     </tr>
		                     <tr>
		                        <td>소요시간</td>
		                        <td id="lead_time"></td>
		                     </tr>
		                  </table>
						<button class="update">수정</button>
						<button class="update2">수정완료</button>
						<button class="delete">삭제</button>
						<button class="exit">나가기</button>
					</div>
				</div>
			</div>

			<!-- modal 추가 -->



			<div class="modal fade" id="calendarModal" tabindex="-1"
				role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
				<div class="modal-dialog" role="document">
					<div class="modal-content">
						<div class="modal-header">
							<h5 class="modal-title" id="exampleModalLabel">일정 추가</h5>
							<button type="button" class="close" data-dismiss="modal"
								aria-label="Close">
								<span aria-hidden="true">&times;</span>
							</button>
						</div>
						<div class="modal-body">
							<div class="form-group">
								<label for="taskId" class="col-form-label">일정 내용</label> <input
									type="text" class="form-control" id="calendar_content"
									name="calendar_content" placeholder="내용을 입력하세요"> <label
									for="taskId" class="col-form-label">시작 날짜</label> <input
									type="datetime-local" class="form-control"
									id="calendar_start_date" name="calendar_start_date"> <label
									for="taskId" class="col-form-label">종료 날짜</label> <input
									type="datetime-local" class="form-control"
									id="calendar_end_date" name="calendar_end_date">
							</div>
						</div>
						<div class="modal-footer">
							<button type="button" class="btn btn-warning" id="addCalendar">추가</button>
							<button type="button" class="btn btn-secondary"
								data-dismiss="modal" id="sprintSettingModalClose">취소</button>
						</div>

					</div>
				</div>
			</div>



		</div>
	</div>

	<input type="hidden" id="writer" value="${loginVO.mem_id}">
	<span>${loginVO.mem_id}</span>
	<input type="hidden" id="mid" value="a">
	<input type="hidden" id="lid" value="a">
	<input type="hidden" id="aid" value="a">
	<input type="hidden" id="caten" value="4">

	<script>
        let btn = document.querySelector("#btn");
        let sidebar = document.querySelector(".sidebar");

        btn.onclick = function () {
            sidebar.classList.toggle("active");
        }

    </script>

	<script>

        var start_date = "";
        var end_date = "";
        var content = "";
        document.addEventListener('DOMContentLoaded', function () {
            var calendarEl = document.getElementById('calendar');
            var calendar = new FullCalendar.Calendar(calendarEl, {
                slotMinTime: '08:00', // day 시작 시간
                slotMaxTime: '18:00', //  day 끝 시간
                headerToolbar: { // 헤더 툴바 dayGridMonth,listWeek,timeGridDay
                    left: 'dayGridMonth,listWeek,listDay',
                    center: 'title',
                    right: 'prev,next',
                },

                buttonText: {
                    today: 'T',
                    month: 'M',
                    week: 'W',
                    listDay: 'D',
                    day: '일',
                    prev: '◀',
                    next: '▶'
                },
                locale: 'ko', // 한국어 설정
                navLinks: true, // 날짜 선택하면 day, week 링크 기능
                selectMirror: true,
                weekNumbers: true, // 주간 넘버링
                editable: true, // 편집 기능
                selectable: true, // 드래그 기능
                
             	// 일정 데이터 받아오는 곳
                events:function(info, successCallback, failureCallback){
                	            $.ajax({
                	                   url: 'calendarList.do',
                	                   dataType: 'json',
                	                   success: 
                	                       function(result) {
                	 
                	                           var events = [];

                	                           if(result!=null){
                	                               
                	                                   $.each(result, function(index, element) {
                	                                   var enddate=element.end; 
                									   var startdate=element.start;
                									   var user = $("#writer").val();
                									   
                									   // 로그인 아이디와 작성자 아이디가 같을 때 출력
                									   console.log("로그인 아이디: "+ user);
                									   console.log("스케쥴 작성자 아이디: "+ element.writer);
                									   if(user == element.writer) {                										      

                	                                    if(enddate==null){
                    	                                        enddate=startdate;
                    	                                    }
                    	                                    
                    	                                    /* var startdate=moment(element.start).format('YYYY-MM-DD');
                    	                                    var enddate=moment(enddate).format('YYYY-MM-DD'); */
                    	                                    
                    	                                     events.push({
                    	                                               title: element.title, 
                    												   id: element.id,
                    	                                               start: startdate,
                    	                                               end: enddate, 
                    												   groupId: element.groupId,
                    												   loc_seq: element.loc_seq,
                    												   at_seq: element.at_seq,
                    												   content: element.content
                    	                                                                                                     
                    	                                            }); //.push()
                    	                                    
                    	                                  }  
                    	                               }); //.each()
                    	                               
                    	                               console.log(events);
                    	                               
                    	                           }//if end                           
                    	                           successCallback(events);                              
                	                       }//success: function end                          
                	            }); //ajax end
                	        },
                	// 이벤트 추가
                	eventAdd: function(obj) { // 이벤트가 추가되면 발생하는 이벤트
                        
                    	sDate = 
                            obj.event._instance.range["start"]; /* .getFullYear() + 
                            '-'+(obj.event._instance.range["start"].getMonth() +1) +
                            '-' +  obj.event._instance.range["start"].getDate() *//*  +
                            '-' +  obj.event._instance.range["start"].getTime(); */
                    	
                    	eDate =
                    		  obj.event._instance.range["end"];/* .getFullYear() + 
                              '-'+(obj.event._instance.range["end"].getMonth() +1) +
                              '-' +  (obj.event._instance.range["end"].getDate() -1) *//*  +
                              '-' +  obj.event._instance.range["end"].getTime(); */
                    	
                    	
                    	 Alldata = {
                            "title": obj.event._def["title"],
                            "writer": $("#writer").val(),
                            "start": sDate,
                            "end": eDate,
                            "allDay": obj.event._def["allDay"],
                            "id": obj.event._instance["id"]
                            
                        };
                    	 /*
                    	 Alldata = {
                            "title": obj.event._def["title"],
                            "writer": $("#writer").val(),
                            "start": sDate,
                            "end": eDate,
                            "allDay": obj.event._def["allDay"],
                            "defId": obj.event._instance["defId"],
                            "instanceId": obj.event._instance["instanceId"]
                    	 */

                         let allEvent = calendar.getEvents();
                         console.log(allEvent);

                          let jsondata = JSON.stringify(Alldata);
                          console.log("jsondata : " + jsondata); 
                	},

                // 일정 등록 alert
                select: function (arg) {

                    document.querySelector("#calendar_start_date").addEventListener("change", function () {
                        start_date = $("#calendar_start_date").val();
                    })
                    document.querySelector("#calendar_content").addEventListener("change", function () {
                        content = $("#calendar_content").val();
                    })
                    document.querySelector("#calendar_end_date").addEventListener("change", function () {
                        end_date = $("#calendar_end_date").val();
                    })

                    $('#addCalendar').on("click", function () {

                        // 내용 입력 여부확인
                        if (content == null || content == "") {
                            alert("내용을 입력하세요");
                        }
                        if (start_date == "" || end_date == "") {
                            alert("날짜를 입력하세요");
                        }
                        if (new Date(end_date) - new Date(start_date) < 0) {
                            alert("종료일이 시작일보다 먼저입니다");
                        }
                        if (content != null && start_date != "" && new Date(end_date) - new Date(start_date) >= 0) {
                            console.log("Ccc", content)
                            var obj = {
                                "title": content,
                                "start": start_date,
                                "end": end_date
                            }
                            console.log(obj);
                            calendar.addEvent({
                                title: content,
                                start: start_date,
                                end: end_date
                            })
                            // 일정 추가 후 json 형식으로 담겨 있는 지 테스트
                            var allEvent2 = calendar.getEvents();
                            var jsondata2 = JSON.stringify(allEvent2);
                            console.log("일정추가 확인: "+jsondata2);
                            allSave();
                                
                            calendar.unselect()
                        }
                        $("#calendar_content").val("")
                        $("#calendar_start_date").val(" ")
                        $("#calendar_end_date").val(" ")

                        content = null;
                        start_date = null;
                        end_date = null;

                        $('#calendarModal').modal("hide");
                    })


                },


                // 일정 상세보기
                eventClick: function (arg) {
                    $('#list_modal').modal("show");
                    
                    let gid = arg.event.groupId;
                    let lsq = arg.event.loc_seq;
                    let asq = arg.event.at_seq;
                    // 풀캘린더에 없어서 못 받는 듯 ajax 활용해 보고..하..
                    console.log("장소sq 확인: "+lsq);
                    console.log("상대sq 확인: "+asq);
                    
                    let locs;
                    let atts;
                    
                    let cid = arg.event.id;
                    console.log("스케쥴sq 확인: "+cid);
                    
                    // 업무상세정보 가져오고, 장소와 이력 채우기?
                    selectC(cid);
                    
                    // 업무카테고리
                    if(gid == "2") {
                    	gid = "제출";
                    }else if(gid == "1"){
                    	gid = "내부회의"
                    }else if(gid == "0"){
                    	gid = "외부회의"
                    }else if(gid == "4"){
                    	gid = "미기입"
                    }
                    console.log(gid);
                    $("#cate").text(gid);
                    
                    $("#calendar_title").text(arg.event.title);
                    
                    // 장소
                   // $("#meeting_place").text(lsq);
                    
                    // 상대방 이력
                   // $("#meeting_pe").text(asq);
                    
                    // $("#meeting_date").text(arg.event.start);
                    // 상세페이지 시간 Fri Jul 29 2022 11:06:00 GMT+0900 (한국 표준시)
                    // 타입이 undefined로 뜨고 스플릿이 안됨
                    console.log("상세페이지시간확인: "+arg.event.start);
                    var testt = String(arg.event.start.split);
                    console.log(testt);
                    console.log("type of arg.event.start.split", typeof arg.event.start.split);

                    $('.delete').on("click", function () {
                        if (Swal.fire({
                            title: "▸ " + arg.event.title + " ◂",
                            text: "일정을 삭제하시겠습니까?",
                            confirmButtonText: '삭제',
                            cancelButtonText: '아니오',
                            confirmButtonColor: '#d33',
                            cancelButtonColor: '#3085d6',
                            showCancelButton: true,
                        }).then((result) => {
                            if (result.isConfirmed) {
                                arg.event.remove() /* 일정 삭제 */
                                Swal.fire({
                                    title: "' " + arg.event.title + " ' ",
                                    text: '일정이 삭제되었습니다'
                                    
                                })
                            }
                            deleteC(arg.event.id);
                        })
                        ) { }
                        $('#list_modal').modal("hide");
                    })
                    $('.update').on("click", function () { // 수정 버튼
                        var title = arg.event.title;
                        $("#calendar_title").html("<input id='set_title' type='text' placeholder='" + title + "' value=''>");
                        $('#cate').html('구분 : <select><option value="외부회의">외부회의</option><option value="내부회의">내부회의</option><option value="제출">제출</option></select>');
                        $('#meeting_content').html("일정내용 : <input id='set_con' type='text' value='' name='' placeholder=''>");
                        $('#meeting_pe').html("<input id='set_info' type='text'>");
                        // $('#meeting_date').html("<input type='datetime-local'>");
                        $('#meeting_place').html("<input type='text' id='set_place'>");
                     // 시간 수정할 거야
                   	 $("#meeting_date").html('<td colspan="2" id="meeting_date"><label for="taskId" class="col-form-label">시작 날짜</label> <input type="datetime-local" class="form-control" id="calendar_start_date" name="calendar_start_date"> <label for="taskId" class="col-form-label">종료 날짜</label>  <input type="datetime-local" class="form-control" id="calendar_end_date" name="calendar_end_date"></td>');
                        // $('#map').html();
                        
                    })
                    
                    $('.update2').on("click", function () { // 수정완료 버튼
                        
                        // console.log("수정1", $("#set_con").val())
                        // console.log("업데이트된 타이틀", $('#set_title').val())
                        var title = arg.event.title;
                        var update_title = $('#set_title').val();
                        console.log("기존 타이틀 : ",title);
                        console.log("업데이트된 타이틀 : ",update_title);

                        title = update_title;
                        
                        // 일정수정 껄껄..
                        updateC(arg);
                        // title = null;
                        // update_title = null;
                        $('#list_modal').modal("hide");
                        
                    })
                    $('.exit').on("click", function () {
                        $('#list_modal').modal("hide");
                    })
                    // 수정된 데이터 캘린더에 업데이트 하기
                    // 풀캘린더 업데이트 함수... 도대체 뭐냐거...
                    // 도대체 뭐지.. 왜 없지... 왜 다들 안쓰는거지? 왜 다 드래그엔드롭이냐거어어 ㅠㅠㅠ
                    
                }
            });
            calendar.render();
        });
        
        // 저장 추가
        function allSave() {
        	
			 console.log("테스트용 데이터 확인: " + JSON.stringify(Alldata)); 
			 
            $.ajax({
                url: "insertC.do",
                type: "post",
                data: {addEvent : JSON.stringify(Alldata)},

				 success:function(data, textStatus, xhr){
					 console.log(data);
					 
				 },
				 error:function(xhr, status, error){
					 console.log(error);
				 }
				
				 

            });
       }
        
        // 일정 삭제
        function deleteC(id) {
        	console.log("상세페이지에서삭제할일정:" + id);
        	$.ajax({
                url: "deleteC.do",
                type: "post",
                data: {id : id},

				 success:function(res){
					 console.log(res);
					 
				 },
				 error:function(e){
					 console.log(error);
				 }
            });
 
        } 
      
// 일정 상세조회 후 loc_seq와 at_seq 등 풀캘린더에 없는 정보 가져와서 채우기
function selectC(id) {
 	//ajax통신, 글 데이터가져오기
 	$.ajax({
 		url: 'selectC.do', // 어디로 요청보낼것인가 
 		type: 'post',// GET? POST?
 		data: {
 			id : id
 			//'key(name)' :value -> 보내줄 데이터       
 		},
 		//dataType: 'json',//응답받는 데이터가 어떤 형태인지
 		success: function (res) {
 			console.log(res);
 			console.log("일정id: "+res[0].id);
 			console.log("일정제목: "+res[0].title);
 			console.log("일정장소: "+res[0].loc_seq);
 			console.log("일정장소 이름: "+res[0].loc_name);
 			console.log("참석자 이름: "+res[0].at_name);
 			let locs = res[0].loc_seq
 			let atts = res[0].at_seq
 			
 			let tms = res[0].start
 			
 			
 			console.log(tms);
 			// 장소
 			if(locs == 1) {
 				$("#meeting_place").text("장소 정보 없음");
 			}else {
 				$("#meeting_place").text(res[0].loc_name);				
 			}
            
            // 상대방 이력
            if(atts == 1) {
            	$("#meeting_pe").text("이력 정보 없음");
 			}else {
 				let attinfo = res[0].at_name + " "+ res[0].at_company +" "+ res[0].at_dept+" "+res[0].at_position;			
 				$("#meeting_pe").text(attinfo);	
 			}
            
            // 시간
             $("#meeting_date").text(tms);
            
            // 일정관련 필요한 순번 id 인풋에 숨겨놓기
            $("#mid").val(res[0].id);
            $("#lid").val(res[0].loc_seq);
            $("#aid").val(res[0].at_seq);
            console.log("일정id"+$("#mid").val());
            console.log("장소id"+$("#lid").val()); 
            console.log("참석자id"+$("#aid").val()); 
            
            
            /*initTmap시작*/
    		
    		var map;
    		var markerInfo;
    		//출발지,도착지 마커
    		var marker_s, marker_e, marker_p;
    		//경로그림정보

    		var markerArr = [];
    		var labelArr = [];

    		var marker1;
    		var drawInfoArr = [];
    		var drawInfoArr2 = [];

    		var lat, lon;

    		var chktraffic = [];
    		var resultdrawArr = [];
    		var resultMarkerArr = [];
    		Notification.requestPermission();
    		let latitude = 0;
    		let longitude = 0;
    		
    		console.log("initTmap 접근 전!");
    		initTmap()
    		function initTmap() {
    			console.log("geoFindMe 접근 전!");
    			geoFindMe()

    			function geoFindMe() {
    				console.log("geoFindMe 접근 성공!");
    				const mapLink = document.querySelector('#maplt');


    				function success(position) {
    					latitude = position.coords.latitude;
    					longitude = position.coords.longitude;
						
    					document.getElementById("map_div").innerHTML = "";

    					mapLink.latitude = latitude;
    					mapLink.longitude = longitude;

    					console.log("출력 확인 테스트: " + latitude + " - " + longitude);

    					document.getElementById("maplt").innerHTML += "<p id='l1'>" + latitude + "</p>";
    					document.getElementById("maplg").innerHTML += "<p id='l2'>" + longitude + "</p>";

    					// 1. 지도 띄우기
    					map = new Tmapv2.Map("map_div", {
    						center: new Tmapv2.LatLng(latitude, longitude),
    						width: "100%",
    						height: "300px",
    						zoom: 5,
    						zoomControl: true,
    						scrollwheel: true

    					});					

    					mapFinder();


    				}


    				function error() {
    					console.log('Unable to retrieve your location');
    				}

    				if (!navigator.geolocation) {
    					console.log('Geolocation is not supported by your browser');
    				} else {
    					console.log('Locating…');
    					navigator.geolocation.getCurrentPosition(success, error);
    				}



    			};

    			function mapFinder() {

    				var searchKeyword = res[0].loc_name; // 검색 키워드
    				console.log(searchKeyword);
    				$.ajax({
    					method: "GET", // 요청 방식
    					url: "https://apis.openapi.sk.com/tmap/pois?version=1&format=json&callback=result", // url 주소
    					async: false, // 동기설정
    					data: { // 요청 데이터 정보
    						"appKey": "l7xxad35e3d4b917425383f7678af3c51008", // 발급받은 Appkey
    						"searchKeyword": searchKeyword, // 검색 키워드
    						"resCoordType": "EPSG3857", // 요청 좌표계
    						"reqCoordType": "WGS84GEO", // 응답 좌표계
    						"count": 1 // 가져올 갯수
    					},
    					success: function (response) {
    						console.log("search")
    						var resultpoisData = response.searchPoiInfo.pois.poi;


    						var innerHtml = ""; // Search Reulsts 결과값 노출 위한 변수
    						//맵에 결과물 확인 하기 위한 LatLngBounds객체 생성
    						var positionBounds = new Tmapv2.LatLngBounds();

    						// 3. POI 마커 표시
    						for (var k in resultpoisData) {
    							// POI 마커 정보 저장
    							var noorLat = Number(resultpoisData[k].noorLat);
    							var noorLon = Number(resultpoisData[k].noorLon);


    							var name = resultpoisData[k].name;

    							// POI 정보의 ID
    							var id = resultpoisData[k].id;

    							// 좌표 객체 생성
    							var pointCng = new Tmapv2.Point(
    								noorLon, noorLat);

    							// EPSG3857좌표계를 WGS84GEO좌표계로 변환
    							var projectionCng = new Tmapv2.Projection.convertEPSG3857ToWGS84GEO(
    								pointCng);

                                var lon = projectionCng._lng;
    							var lat = projectionCng._lat;

    							console.log(lon);
    							console.log(lat);

    							// 좌표 설정
    							var markerPosition = new Tmapv2.LatLng(
    								lat, lon);

    							// 마커들을 담을 배열에 마커 저장
    							markerArr.push(marker_e);
    							positionBounds.extend(markerPosition); // LatLngBounds의 객체 확장
    						}

    						$("#searchResult").html(innerHtml); //searchResult 결과값 노출
    						map.panToBounds(positionBounds); // 확장된 bounds의 중심으로 이동시키기
    						map.zoomOut();

    						// 3. 경로탐색 API 사용요청
    						var searchOption = $("#selectLevel").val();

    						var trafficInfochk = $("#year").val();

    						console.log(longitude);
    						console.log(latitude);
    						console.log(lon);
    						console.log(lat);
    						console.log(searchOption);
    						console.log(trafficInfochk);
    						
    						
    						$.ajax({
    							type: "POST",
    							url: "https://apis.openapi.sk.com/tmap/routes?version=1&format=json&callback=result",
    							async: false,
    							data: {
    								"appKey": "l7xxad35e3d4b917425383f7678af3c51008",
    								"startX": longitude,
    								"startY": latitude,
    								"endX": lon,
    								"endY": lat,
    								"reqCoordType": "WGS84GEO",
    								"resCoordType": "EPSG3857",
    								"searchOption": searchOption,
    								"trafficInfo": trafficInfochk
    							},
    							success: function (response) {
    								console.log('map api 연결 성공!');
    								var resultData = response.features;

    								var tDistance = "총 거리 : "
    									+ (resultData[0].properties.totalDistance / 1000)
    										.toFixed(1) + "km,";
    								var tTime = " 총 시간 : "
    									+ (resultData[0].properties.totalTime / 60)
    										.toFixed(0) + "분";
    								var tFare = " 총 요금 : "
    									+ resultData[0].properties.totalFare
    									+ "원,";
    								var taxiFare = " 예상 택시 요금 : "
    									+ resultData[0].properties.taxiFare
    									+ "원";

    								new Notification("알려드립니다", { body: '소요시간이 ' + (resultData[0].properties.totalTime / 60).toFixed(0) + '분 남았습니다' });

									document.getElementById("distance").innerHTML = (resultData[0].properties.totalDistance / 1000).toFixed(1) + "km";
									document.getElementById("lead_time").innerHTML = (resultData[0].properties.totalTime / 60).toFixed(0) + "분";


    								$("#result").text(
    									tDistance + tTime
    								);

    								//교통정보 표출 옵션값을 체크
    								if (trafficInfochk == "Y") {
    									for (var i in resultData) { //for문 [S]
    										var geometry = resultData[i].geometry;
    										var properties = resultData[i].properties;

    										if (geometry.type == "LineString") {
    											//교통 정보도 담음
    											chktraffic
    												.push(geometry.traffic);
    											var sectionInfos = [];
    											var trafficArr = geometry.traffic;

    											for (var j in geometry.coordinates) {
    												// 경로들의 결과값들을 포인트 객체로 변환 
    												var latlng = new Tmapv2.Point(
    													geometry.coordinates[j][0],
    													geometry.coordinates[j][1]);
    												// 포인트 객체를 받아 좌표값으로 변환
    												var convertPoint = new Tmapv2.Projection.convertEPSG3857ToWGS84GEO(
    													latlng);

    												sectionInfos
    													.push(convertPoint);
    											}

    											drawLine(sectionInfos,
    												trafficArr);
    										} else {

    											var markerImg = "";
    											var pType = "";

    											if (properties.pointType == "S") { //출발지 마커
    												markerImg = "http://tmapapi.sktelecom.com/upload/tmap/marker/pin_r_m_s.png";
    												pType = "S";
    											} else if (properties.pointType == "E") { //도착지 마커
    												markerImg = "http://tmapapi.sktelecom.com/upload/tmap/marker/pin_r_m_e.png";
    												pType = "E";
    											} else { //각 포인트 마커
    												markerImg = "http://topopen.tmap.co.kr/imgs/point.png";
    												pType = "P"
    											}

    											// 경로들의 결과값들을 포인트 객체로 변환 
    											var latlon = new Tmapv2.Point(
    												geometry.coordinates[0],
    												geometry.coordinates[1]);
    											// 포인트 객체를 받아 좌표값으로 다시 변환
    											var convertPoint = new Tmapv2.Projection.convertEPSG3857ToWGS84GEO(
    												latlon);

    											var routeInfoObj = {
    												markerImage: markerImg,
    												lng: convertPoint._lng,
    												lat: convertPoint._lat,
    												pointType: pType
    											};
    											// 마커 추가
    											addMarkers(routeInfoObj);
    										}
    									}//for문 [E]

    								} else {

    									for (var i in resultData) { //for문 [S]
    										var geometry = resultData[i].geometry;
    										var properties = resultData[i].properties;

    										if (geometry.type == "LineString") {
    											for (var j in geometry.coordinates) {
    												// 경로들의 결과값들을 포인트 객체로 변환 
    												var latlng = new Tmapv2.Point(
    													geometry.coordinates[j][0],
    													geometry.coordinates[j][1]);
    												// 포인트 객체를 받아 좌표값으로 변환
    												var convertPoint = new Tmapv2.Projection.convertEPSG3857ToWGS84GEO(
    													latlng);
    												// 포인트객체의 정보로 좌표값 변환 객체로 저장
    												var convertChange = new Tmapv2.LatLng(
    													convertPoint._lat,
    													convertPoint._lng);
    												// 배열에 담기
    												drawInfoArr
    													.push(convertChange);
    											}
    											drawLine(drawInfoArr,
    												"0");
    										} else {

    											var markerImg = "";
    											var pType = "";

    											if (properties.pointType == "S") { //출발지 마커
    												markerImg = "http://tmapapi.sktelecom.com/upload/tmap/marker/pin_r_m_s.png";
    												pType = "S";
    											} else if (properties.pointType == "E") { //도착지 마커
    												markerImg = "http://tmapapi.sktelecom.com/upload/tmap/marker/pin_r_m_e.png";
    												pType = "E";
    											} else { //각 포인트 마커
    												markerImg = "http://topopen.tmap.co.kr/imgs/point.png";
    												pType = "P"
    											}

    											// 경로들의 결과값들을 포인트 객체로 변환 
    											var latlon = new Tmapv2.Point(
    												geometry.coordinates[0],
    												geometry.coordinates[1]);
    											// 포인트 객체를 받아 좌표값으로 다시 변환
    											var convertPoint = new Tmapv2.Projection.convertEPSG3857ToWGS84GEO(
    												latlon);

    											var routeInfoObj = {
    												markerImage: markerImg,
    												lng: convertPoint._lng,
    												lat: convertPoint._lat,
    												pointType: pType
    											};

    											// Marker 추가
    											addMarkers(routeInfoObj);
    										}
    									}//for문 [E]
    								}
    							},
    							error: function (request, status, error) {
    								console.log("code:"
    									+ request.status + "\n"
    									+ "message:"
    									+ request.responseText
    									+ "\n" + "error:" + error);
    							}
    						});

    					},
    					error: function (request, status, error) {
    						console.log("code:"
    							+ request.status + "\n"
    							+ "message:"
    							+ request.responseText
    							+ "\n" + "error:" + error);
    					}
    				});
    			}

    			function addComma(num) {
    				var regexp = /\B(?=(\d{3})+(?!\d))/g;
    				return num.toString().replace(regexp, ',');
    			}

    			//마커 생성하기
    			function addMarkers(infoObj) {
    				var size = new Tmapv2.Size(24, 38);//아이콘 크기 설정합니다.

    				if (infoObj.pointType == "P") { //포인트점일때는 아이콘 크기를 줄입니다.
    					size = new Tmapv2.Size(8, 8);
    				}

    				marker_p = new Tmapv2.Marker({
    					position: new Tmapv2.LatLng(infoObj.lat, infoObj.lng),
    					icon: infoObj.markerImage,
    					iconSize: size,
    					map: map
    				});

    				resultMarkerArr.push(marker_p);
    			}

    			//라인그리기
    			function drawLine(arrPoint, traffic) {
    				var polyline_;

    				if (chktraffic.length != 0) {

    					// 교통정보 혼잡도를 체크
    					// strokeColor는 교통 정보상황에 다라서 변화
    					// traffic :  0-정보없음, 1-원활, 2-서행, 3-지체, 4-정체  (black, green, yellow, orange, red)

    					var lineColor = "";

    					if (traffic != "0") {
    						if (traffic.length == 0) { //length가 0인것은 교통정보가 없으므로 검은색으로 표시

    							lineColor = "#06050D";
    							//라인그리기[S]
    							polyline_ = new Tmapv2.Polyline({
    								path: arrPoint,
    								strokeColor: lineColor,
    								strokeWeight: 6,
    								map: map
    							});
    							resultdrawArr.push(polyline_);
    							//라인그리기[E]
    						} else { //교통정보가 있음

    							if (traffic[0][0] != 0) { //교통정보 시작인덱스가 0이 아닌경우
    								var trafficObject = "";
    								var tInfo = [];

    								for (var z = 0; z < traffic.length; z++) {
    									trafficObject = {
    										"startIndex": traffic[z][0],
    										"endIndex": traffic[z][1],
    										"trafficIndex": traffic[z][2],
    									};
    									tInfo.push(trafficObject)
    								}

    								var noInfomationPoint = [];

    								for (var p = 0; p < tInfo[0].startIndex; p++) {
    									noInfomationPoint.push(arrPoint[p]);
    								}

    								//라인그리기[S]
    								polyline_ = new Tmapv2.Polyline({
    									path: noInfomationPoint,
    									strokeColor: "#06050D",
    									strokeWeight: 6,
    									map: map
    								});
    								//라인그리기[E]
    								resultdrawArr.push(polyline_);

    								for (var x = 0; x < tInfo.length; x++) {
    									var sectionPoint = []; //구간선언

    									for (var y = tInfo[x].startIndex; y <= tInfo[x].endIndex; y++) {
    										sectionPoint.push(arrPoint[y]);
    									}

    									if (tInfo[x].trafficIndex == 0) {
    										lineColor = "#06050D";
    									} else if (tInfo[x].trafficIndex == 1) {
    										lineColor = "#61AB25";
    									} else if (tInfo[x].trafficIndex == 2) {
    										lineColor = "#FFFF00";
    									} else if (tInfo[x].trafficIndex == 3) {
    										lineColor = "#E87506";
    									} else if (tInfo[x].trafficIndex == 4) {
    										lineColor = "#D61125";
    									}

    									//라인그리기[S]
    									polyline_ = new Tmapv2.Polyline({
    										path: sectionPoint,
    										strokeColor: lineColor,
    										strokeWeight: 6,
    										map: map
    									});
    									//라인그리기[E]
    									resultdrawArr.push(polyline_);
    								}
    							} else { //0부터 시작하는 경우

    								var trafficObject = "";
    								var tInfo = [];

    								for (var z = 0; z < traffic.length; z++) {
    									trafficObject = {
    										"startIndex": traffic[z][0],
    										"endIndex": traffic[z][1],
    										"trafficIndex": traffic[z][2],
    									};
    									tInfo.push(trafficObject)
    								}

    								for (var x = 0; x < tInfo.length; x++) {
    									var sectionPoint = []; //구간선언

    									for (var y = tInfo[x].startIndex; y <= tInfo[x].endIndex; y++) {
    										sectionPoint.push(arrPoint[y]);
    									}

    									if (tInfo[x].trafficIndex == 0) {
    										lineColor = "#06050D";
    									} else if (tInfo[x].trafficIndex == 1) {
    										lineColor = "#61AB25";
    									} else if (tInfo[x].trafficIndex == 2) {
    										lineColor = "#FFFF00";
    									} else if (tInfo[x].trafficIndex == 3) {
    										lineColor = "#E87506";
    									} else if (tInfo[x].trafficIndex == 4) {
    										lineColor = "#D61125";
    									}

    									//라인그리기[S]
    									polyline_ = new Tmapv2.Polyline({
    										path: sectionPoint,
    										strokeColor: lineColor,
    										strokeWeight: 6,
    										map: map
    									});
    									//라인그리기[E]
    									resultdrawArr.push(polyline_);
    								}
    							}
    						}
    					} else {

    					}
    				} else {
    					polyline_ = new Tmapv2.Polyline({
    						path: arrPoint,
    						strokeColor: "#DD0000",
    						strokeWeight: 6,
    						map: map
    					});
    					resultdrawArr.push(polyline_);
    				}

    			}

    			//초기화 기능
    			function resettingMap() {
    				//기존마커는 삭제
    				marker_s.setMap(null);
    				marker_e.setMap(null);

    				if (resultMarkerArr.length > 0) {
    					for (var i = 0; i < resultMarkerArr.length; i++) {
    						resultMarkerArr[i].setMap(null);
    					}
    				}

    				if (resultdrawArr.length > 0) {
    					for (var i = 0; i < resultdrawArr.length; i++) {
    						resultdrawArr[i].setMap(null);
    					}
    				}

    				chktraffic = [];
    				drawInfoArr = [];
    				resultMarkerArr = [];
    				resultdrawArr = [];
    			}


    		}
                    	/*initTmap끝*/
            
            
            
 		},
 		error: function (e) {
 			alert('error');
 		}
 	})

 };
        
// 상세 일정 수정
 function updateC(arg){
	 
	 console.log("스케쥴 ID: "+$("#mid").val());
	 console.log("스케쥴 제목: "+$("#set_title").val());
	 console.log("업무카테고리:"+$("select").val());
	 console.log("참석자 이름: "+$("#set_info").val());
	 console.log("장소 이름: "+$("#set_place").val());
	 
	 let cates = $("select").val();
	 
	 $("#calendar_start_date").val();
     $("#calendar_end_date").val();
	 
	 
	 // 시간 수정할 거야
	 // $("#meeting_date").html('<td colspan="2" id="meeting_date"><label for="taskId" class="col-form-label">시작 날짜</label> <input type="datetime-local" class="form-control" id="calendar_start_date" name="calendar_start_date"> <label for="taskId" class="col-form-label">종료 날짜</label>  <input type="datetime-local" class="form-control" id="calendar_end_date" name="calendar_end_date"></td>');
	/* 	 ti = `
		 <label for="taskId" class="col-form-label">시작 날짜</label> 
		 <input type="datetime-local" class="form-control" id="calendar_start_date" name="calendar_start_date"> 
		 <label for="taskId" class="col-form-label">종료 날짜</label> 
		 <input type="datetime-local" class="form-control" id="calendar_end_date" name="calendar_end_date">
	 `
	  $("#meeting_date").html(ti); */

	 
	 updata = {
	 	"id" : arg.event.id,
		"title": $("#set_title").val(),
		"start": arg.event.start,
		"loc_name": $("#set_place").val(),
		"at_name": $("#set_info").val(),
		"loc_seq": $("#lid").val(),
		"at_seq":$("#aid").val(),
		"groupId": cates,
		"start" :$("#calendar_start_date").val(),
		"end" :$("#calendar_end_date").val(),
         };
	
	//ajax통신, 글 데이터가져오기
	 	 $.ajax({
	 		url: 'updateC.do', // 어디로 요청보낼것인가 
	 		type: 'post',// GET? POST?
	 		data: {
	 			jsonup : JSON.stringify(updata)     
	 		},
	 		//dataType: 'json',//응답받는 데이터가 어떤 형태인지
	 		success: function (res) {
	 			console.log("업데이트");
	 			console.log(res);
	 			location.reload();
	 		},
	 		error: function (e) {
	 			alert('error');
	 			
	 		}
	 	})
	
}; 


<%--$('#calendarModal').modal(hide,)--%>

    </script>

</body>

</html>