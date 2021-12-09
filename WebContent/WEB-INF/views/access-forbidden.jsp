<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>403 Forbidden</title>
	<base href="${pageContext.servletContext.contextPath }/">
	<style>
		body {
			 background-color: #332851;
		}
		 body .base {
			 width: 100%;
			 height: 90vh;
			 position: relative;
			 overflow: hidden;
			 display: flex;
			 align-items: center;
			 justify-content: center;
			 cursor: pointer;
			 flex-direction: column;
			 -webkit-tap-highlight-color: rgba(255, 255, 255, 0);
		}
		 body .base h1 {
			 -webkit-tap-highlight-color: rgba(255, 255, 255, 0);
			 font-family: 'Ubuntu', sans-serif;
			 text-transform: uppercase;
			 text-align: center;
			 font-size: 30vw;
			 display: block;
			 margin: 0;
			 color: #9ae1e2;
			 position: relative;
			 z-index: 0;
			 animation: colors 0.4s ease-in-out forwards;
			 animation-delay: 1.7s;
		}
		 body .base h1:before {
			 content: "U";
			 position: absolute;
			 top: -9%;
			 right: 40%;
			 transform: rotate(180deg);
			 font-size: 15vw;
			 color: #f6c667;
			 z-index: -1;
			 text-align: center;
			 animation: lock 0.2s ease-in-out forwards;
			 animation-delay: 1.5s;
		}
		 body .base h2 {
			 font-family: 'Cabin', sans-serif;
			 color: #9ae1e2;
			 font-size: 5vw;
			 margin: 0;
			 text-transform: uppercase;
			 text-align: center;
			 animation: colors 0.4s ease-in-out forwards;
			 animation-delay: 2s;
			 -webkit-tap-highlight-color: rgba(255, 255, 255, 0);
		}
		 body h5 {
			 font-family: 'Cabin', sans-serif;
			 color: #9ae1e2;
			 font-size: 2vw;
			 margin: 0;
			 text-align: left;
			 opacity: 0;
			 animation: show 2s ease-in-out forwards;
			 color: #ca3074;
			 animation-delay: 3s;
			 -webkit-tap-highlight-color: rgba(255, 255, 255, 0);
			 transition: 0.4s;
		}
		body h5.hover-white:hover {
			color: #fff;
		}
		 @keyframes lock {
			 50% {
				 top: -4%;
			}
			 100% {
				 top: -6%;
			}
		}
		 @keyframes colors {
			 50% {
				 transform: scale(1.1);
			}
			 100% {
				 color: #ca3074;
			}
		}
		 @keyframes show {
			 100% {
				 opacity: 1;
			}
		}
	</style>
</head>
<body>
	<a href="${pageContext.request.contextPath }/home" style="text-decoration: none"><h5 class="hover-white">Trở về trang chủ</h5></a>
	<div class="base io">
	    <h1 class="io">403</h1>
	    <h2>Access forbidden</h2>
	</div>
</body>
</html>