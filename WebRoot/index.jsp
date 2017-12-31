<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ page import="com.offcn.entity.User" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<% 
	String userName = null;
	User user = null;
	if( session.getAttribute("user") == null || session.getAttribute("user").equals("")){
%>		
<% 		
	}else {
		user = (User) session.getAttribute("user");
		userName = user.getUserName();
		Integer uid = user.getUid();
		session.setAttribute("uid", uid);
		session.setAttribute("userName", userName);
	}
 %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>二手交易平台</title>
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	   <style>
        *{
            padding: 0;
            margin: 0;
        }
        .menu{
            height: 90px;
            width: 1320px;
            margin: 20px auto;
            margin-top:0;
            background: #ffda44;
        }
        .menu>p{
            display: inline-block;
        }
        .menu>p>span{
            display: inline-block;
            width: 110px;
            height: 80px;
            text-align: center;
            line-height: 80px;
            font-size: 20px;
            font-weight: bold;
        }
        #rig,#regAndLog{
            margin:  0 20px;
        }
        #regAndLog{
            margin-right: 0;
        }
        #caption{
            width: 300px;
            margin-left: 15px;
        }
        #caption>#designation{
            font-size: 34px;
            width: 40px;
        }
        #caption>#explain{
            width: 260px;
            font-size: 18px;
            font-weight: normal;
        }
        .content{
            width: 1220px;
            margin: 50px auto 30px;
        }
        .navigation{
            width: 200px;
            border: 1px solid #d8d8d8;
        }
        .navigation,.showImg,.pushAdvices{
            display: inline-block;
        }
        .navigation>p{
            width: 200px;
            height: 50px;
            line-height: 50px;
            font-size: 20px;
            text-align: center;
        }
        .choose{
            background: #edf6ff;
        }
        .showImg{
            width: 850px;
        }
        .showImg img{
        	width:50px;
        	height:50px;
        }
        .pushAdvices{
            width: 150px;
            height: 350px;
        }
        .pushAdvices>p>img{
            width: 100px;
            height: 100px;
            border-radius: 50%;
            margin-left: 25px;
        }
        .pushAdvices>p>span{
            display: inline-block;
            width: 150px;
            height: 30px;
            font-size: 16px;
            background: #eae7ff;
            text-align: center;
        }
        #greet,#interest{
            font-size: 20px;
        }
        #interest{
            font-weight: bold;
        }
        .barMenu{
            width: 1220px;
            margin:  0 auto;
        }
        .barMenu>p{
            border-bottom: 1px solid #d8d8d8;
            height: 31px;
        }
        .barMenu>p>span{
            display: inline-block;
            width: 100px;
            height: 30px;
            font-size: 20px;
            margin-left: 30px;
            text-align: center;
        }
       .cur{
           border-bottom: 3px solid #ff5156;
       }
       
      	span,p{
			cursor: pointer;
		}
		
		#designation,#explain{
			cursor: default;
		}
       
    </style>
	
	
  </head>
  
  <body>
    <%@include file="jsp/common/top.jsp" %>

    <div>
        <form action="" name="mainPage" method="post">
            <div class="menu">
                <p id="caption">
                    <span id="designation">它</span><span id="explain">让你的闲置物品，发挥ta的作用</span>
                </p>
                <p>
                    <span>首页</span>
                    <span>二手手机</span>
                    <span>二手车估价</span>
                    <span>鉴定</span>
                </p>
                <span>|</span>
                <p id="rig">
                    <span onclick="publishInfo()">发布闲置</span>
                    <span onclick="selectIdleInfo()">我的闲置</span>
                </p>
                <p id="regAndLog">
                </p>
            </div>
            <div class="content">
                <div class="navigation">
                    <p class="nav" flag="0" onclick="initIdle('1')">闲置数码</p>
                    <p class="nav" flag="0" onclick="initIdle('2')">闲置母婴</p>
                    <p class="nav" flag="0" onclick="initIdle('3')">家居日用</p>
                    <p class="nav" flag="0" onclick="initIdle('4')">影音家电</p>
                    <p class="nav" flag="0" onclick="initIdle('5')">鞋服配饰</p>
                    <p class="nav" flag="0" onclick="initIdle('6')">珠宝收藏</p>
                </div>
                <div class="showImg">
                	
                </div>
                <div class="pushAdvices">
                    <p>
                        <img src="resources/images/1.png" alt="">
                        <span id="greet">HI,${userName }</span><br>
                        <span id="interest">您可能感兴趣</span>
                    </p>
                    <p>
                        <span>耳机</span>
                        <span>平板</span>
                    </p>
                    <p>
                        <span>MP4</span>
                        <span>macBook</span>
                    </p>
                    <p>
                        <span>psp3000</span>
                        <span>手表</span>
                    </p>
                </div>
            </div>
            <div class="barMenu">
                <p>
                    <span class="small" flag="0">猜你喜欢</span>
                    <span class="small" flag="0">全新闲置</span>
                    <span class="small" flag="0">同城交易</span>
                </p>
                <div class="showEnjoy"></div>
                <div class="brandNew">
                	
                </div>
                <div class="local"></div>
            </div>
        </form>
    </div>
<script type="text/javascript" src="resources/js/jquery-1.11.2.min.js"></script>
    <script type="text/javascript">
    
    	$(function(){
			var userName = '${userName}';
    		if(userName){
    			//个人中心
    			$("#regAndLog").empty();
    			var html = "<span onclick='grzx()'>个人中心</span>";
    			$("#regAndLog").append(html);
    		}
    	});
    
    	//个人中心
    	function grzx(){
    		window.location.href = '/SSM_E/jsp/user/UserPersonCenter.jsp';
    	}
    	
    	//发布闲置信息
    	function publishInfo(){
    		window.location.href = '/SSM_E/jsp/user/publishIdleInfo.jsp';
    	}
    	
    	//查看闲置信息
    	function selectIdleInfo(){
    		window.location.href = '/SSM_E/jsp/user/showIdleInfo.jsp';
    	}
    	
    	//查看当前选中类型的闲置信息
    	function initIdle(tag){
    		var url = "Idle/selectAllByType.action";
    		$.post(url,{"typeid":tag},function(data){
    			if(data.length != 0){
    				$("div.showImg").load("/SSM_E/jsp/user/IdleInfo.jsp");
    			}else{
    				$("div.showImg").empty();
    			}
    		},"json");
    	}
    	
        $('.nav').mouseover(function () {
            $(this).addClass('choose');
        }).mouseout(function () {
            if($(this).attr('flag') == 0){
                $(this).removeClass('choose');
            }
        });
        $('.small').mouseover(function () {
            $(this).addClass("cur");
        }).mouseout(function () {
            if($(this).attr('flag') == 0){
                $(this).removeClass('cur');
            }
        });
        function login() {
            mainPage.action = "";
            mainPage.submit();
        }
        function register() {
            mainPage.action = "";
            mainPage.submit();
        }
        
    </script>
  </body>
</html>
