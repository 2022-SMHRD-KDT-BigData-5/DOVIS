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

<link rel="stylesheet" href="resources/css/setting.css">
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
			<div class="container">
				<div class="leftSide">
					<div class="profile-box">
						<div class="profile">
							<ion-icon name="person-circle-outline"></ion-icon>
						</div>
						<h2>주윤</h2>
						<div class="profile-bottom">
							<p>회사 : DOVIS</p>
							<p>부서 : 빅데이터</p>
							<p>직책 : 사원</p>
						</div>
					</div>
				</div>
				<div class="rightSide">
					<h1>회원정보수정</h1>
					<form action="" method="post">
						<div id="content">
							<div>
								<h3 class="user_info">

									<label for="name">이름</label>
								</h3>
								<span class="box int_name"> <input type="text"
									name="name" class="int" value="주윤">
								</span>
							</div>
							<div>
								<h3 class="user_info">

									<label for="company">회사</label>
								</h3>
								<span class="box int_comp"> <input type="text"
									name="company" class="int" value="DOVIS">
								</span>
							</div>
							<div>
								<h3 class="user_info">

									<label for="dept">부서</label>
								</h3>
								<span class="box int_dept"> <input type="text"
									name="dept" class="int" value="빅데이터">
								</span>
							</div>
							<div>
								<h3 class="user_info">

									<label for="pos">직책</label>
								</h3>
								<span class="box int_pos"> <input type="text" name="pos"
									class="int" value="사원">
								</span>
							</div>
							<div class="btn">
								<input type="submit" id="btnsubmit" value="정보수정">
							</div>
						</div>
					</form>
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
        <script type="module" src="https://unpkg.com/ionicons@5.5.2/dist/ionicons/ionicons.esm.js"></script>
<script nomodule src="https://unpkg.com/ionicons@5.5.2/dist/ionicons/ionicons.js"></script>
    
</body>

</html>