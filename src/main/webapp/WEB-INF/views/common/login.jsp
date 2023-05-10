<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<!-- 제이쿼리 불러오기 -->
<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>

<!-- 테일윈드 불러오기 -->
<!-- 노말라이즈, 라이브러리까지 한번에 해결 -->
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/tailwindcss/2.2.7/tailwind.min.css" />

<!-- 데이지 UI -->
<link href="https://cdn.jsdelivr.net/npm/daisyui@2.51.5/dist/full.css" rel="stylesheet" type="text/css" />

<!-- 폰트어썸 불러오기 -->
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.1.1/css/all.min.css" />
</head>
<style>
html,body{
	margin:0;
	padding:0;
	font-family: 'GmarketSansMedium';
}
/*  .img {
    display: block;
    margin : 0 auto;
    } */

  .item-box{
    position: relative;
    z-index:1;
    display: flex;
    justify-content: center;
    align-items: center;
  }
    
  .content-box{
  	position: absolute;
    width: 30%;
    height: 40%;
    background: rgba(255, 255, 255, 0.2);
    border-radius: 10px;
  }
  .demys {
  	padding-top:20px;
  	padding-left:20px;
  	font-size:4rem;
  	font-weight:bold;
  	color:#153A66;
  }
  .user-box {
  	padding-left:25px;
  	font-size:1rem;
  	font-weight:bold;
  	color:#ffffff;

  	}

  	.login-card {
  	display:flex;
  	justify-content: center; 
  	align-items: center;
  	margin-top: 10px;
  	}
  	
  	.loginbox-btn {
  	display:flex;
  	align-items: center;
  	height: 80px;
  	margin-top: 10px;
  	}
  	
  	.btn-primary {
  	color:#ffffff;
  	background-color:#153A66;
  	border : none;
  	margin : 0 auto;
  	}
  	.btn-primary:hover {
  	background-color:#016FA0 ;
  	}

	.mt-5 {
	text-align: center;
	}
	.font-demys {
	color : #000000;
	}
	
	.form-control {
	border-bottom:1px solid #000000;
	}
	
	.input-card {
	background: rgba(255, 255, 255, 0);
	width: 100px;
	color : #000000;
	font-weight: bold;
	}
	
	.id-box {
	line-height:48px;
	outline:none;
	background: rgba(255, 255, 255, 0);
	}

</style>
<body>

<div class="item-box">
	<div class="img">
 		<img src="/resource/img/back.png" style="width:190vh;height:1067px;"/>
	</div>
	<div class="content-box" style="border:5px solid #153A66;">
		<div class="demys">
			<span>DEMYS PMS</span>
		</div>
		<div class="user-box">
			<span>USER LOGIN</span>
		</div>
	<div class="login-card">
	  <div class="login-box">
		<div class="flex flex-col gap-2 items-center" >
			<div class="form-control">
			  <label class="input-group input-group-sm">
			    <span class="input-card">ID :</span>
			    <input type="text" class="id-box" value="" />
			  </label>
			</div>
			<div class="form-control">
			  <label class="input-group input-group-sm">
			    <span class="input-card">PW :</span>
			    <input type="text" class="id-box" value="" />
			  </label>
			</div>
		</div>
	  </div>
	</div>
		<div class="loginbox-btn">
			<input type="submit" class="btn btn-primary" value="LOGIN" />
		</div>
		<div>
			<p class="mt-5">
				<a class="font-demys" href="#">계정등록</a>&nbsp;&nbsp;
				<a class="font-demys" href="#">비밀번호 찾기</a>
			</p>
		</div>
	</div>
</div>
</body>
</html>