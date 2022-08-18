<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>dovis</title>

<script type="text/javascript"
	src="https://static.nid.naver.com/js/naveridlogin_js_sdk_2.0.0.js"
	charset="utf-8"></script>
<link href='https://unpkg.com/boxicons@2.1.2/css/boxicons.min.css'
	rel='stylesheet'>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
<link rel="stylesheet" href="resources/css/main.css">
<!-- main css -->
    <script src="https://cdn.jsdelivr.net/npm/sweetalert2@10"></script> <!-- alert -->
<link rel="stylesheet" href="resources/css/dovis.css">
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
			<li><a href="logoutcheck.do"> <i class='bx bx-exit'></i> <span
					class="link_name">logout</span>
			</a> <span class="tooltip">logout</span></li>
		</ul>
	</div>
	<div class="home_content">
		<div class="text">
                    <div id="logout-center">
                        <div id="logout-contnet1">
                                <br><h1>오늘 한 일정</h1>
                                <br><hr><br>
                                <h3>[내부회의]기획서 회의</h3>
                        </div>

                        <div id="logout-contnet2"><span>
                                <br><h1>내일 할 일정</h1>
                                <br><hr><br>
                                	<h3>[내부회의]정형쌤과 상담</h3>
                                    <h3>[제출]휴가 기획서 제출</h3>
                        </div>
                    </div>
		</div>
	</div>

		<script>
        let btn = document.querySelector("#btn");        
        let sidebar = document.querySelector(".sidebar");        
        
        btn.onclick = function() {
            sidebar.classList.toggle("active");
        }

    </script>
    <script>
    setTimeout(()=>{logout()}, 2000);

    function logout(){
      if (Swal.fire({
        title: "로그아웃 하시겠습니까?",
        confirmButtonText: '네',
        cancelButtonText: '아니오',
        confirmButtonColor: '#3085d6',
        cancelButtonColor: '#d33',
        showCancelButton: true,
    }).then((result) => {
        if (result.isConfirmed) {
        	window.location.href = 'logout.do'
        }
    })
    );
    }
    </script>
</body>

</html>