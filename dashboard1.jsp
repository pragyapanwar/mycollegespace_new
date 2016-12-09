<%-- 
    Document   : dashboard
    Created on : Sep 24, 2016, 1:44:38 PM
    Author     : shivangi
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@include file="connection.jsp" %>
<%!
int ans1=-1,ans2=-1,ans3=-1,ans4=-1,ans5=-1;
int i,lc,tid;
String team_name,teamid;
%>
<%
        team_name = (String) session.getAttribute("tname");
        teamid = (String) session.getAttribute("tid"); 
        tid = Integer.parseInt(teamid);
%>

<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link href="css/dashcss.css" rel="stylesheet" type="text/css">
        <link href="css/jquerysctipttop.css" rel="stylesheet" type="text/css">
        <script src="javascript/jquery.min.js"></script>
        <script src="javascript/dash.js"></script>
        <link href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-1q8mTJOASx8j1Au+a5WDVnPi2lkFfwwEAa8hDDdjZlpLegxhjVME1fgjWPGmkzs7" crossorigin="anonymous">
        <link href="https://maxcdn.bootstrapcdn.com/font-awesome/4.6.1/css/font-awesome.min.css" rel="stylesheet" integrity="sha384-hQpvDQiCJaD2H465dQfA717v7lu5qHWtDbWNPvaTJ0ID5xnPUlVXnKzq7b8YUkbN" crossorigin="anonymous">
        <link href="https://cdnjs.cloudflare.com/ajax/libs/slick-carousel/1.5.9/slick.css" rel="stylesheet"/>
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.3/jquery.min.js"></script>
        <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/js/bootstrap.min.js" integrity="sha384-0mSbJDEHialfmuBBQP6A4Qrprq5OVfW37PRR3j5ELqxss1yVqOtnepnHVP9aJ7xS" crossorigin="anonymous"></script>
        <script src="javascript/jquery1.min.js"></script>

        <title>JSP Page</title>
        <style>
                  @font-face{
                font-family: digital-7;
                /*src: url(font/SUBWT___.ttf);*/
                src: url(font/digital-7.ttf);
            }
            
            
           .gradient button {
  color: #fff;
  text-shadow: -2px 2px #346392;
  background-color: #ff9664;
  background-image: linear-gradient(top, #6496c8, #346392);
  box-shadow: inset 0 0 0 1px #27496d;
  border: none;
  border-radius: 15px;
}

.gradient button:hover,
.gradient button.hover {
  box-shadow: inset 0 0 0 1px #27496d,0 5px 15px #193047;
}

.gradient button:active,
.gradient button.active {
  box-shadow: inset 0 0 0 1px #27496d,inset 0 5px 30px #193047;
}
            .overlay {
    height: 0%;
    width: 100%;
    position: fixed;
    z-index: 3;
    top: 0;
    left: 0;
    background-color: rgb(0,0,0);
    background-color: rgba(0,0,0, 0.9);
    overflow-y: hidden;
    transition: 0.5s;
}

.overlay-content {
    position: relative;
    top: 25%;
    width: 100%;
    text-align: center;
    margin-top: 30px;
}

.overlay a {
    padding: 8px;
    text-decoration: none;
    font-size: 36px;
    color: #818181;
    display: block;
    transition: 0.3s;
}

.overlay a:hover, .overlay a:focus {
    color: #f1f1f1;
}

.overlay .closebtn {
    position: absolute;
    top: 20px;
    right: 45px;
    font-size: 60px;
}

@media screen and (max-height: 450px) {
  .overlay {overflow-y: auto;}
  .overlay a {font-size: 20px}
  .overlay .closebtn {
    font-size: 40px;
    top: 15px;
    right: 35px;
  }
}
    
body{
    height:500px; bottom:0; 
}


.rank{
    margin-left:600px;
}


#sp3
{
  font-size: 30px;
  color: #fff;
  font-weight: 300;
  text-align: center;
  margin-bottom: 15px; 
  margin-top: 200px;
  margin-left: 20px;
}
    
#menu{
    color:white;
    word-spacing: 10px;
    position:absolute;
    margin-left:40px; margin-top:-1%;font-family:cursive;
}
        </style>
    </head>
    <body style="background-image: url(Image/bg.jpg);background-repeat: no-repeat; background-size: 1600px 780px;">
     
        <%
        try{
            
//            tname =(String) session.getAttribute("tname");
//            String sql = "select ans1,ans2,ans3,ans4,ans5 from game_info where teamid=(select teamid from teams where team_name = '"+tname+"')";
            String sql = "select ans1,ans2,ans3,ans4,ans5,LEVELS_COMPLETED from game_info where teamid="+tid+"";
            Statement stm = con.createStatement();
            ResultSet rs = stm.executeQuery(sql);
            
            while(rs.next()){
                ans1 = rs.getInt(1);
                ans2 = rs.getInt(2);
                ans3 = rs.getInt(3);
                ans4 = rs.getInt(4);
                ans5 = rs.getInt(5);
                lc = rs.getInt(6);
//                out.println(ans1+" "+ans2+" "+ans3+" "+ans4+" "+ans5+" "+lc);
            }
            
            stm.close();
            rs.close();
            
        }catch(Exception e){
            out.println("error.....<br>"+e);
        }
        %>
            <%
               String timer ="3601";
               session.setAttribute("lefttime", timer);
            %>
               
            <c:if test="${not empty resend}">
               <%
               String chkresend = (String)session.getAttribute("resend");
               if(chkresend.equals("yes"))
               {
                   timer= request.getParameter("time");
               }
               else if(chkresend.equals("no"))
               {
                   timer = (String)session.getAttribute("lefttime");
               }
//               out.println(chkresend);
               session.setAttribute("resend", "yes");
               
                String testingwr = (String)request.getAttribute("correctanswer");
        
        if(testingwr!=null&&!testingwr.isEmpty())
        {
            timer=testingwr;
        }    
               session.setAttribute("lefttime", timer);
               
               if(lc>5){
                   response.sendRedirect("chk.jsp");
               }
               %>
            </c:if>
    <%!
 int s1=-1,s2=-1,s3=-1,s4=-1,s5=-1,t1=-1,t2=-1,t3=-1,t4=-1,t5=-1;
 
 %>
  <%
    try{
  String sql="select score1,score2,score3,score4,score5,time1,time2,time3,time4,time5,levels_completed from game_info where teamid="+teamid+"";
  Statement stm = con.createStatement();
  ResultSet rs = stm.executeQuery(sql);
  
  while(rs.next()){
      s1=rs.getInt(1);
      s2=rs.getInt(2);
      s3=rs.getInt(3);
      s4=rs.getInt(4);
      s5=rs.getInt(5);
      t1=rs.getInt(6);
      t2=rs.getInt(7);
      t3=rs.getInt(8);
      t4=rs.getInt(9);
      t5=rs.getInt(10);
      lc=rs.getInt(11);
  }
  
  stm.close();
  rs.close();
  
  %>     
    <table style="margin-top:20px;">
        <tr>
            <td><span id ="sp3" style="size:30px;cursor:pointer;" onclick="openNav()">&#9776;</span></td>
            <td>
                 <h1 style="margin-top: 40px;color:#fff; text-align:center; "></h1>
<div id='wrapper'>
  <div class='0_0 light off'></div>
  <div class='0_1 light off'></div>
  <div class='0_2 light off'></div>
  <div class='0_3 light off'></div>
  <div class='0_4 light off'></div>
  <div class='0_5 light off'></div>
  <div class='0_6 light off'></div>
  <div class='0_7 light off'></div>
  <div class='0_8 light off'></div>
  <div class='0_9 light off'></div>
  <div class='0_10 light off'></div>
  <div class='0_11 light off'></div>
  <div class='0_12 light off'></div>
  <div class='0_13 light off'></div>
  <div class='0_14 light off'></div>
  <div class='0_15 light off'></div>
  <div class='0_16 light off'></div>
  <div class='0_17 light off'></div>
  <div class='0_18 light off'></div>
  <div class='0_19 light off'></div>
  <div class='0_20 light off'></div>
  <div class='0_21 light off'></div>
  <div class='0_22 light off'></div>
  <div class='0_23 light off'></div>
  <div class='0_24 light off'></div>
  <div class='0_25 light off'></div>
  <div class='0_26 light off'></div>
  <div class='0_27 light off'></div>
  <div class='0_28 light off'></div>
  <div class='0_29 light off'></div>
  <div class='0_30 light off'></div>
  <div class='0_31 light off'></div>
  <div class='0_32 light off'></div>
  <div class='0_33 light off'></div>
  <div class='0_34 light off'></div>
  <div class='0_35 light off'></div>
  <div class='0_36 light off'></div>
  <div class='0_37 light off'></div>
  <div class='0_38 light off'></div>
  <div class='0_39 light off'></div>
  <div class='0_40 light off'></div>
  <div class='0_41 light off'></div>
  <div class='0_42 light off'></div>
  <div class='0_43 light off'></div>
  <div class='0_44 light off'></div>
  <div class='0_45 light off'></div>
  <div class='0_46 light off'></div>
  <div class='0_47 light off'></div>
  <div class='0_48 light off'></div>
  <div class='0_49 light off'></div>
  <div class='0_50 light off'></div>
  <div class='0_51 light off'></div>
  <div class='0_52 light off'></div>
  <div class='0_53 light off'></div>
  <div class='0_54 light off'></div>
  <div class='0_55 light off'></div>
  <div class='0_56 light off'></div>
  <div class='0_57 light off'></div>
  <div class='0_58 light off'></div>
  <div class='0_59 light off'></div>
  <div class='0_60 light off'></div>
  <div class='0_61 light off'></div>
  <div class='0_62 light off'></div>
  <div class='0_63 light off'></div>
  <div class='0_64 light off'></div>
  <div class='0_65 light off'></div>
  <div class='0_66 light off'></div>
  <div class='0_67 light off'></div>
  <div class='0_68 light off'></div>
  <div class='0_69 light off'></div>
  <div class='0_70 light off'></div>
  <div class='0_71 light off'></div>
  <div class='0_72 light off'></div>
  <div class='0_73 light off'></div>
  <div class='0_74 light off'></div>
  <div class='0_75 light off'></div>
  <div class='0_76 light off'></div>
  <div class='0_77 light off'></div>
  <div class='0_78 light off'></div>
  <div class='0_79 light off'></div>
  <div class='0_80 light off'></div>
  <div class='0_81 light off'></div>
  <div class='0_82 light off'></div>
  <div class='0_83 light off'></div>
  <div class='0_84 light off'></div>
  <div class='0_85 light off'></div>
  <div class='0_86 light off'></div>
  <div class='0_87 light off'></div>
  <div class='0_88 light off'></div>
  <div class='0_89 light off'></div>
  <div class='0_90 light off'></div>
  <div class='0_91 light off'></div>
  <div class='0_92 light off'></div>
  <div class='0_93 light off'></div>
  <div class='0_94 light off'></div>
  <div class='0_95 light off'></div>
  <div class='0_96 light off'></div>
  <div class='0_97 light off'></div>
  <div class='0_98 light off'></div>
  <div class='0_99 light off'></div>
  <div class='0_100 light off'></div>
  <div class='0_101 light off'></div>
  <div class='0_102 light off'></div>
  <div class='0_103 light off'></div>
  <div class='0_104 light off'></div>
  <div class='0_105 light off'></div>
  <div class='0_106 light off'></div>
  <div class='0_107 light off'></div>
  <div class='0_108 light off'></div>
  <div class='0_109 light off'></div>
  <div class='0_110 light off'></div>
  <div class='0_111 light off'></div>
  <div class='0_112 light off'></div>
  <div class='0_113 light off'></div>
  <div class='0_114 light off'></div>
  <div class='0_115 light off'></div>
  <div class='0_116 light off'></div>
  <div class='0_117 light off'></div>
  <div class='0_118 light off'></div>
  <div class='0_119 light off'></div>
  <div class='1_0 light off'></div>
  <div class='1_1 light off'></div>
  <div class='1_2 light off'></div>
  <div class='1_3 light off'></div>
  <div class='1_4 light off'></div>
  <div class='1_5 light off'></div>
  <div class='1_6 light off'></div>
  <div class='1_7 light off'></div>
  <div class='1_8 light off'></div>
  <div class='1_9 light off'></div>
  <div class='1_10 light off'></div>
  <div class='1_11 light off'></div>
  <div class='1_12 light off'></div>
  <div class='1_13 light off'></div>
  <div class='1_14 light off'></div>
  <div class='1_15 light off'></div>
  <div class='1_16 light off'></div>
  <div class='1_17 light off'></div>
  <div class='1_18 light off'></div>
  <div class='1_19 light off'></div>
  <div class='1_20 light off'></div>
  <div class='1_21 light off'></div>
  <div class='1_22 light off'></div>
  <div class='1_23 light off'></div>
  <div class='1_24 light off'></div>
  <div class='1_25 light off'></div>
  <div class='1_26 light off'></div>
  <div class='1_27 light off'></div>
  <div class='1_28 light off'></div>
  <div class='1_29 light off'></div>
  <div class='1_30 light off'></div>
  <div class='1_31 light off'></div>
  <div class='1_32 light off'></div>
  <div class='1_33 light off'></div>
  <div class='1_34 light off'></div>
  <div class='1_35 light off'></div>
  <div class='1_36 light off'></div>
  <div class='1_37 light off'></div>
  <div class='1_38 light off'></div>
  <div class='1_39 light off'></div>
  <div class='1_40 light off'></div>
  <div class='1_41 light off'></div>
  <div class='1_42 light off'></div>
  <div class='1_43 light off'></div>
  <div class='1_44 light off'></div>
  <div class='1_45 light off'></div>
  <div class='1_46 light off'></div>
  <div class='1_47 light off'></div>
  <div class='1_48 light off'></div>
  <div class='1_49 light off'></div>
  <div class='1_50 light off'></div>
  <div class='1_51 light off'></div>
  <div class='1_52 light off'></div>
  <div class='1_53 light off'></div>
  <div class='1_54 light off'></div>
  <div class='1_55 light off'></div>
  <div class='1_56 light off'></div>
  <div class='1_57 light off'></div>
  <div class='1_58 light off'></div>
  <div class='1_59 light off'></div>
  <div class='1_60 light off'></div>
  <div class='1_61 light off'></div>
  <div class='1_62 light off'></div>
  <div class='1_63 light off'></div>
  <div class='1_64 light off'></div>
  <div class='1_65 light off'></div>
  <div class='1_66 light off'></div>
  <div class='1_67 light off'></div>
  <div class='1_68 light off'></div>
  <div class='1_69 light off'></div>
  <div class='1_70 light off'></div>
  <div class='1_71 light off'></div>
  <div class='1_72 light off'></div>
  <div class='1_73 light off'></div>
  <div class='1_74 light off'></div>
  <div class='1_75 light off'></div>
  <div class='1_76 light off'></div>
  <div class='1_77 light off'></div>
  <div class='1_78 light off'></div>
  <div class='1_79 light off'></div>
  <div class='1_80 light off'></div>
  <div class='1_81 light off'></div>
  <div class='1_82 light off'></div>
  <div class='1_83 light off'></div>
  <div class='1_84 light off'></div>
  <div class='1_85 light off'></div>
  <div class='1_86 light off'></div>
  <div class='1_87 light off'></div>
  <div class='1_88 light off'></div>
  <div class='1_89 light off'></div>
  <div class='1_90 light off'></div>
  <div class='1_91 light off'></div>
  <div class='1_92 light off'></div>
  <div class='1_93 light off'></div>
  <div class='1_94 light off'></div>
  <div class='1_95 light off'></div>
  <div class='1_96 light off'></div>
  <div class='1_97 light off'></div>
  <div class='1_98 light off'></div>
  <div class='1_99 light off'></div>
  <div class='1_100 light off'></div>
  <div class='1_101 light off'></div>
  <div class='1_102 light off'></div>
  <div class='1_103 light off'></div>
  <div class='1_104 light off'></div>
  <div class='1_105 light off'></div>
  <div class='1_106 light off'></div>
  <div class='1_107 light off'></div>
  <div class='1_108 light off'></div>
  <div class='1_109 light off'></div>
  <div class='1_110 light off'></div>
  <div class='1_111 light off'></div>
  <div class='1_112 light off'></div>
  <div class='1_113 light off'></div>
  <div class='1_114 light off'></div>
  <div class='1_115 light off'></div>
  <div class='1_116 light off'></div>
  <div class='1_117 light off'></div>
  <div class='1_118 light off'></div>
  <div class='1_119 light off'></div>
  <div class='2_0 light off'></div>
  <div class='2_1 light off'></div>
  <div class='2_2 light off'></div>
  <div class='2_3 light off'></div>
  <div class='2_4 light off'></div>
  <div class='2_5 light off'></div>
  <div class='2_6 light off'></div>
  <div class='2_7 light off'></div>
  <div class='2_8 light off'></div>
  <div class='2_9 light off'></div>
  <div class='2_10 light off'></div>
  <div class='2_11 light off'></div>
  <div class='2_12 light off'></div>
  <div class='2_13 light off'></div>
  <div class='2_14 light off'></div>
  <div class='2_15 light off'></div>
  <div class='2_16 light off'></div>
  <div class='2_17 light off'></div>
  <div class='2_18 light off'></div>
  <div class='2_19 light off'></div>
  <div class='2_20 light off'></div>
  <div class='2_21 light off'></div>
  <div class='2_22 light off'></div>
  <div class='2_23 light off'></div>
  <div class='2_24 light off'></div>
  <div class='2_25 light off'></div>
  <div class='2_26 light off'></div>
  <div class='2_27 light off'></div>
  <div class='2_28 light off'></div>
  <div class='2_29 light off'></div>
  <div class='2_30 light off'></div>
  <div class='2_31 light off'></div>
  <div class='2_32 light off'></div>
  <div class='2_33 light off'></div>
  <div class='2_34 light off'></div>
  <div class='2_35 light off'></div>
  <div class='2_36 light off'></div>
  <div class='2_37 light off'></div>
  <div class='2_38 light off'></div>
  <div class='2_39 light off'></div>
  <div class='2_40 light off'></div>
  <div class='2_41 light off'></div>
  <div class='2_42 light off'></div>
  <div class='2_43 light off'></div>
  <div class='2_44 light off'></div>
  <div class='2_45 light off'></div>
  <div class='2_46 light off'></div>
  <div class='2_47 light off'></div>
  <div class='2_48 light off'></div>
  <div class='2_49 light off'></div>
  <div class='2_50 light off'></div>
  <div class='2_51 light off'></div>
  <div class='2_52 light off'></div>
  <div class='2_53 light off'></div>
  <div class='2_54 light off'></div>
  <div class='2_55 light off'></div>
  <div class='2_56 light off'></div>
  <div class='2_57 light off'></div>
  <div class='2_58 light off'></div>
  <div class='2_59 light off'></div>
  <div class='2_60 light off'></div>
  <div class='2_61 light off'></div>
  <div class='2_62 light off'></div>
  <div class='2_63 light off'></div>
  <div class='2_64 light off'></div>
  <div class='2_65 light off'></div>
  <div class='2_66 light off'></div>
  <div class='2_67 light off'></div>
  <div class='2_68 light off'></div>
  <div class='2_69 light off'></div>
  <div class='2_70 light off'></div>
  <div class='2_71 light off'></div>
  <div class='2_72 light off'></div>
  <div class='2_73 light off'></div>
  <div class='2_74 light off'></div>
  <div class='2_75 light off'></div>
  <div class='2_76 light off'></div>
  <div class='2_77 light off'></div>
  <div class='2_78 light off'></div>
  <div class='2_79 light off'></div>
  <div class='2_80 light off'></div>
  <div class='2_81 light off'></div>
  <div class='2_82 light off'></div>
  <div class='2_83 light off'></div>
  <div class='2_84 light off'></div>
  <div class='2_85 light off'></div>
  <div class='2_86 light off'></div>
  <div class='2_87 light off'></div>
  <div class='2_88 light off'></div>
  <div class='2_89 light off'></div>
  <div class='2_90 light off'></div>
  <div class='2_91 light off'></div>
  <div class='2_92 light off'></div>
  <div class='2_93 light off'></div>
  <div class='2_94 light off'></div>
  <div class='2_95 light off'></div>
  <div class='2_96 light off'></div>
  <div class='2_97 light off'></div>
  <div class='2_98 light off'></div>
  <div class='2_99 light off'></div>
  <div class='2_100 light off'></div>
  <div class='2_101 light off'></div>
  <div class='2_102 light off'></div>
  <div class='2_103 light off'></div>
  <div class='2_104 light off'></div>
  <div class='2_105 light off'></div>
  <div class='2_106 light off'></div>
  <div class='2_107 light off'></div>
  <div class='2_108 light off'></div>
  <div class='2_109 light off'></div>
  <div class='2_110 light off'></div>
  <div class='2_111 light off'></div>
  <div class='2_112 light off'></div>
  <div class='2_113 light off'></div>
  <div class='2_114 light off'></div>
  <div class='2_115 light off'></div>
  <div class='2_116 light off'></div>
  <div class='2_117 light off'></div>
  <div class='2_118 light off'></div>
  <div class='2_119 light off'></div>
  <div class='3_0 light off'></div>
  <div class='3_1 light off'></div>
  <div class='3_2 light off'></div>
  <div class='3_3 light off'></div>
  <div class='3_4 light off'></div>
  <div class='3_5 light off'></div>
  <div class='3_6 light off'></div>
  <div class='3_7 light off'></div>
  <div class='3_8 light off'></div>
  <div class='3_9 light off'></div>
  <div class='3_10 light off'></div>
  <div class='3_11 light off'></div>
  <div class='3_12 light off'></div>
  <div class='3_13 light off'></div>
  <div class='3_14 light off'></div>
  <div class='3_15 light off'></div>
  <div class='3_16 light off'></div>
  <div class='3_17 light off'></div>
  <div class='3_18 light off'></div>
  <div class='3_19 light off'></div>
  <div class='3_20 light off'></div>
  <div class='3_21 light off'></div>
  <div class='3_22 light off'></div>
  <div class='3_23 light off'></div>
  <div class='3_24 light off'></div>
  <div class='3_25 light off'></div>
  <div class='3_26 light off'></div>
  <div class='3_27 light off'></div>
  <div class='3_28 light off'></div>
  <div class='3_29 light off'></div>
  <div class='3_30 light off'></div>
  <div class='3_31 light off'></div>
  <div class='3_32 light off'></div>
  <div class='3_33 light off'></div>
  <div class='3_34 light off'></div>
  <div class='3_35 light off'></div>
  <div class='3_36 light off'></div>
  <div class='3_37 light off'></div>
  <div class='3_38 light off'></div>
  <div class='3_39 light off'></div>
  <div class='3_40 light off'></div>
  <div class='3_41 light off'></div>
  <div class='3_42 light off'></div>
  <div class='3_43 light off'></div>
  <div class='3_44 light off'></div>
  <div class='3_45 light off'></div>
  <div class='3_46 light off'></div>
  <div class='3_47 light off'></div>
  <div class='3_48 light off'></div>
  <div class='3_49 light off'></div>
  <div class='3_50 light off'></div>
  <div class='3_51 light off'></div>
  <div class='3_52 light off'></div>
  <div class='3_53 light off'></div>
  <div class='3_54 light off'></div>
  <div class='3_55 light off'></div>
  <div class='3_56 light off'></div>
  <div class='3_57 light off'></div>
  <div class='3_58 light off'></div>
  <div class='3_59 light off'></div>
  <div class='3_60 light off'></div>
  <div class='3_61 light off'></div>
  <div class='3_62 light off'></div>
  <div class='3_63 light off'></div>
  <div class='3_64 light off'></div>
  <div class='3_65 light off'></div>
  <div class='3_66 light off'></div>
  <div class='3_67 light off'></div>
  <div class='3_68 light off'></div>
  <div class='3_69 light off'></div>
  <div class='3_70 light off'></div>
  <div class='3_71 light off'></div>
  <div class='3_72 light off'></div>
  <div class='3_73 light off'></div>
  <div class='3_74 light off'></div>
  <div class='3_75 light off'></div>
  <div class='3_76 light off'></div>
  <div class='3_77 light off'></div>
  <div class='3_78 light off'></div>
  <div class='3_79 light off'></div>
  <div class='3_80 light off'></div>
  <div class='3_81 light off'></div>
  <div class='3_82 light off'></div>
  <div class='3_83 light off'></div>
  <div class='3_84 light off'></div>
  <div class='3_85 light off'></div>
  <div class='3_86 light off'></div>
  <div class='3_87 light off'></div>
  <div class='3_88 light off'></div>
  <div class='3_89 light off'></div>
  <div class='3_90 light off'></div>
  <div class='3_91 light off'></div>
  <div class='3_92 light off'></div>
  <div class='3_93 light off'></div>
  <div class='3_94 light off'></div>
  <div class='3_95 light off'></div>
  <div class='3_96 light off'></div>
  <div class='3_97 light off'></div>
  <div class='3_98 light off'></div>
  <div class='3_99 light off'></div>
  <div class='3_100 light off'></div>
  <div class='3_101 light off'></div>
  <div class='3_102 light off'></div>
  <div class='3_103 light off'></div>
  <div class='3_104 light off'></div>
  <div class='3_105 light off'></div>
  <div class='3_106 light off'></div>
  <div class='3_107 light off'></div>
  <div class='3_108 light off'></div>
  <div class='3_109 light off'></div>
  <div class='3_110 light off'></div>
  <div class='3_111 light off'></div>
  <div class='3_112 light off'></div>
  <div class='3_113 light off'></div>
  <div class='3_114 light off'></div>
  <div class='3_115 light off'></div>
  <div class='3_116 light off'></div>
  <div class='3_117 light off'></div>
  <div class='3_118 light off'></div>
  <div class='3_119 light off'></div>
  <div class='4_0 light off'></div>
  <div class='4_1 light off'></div>
  <div class='4_2 light off'></div>
  <div class='4_3 light off'></div>
  <div class='4_4 light off'></div>
  <div class='4_5 light off'></div>
  <div class='4_6 light off'></div>
  <div class='4_7 light off'></div>
  <div class='4_8 light off'></div>
  <div class='4_9 light off'></div>
  <div class='4_10 light off'></div>
  <div class='4_11 light off'></div>
  <div class='4_12 light off'></div>
  <div class='4_13 light off'></div>
  <div class='4_14 light off'></div>
  <div class='4_15 light off'></div>
  <div class='4_16 light off'></div>
  <div class='4_17 light off'></div>
  <div class='4_18 light off'></div>
  <div class='4_19 light off'></div>
  <div class='4_20 light off'></div>
  <div class='4_21 light off'></div>
  <div class='4_22 light off'></div>
  <div class='4_23 light off'></div>
  <div class='4_24 light off'></div>
  <div class='4_25 light off'></div>
  <div class='4_26 light off'></div>
  <div class='4_27 light off'></div>
  <div class='4_28 light off'></div>
  <div class='4_29 light off'></div>
  <div class='4_30 light off'></div>
  <div class='4_31 light off'></div>
  <div class='4_32 light off'></div>
  <div class='4_33 light off'></div>
  <div class='4_34 light off'></div>
  <div class='4_35 light off'></div>
  <div class='4_36 light off'></div>
  <div class='4_37 light off'></div>
  <div class='4_38 light off'></div>
  <div class='4_39 light off'></div>
  <div class='4_40 light off'></div>
  <div class='4_41 light off'></div>
  <div class='4_42 light off'></div>
  <div class='4_43 light off'></div>
  <div class='4_44 light off'></div>
  <div class='4_45 light off'></div>
  <div class='4_46 light off'></div>
  <div class='4_47 light off'></div>
  <div class='4_48 light off'></div>
  <div class='4_49 light off'></div>
  <div class='4_50 light off'></div>
  <div class='4_51 light off'></div>
  <div class='4_52 light off'></div>
  <div class='4_53 light off'></div>
  <div class='4_54 light off'></div>
  <div class='4_55 light off'></div>
  <div class='4_56 light off'></div>
  <div class='4_57 light off'></div>
  <div class='4_58 light off'></div>
  <div class='4_59 light off'></div>
  <div class='4_60 light off'></div>
  <div class='4_61 light off'></div>
  <div class='4_62 light off'></div>
  <div class='4_63 light off'></div>
  <div class='4_64 light off'></div>
  <div class='4_65 light off'></div>
  <div class='4_66 light off'></div>
  <div class='4_67 light off'></div>
  <div class='4_68 light off'></div>
  <div class='4_69 light off'></div>
  <div class='4_70 light off'></div>
  <div class='4_71 light off'></div>
  <div class='4_72 light off'></div>
  <div class='4_73 light off'></div>
  <div class='4_74 light off'></div>
  <div class='4_75 light off'></div>
  <div class='4_76 light off'></div>
  <div class='4_77 light off'></div>
  <div class='4_78 light off'></div>
  <div class='4_79 light off'></div>
  <div class='4_80 light off'></div>
  <div class='4_81 light off'></div>
  <div class='4_82 light off'></div>
  <div class='4_83 light off'></div>
  <div class='4_84 light off'></div>
  <div class='4_85 light off'></div>
  <div class='4_86 light off'></div>
  <div class='4_87 light off'></div>
  <div class='4_88 light off'></div>
  <div class='4_89 light off'></div>
  <div class='4_90 light off'></div>
  <div class='4_91 light off'></div>
  <div class='4_92 light off'></div>
  <div class='4_93 light off'></div>
  <div class='4_94 light off'></div>
  <div class='4_95 light off'></div>
  <div class='4_96 light off'></div>
  <div class='4_97 light off'></div>
  <div class='4_98 light off'></div>
  <div class='4_99 light off'></div>
  <div class='4_100 light off'></div>
  <div class='4_101 light off'></div>
  <div class='4_102 light off'></div>
  <div class='4_103 light off'></div>
  <div class='4_104 light off'></div>
  <div class='4_105 light off'></div>
  <div class='4_106 light off'></div>
  <div class='4_107 light off'></div>
  <div class='4_108 light off'></div>
  <div class='4_109 light off'></div>
  <div class='4_110 light off'></div>
  <div class='4_111 light off'></div>
  <div class='4_112 light off'></div>
  <div class='4_113 light off'></div>
  <div class='4_114 light off'></div>
  <div class='4_115 light off'></div>
  <div class='4_116 light off'></div>
  <div class='4_117 light off'></div>
  <div class='4_118 light off'></div>
  <div class='4_119 light off'></div>
  <div class='5_0 light off'></div>
  <div class='5_1 light off'></div>
  <div class='5_2 light off'></div>
  <div class='5_3 light off'></div>
  <div class='5_4 light off'></div>
  <div class='5_5 light off'></div>
  <div class='5_6 light off'></div>
  <div class='5_7 light off'></div>
  <div class='5_8 light off'></div>
  <div class='5_9 light off'></div>
  <div class='5_10 light off'></div>
  <div class='5_11 light off'></div>
  <div class='5_12 light off'></div>
  <div class='5_13 light off'></div>
  <div class='5_14 light off'></div>
  <div class='5_15 light off'></div>
  <div class='5_16 light off'></div>
  <div class='5_17 light off'></div>
  <div class='5_18 light off'></div>
  <div class='5_19 light off'></div>
  <div class='5_20 light off'></div>
  <div class='5_21 light off'></div>
  <div class='5_22 light off'></div>
  <div class='5_23 light off'></div>
  <div class='5_24 light off'></div>
  <div class='5_25 light off'></div>
  <div class='5_26 light off'></div>
  <div class='5_27 light off'></div>
  <div class='5_28 light off'></div>
  <div class='5_29 light off'></div>
  <div class='5_30 light off'></div>
  <div class='5_31 light off'></div>
  <div class='5_32 light off'></div>
  <div class='5_33 light off'></div>
  <div class='5_34 light off'></div>
  <div class='5_35 light off'></div>
  <div class='5_36 light off'></div>
  <div class='5_37 light off'></div>
  <div class='5_38 light off'></div>
  <div class='5_39 light off'></div>
  <div class='5_40 light off'></div>
  <div class='5_41 light off'></div>
  <div class='5_42 light off'></div>
  <div class='5_43 light off'></div>
  <div class='5_44 light off'></div>
  <div class='5_45 light off'></div>
  <div class='5_46 light off'></div>
  <div class='5_47 light off'></div>
  <div class='5_48 light off'></div>
  <div class='5_49 light off'></div>
  <div class='5_50 light off'></div>
  <div class='5_51 light off'></div>
  <div class='5_52 light off'></div>
  <div class='5_53 light off'></div>
  <div class='5_54 light off'></div>
  <div class='5_55 light off'></div>
  <div class='5_56 light off'></div>
  <div class='5_57 light off'></div>
  <div class='5_58 light off'></div>
  <div class='5_59 light off'></div>
  <div class='5_60 light off'></div>
  <div class='5_61 light off'></div>
  <div class='5_62 light off'></div>
  <div class='5_63 light off'></div>
  <div class='5_64 light off'></div>
  <div class='5_65 light off'></div>
  <div class='5_66 light off'></div>
  <div class='5_67 light off'></div>
  <div class='5_68 light off'></div>
  <div class='5_69 light off'></div>
  <div class='5_70 light off'></div>
  <div class='5_71 light off'></div>
  <div class='5_72 light off'></div>
  <div class='5_73 light off'></div>
  <div class='5_74 light off'></div>
  <div class='5_75 light off'></div>
  <div class='5_76 light off'></div>
  <div class='5_77 light off'></div>
  <div class='5_78 light off'></div>
  <div class='5_79 light off'></div>
  <div class='5_80 light off'></div>
  <div class='5_81 light off'></div>
  <div class='5_82 light off'></div>
  <div class='5_83 light off'></div>
  <div class='5_84 light off'></div>
  <div class='5_85 light off'></div>
  <div class='5_86 light off'></div>
  <div class='5_87 light off'></div>
  <div class='5_88 light off'></div>
  <div class='5_89 light off'></div>
  <div class='5_90 light off'></div>
  <div class='5_91 light off'></div>
  <div class='5_92 light off'></div>
  <div class='5_93 light off'></div>
  <div class='5_94 light off'></div>
  <div class='5_95 light off'></div>
  <div class='5_96 light off'></div>
  <div class='5_97 light off'></div>
  <div class='5_98 light off'></div>
  <div class='5_99 light off'></div>
  <div class='5_100 light off'></div>
  <div class='5_101 light off'></div>
  <div class='5_102 light off'></div>
  <div class='5_103 light off'></div>
  <div class='5_104 light off'></div>
  <div class='5_105 light off'></div>
  <div class='5_106 light off'></div>
  <div class='5_107 light off'></div>
  <div class='5_108 light off'></div>
  <div class='5_109 light off'></div>
  <div class='5_110 light off'></div>
  <div class='5_111 light off'></div>
  <div class='5_112 light off'></div>
  <div class='5_113 light off'></div>
  <div class='5_114 light off'></div>
  <div class='5_115 light off'></div>
  <div class='5_116 light off'></div>
  <div class='5_117 light off'></div>
  <div class='5_118 light off'></div>
  <div class='5_119 light off'></div>
  <div class='6_0 light off'></div>
  <div class='6_1 light off'></div>
  <div class='6_2 light off'></div>
  <div class='6_3 light off'></div>
  <div class='6_4 light off'></div>
  <div class='6_5 light off'></div>
  <div class='6_6 light off'></div>
  <div class='6_7 light off'></div>
  <div class='6_8 light off'></div>
  <div class='6_9 light off'></div>
  <div class='6_10 light off'></div>
  <div class='6_11 light off'></div>
  <div class='6_12 light off'></div>
  <div class='6_13 light off'></div>
  <div class='6_14 light off'></div>
  <div class='6_15 light off'></div>
  <div class='6_16 light off'></div>
  <div class='6_17 light off'></div>
  <div class='6_18 light off'></div>
  <div class='6_19 light off'></div>
  <div class='6_20 light off'></div>
  <div class='6_21 light off'></div>
  <div class='6_22 light off'></div>
  <div class='6_23 light off'></div>
  <div class='6_24 light off'></div>
  <div class='6_25 light off'></div>
  <div class='6_26 light off'></div>
  <div class='6_27 light off'></div>
  <div class='6_28 light off'></div>
  <div class='6_29 light off'></div>
  <div class='6_30 light off'></div>
  <div class='6_31 light off'></div>
  <div class='6_32 light off'></div>
  <div class='6_33 light off'></div>
  <div class='6_34 light off'></div>
  <div class='6_35 light off'></div>
  <div class='6_36 light off'></div>
  <div class='6_37 light off'></div>
  <div class='6_38 light off'></div>
  <div class='6_39 light off'></div>
  <div class='6_40 light off'></div>
  <div class='6_41 light off'></div>
  <div class='6_42 light off'></div>
  <div class='6_43 light off'></div>
  <div class='6_44 light off'></div>
  <div class='6_45 light off'></div>
  <div class='6_46 light off'></div>
  <div class='6_47 light off'></div>
  <div class='6_48 light off'></div>
  <div class='6_49 light off'></div>
  <div class='6_50 light off'></div>
  <div class='6_51 light off'></div>
  <div class='6_52 light off'></div>
  <div class='6_53 light off'></div>
  <div class='6_54 light off'></div>
  <div class='6_55 light off'></div>
  <div class='6_56 light off'></div>
  <div class='6_57 light off'></div>
  <div class='6_58 light off'></div>
  <div class='6_59 light off'></div>
  <div class='6_60 light off'></div>
  <div class='6_61 light off'></div>
  <div class='6_62 light off'></div>
  <div class='6_63 light off'></div>
  <div class='6_64 light off'></div>
  <div class='6_65 light off'></div>
  <div class='6_66 light off'></div>
  <div class='6_67 light off'></div>
  <div class='6_68 light off'></div>
  <div class='6_69 light off'></div>
  <div class='6_70 light off'></div>
  <div class='6_71 light off'></div>
  <div class='6_72 light off'></div>
  <div class='6_73 light off'></div>
  <div class='6_74 light off'></div>
  <div class='6_75 light off'></div>
  <div class='6_76 light off'></div>
  <div class='6_77 light off'></div>
  <div class='6_78 light off'></div>
  <div class='6_79 light off'></div>
  <div class='6_80 light off'></div>
  <div class='6_81 light off'></div>
  <div class='6_82 light off'></div>
  <div class='6_83 light off'></div>
  <div class='6_84 light off'></div>
  <div class='6_85 light off'></div>
  <div class='6_86 light off'></div>
  <div class='6_87 light off'></div>
  <div class='6_88 light off'></div>
  <div class='6_89 light off'></div>
  <div class='6_90 light off'></div>
  <div class='6_91 light off'></div>
  <div class='6_92 light off'></div>
  <div class='6_93 light off'></div>
  <div class='6_94 light off'></div>
  <div class='6_95 light off'></div>
  <div class='6_96 light off'></div>
  <div class='6_97 light off'></div>
  <div class='6_98 light off'></div>
  <div class='6_99 light off'></div>
  <div class='6_100 light off'></div>
  <div class='6_101 light off'></div>
  <div class='6_102 light off'></div>
  <div class='6_103 light off'></div>
  <div class='6_104 light off'></div>
  <div class='6_105 light off'></div>
  <div class='6_106 light off'></div>
  <div class='6_107 light off'></div>
  <div class='6_108 light off'></div>
  <div class='6_109 light off'></div>
  <div class='6_110 light off'></div>
  <div class='6_111 light off'></div>
  <div class='6_112 light off'></div>
  <div class='6_113 light off'></div>
  <div class='6_114 light off'></div>
  <div class='6_115 light off'></div>
  <div class='6_116 light off'></div>
  <div class='6_117 light off'></div>
  <div class='6_118 light off'></div>
  <div class='6_119 light off'></div>
</div>
            </td>
            <td>   
                <div id="menu">
                <%!
                String username;
                int score,rank=0;
                %>
                <%
                username = (String) session.getAttribute("tname");
                sql = "select score from leaderboard where teamid="+tid+"";
                stm = con.createStatement();
                rs = stm.executeQuery(sql);
                while(rs.next()){
                    score=rs.getInt(1);
                }
                stm.close();
                rs.close();
                
//                sql = "select teamid from leaderboard order by score desc";
                sql="select t.team_name from teams t,leaderboard l where t.teamid=l.teamid order by l.score desc ";
                stm = con.createStatement();
                rs = stm.executeQuery(sql);
                int j=0;
                while(rs.next()){
                    ++j;
                    String teamname = rs.getString(1);
//                    out.println(teamname+" "+j);
                    if(teamname.equals(team_name)){
                        rank=j;
                    }
                        
                }
                stm.close();
                rs.close();
                %> 
    <!--<div class="user">-->
            Team Name : <% out.println(team_name); %>
            <br>Score: <%  out.println(score); %> &nbsp; &nbsp;Rank: <%  out.println(rank); %>
    <!--</div>-->
            </div></td>
        </tr>
    </table>
 
     <script src="javascript/ledtitle.js"></script>  

    <div id="myNav" class="overlay">
  <a href="javascript:void(0)" class="closebtn" onclick="closeNav()">&times;</a>
  <div class="overlay-content">
    <a href="#" id="no_point">
  <%
  i=1;
  if(i<=lc){
      out.println("LEVEL 1   "+s1+"  ("+t1/60+" min)");
  }
  else if(i==lc+1){
      out.println("LEVEL1"); //bright
  }
  else{
      out.println("<span id=dull >LEVEL 1</span>"); //dark
  }
  %>
  </a>
  <a href="#" id="no_point">
      <%
        i=2;
  if(i<=lc){
      out.println("LEVEL 2   "+s2+"  ("+t2/60+" min)");
  }
  else if(i==lc+1){
      out.println("LEVEL2"); //bright
  }
  else{
      out.println("<span id=dull >LEVEL 2</span>"); //dark
  }
      %>
  </a>
  <a href="#" id="no_point">
      <%
        i=3;
  if(i<=lc){
      out.println("LEVEL 3   "+s3+"  ("+t3/60+" min)");
  }
  else if(i==lc+1){
      out.println("LEVEL 3"); //bright
  }
  else{
      out.println("<span id=dull >LEVEL 3</span>"); //dark
  }
      %>
  </a>
  <a href="#"id="no_point">
      <%
        i=4;
  if(i<=lc){
      out.println("LEVEL 4   "+s4+"  ("+t4/60+" min)");
  }
  else if(i==lc+1){
      out.println("LEVEL 4"); //bright
  }
  else{
      out.println("<span id=dull >LEVEL 4</span>"); //dark
  }
      %>
  </a>
  <a href="#"id="no_point">
      <%
        i=5;
  if(i<=lc){
      out.println("LEVEL 5   "+s5+"  ("+t5/60+" min)");
  }
  else if(i==lc+1){
      out.println("LEVEL 5"); //bright
  }
  else{
      out.println("<span id=dull >LEVEL 5</span>"); //dark
  }
      %>
      
  </a>
      <%
    }catch(Exception e){
        out.println("error.....<br>"+e);
    }
      %>
  </div>
</div>
  
  <table style="margin-left: 20px;">
      <tr>
          <td class="menus">
              <form method="post" action="Instruction.jsp" onclick="mytime()">
            <input type="hidden" name="time" id="demoi" value="">
            <button class="butson btnPush btnLightBlue but"  type="submit" value="Submit" style="font-size: 20px"/>INSTRUCTIONS</button>
            <!--<input type="submit" align="center" class="bu" value="INSTRUCTIONS..">-->
              </form></div>
              <!--<button align="center" class="but btn-3">INSTRUCTIONS</button>-->
                
              <form method="post" action="leaderboard.jsp" onclick="mytime()">
                  <input type="hidden" name="time" id="demol" value="">
            <!--<input type="submit" class="put" value="LEADER BOARD">-->
            <button class="butson btnPush btnLightBlue cut" type="submit" value="Submit" style="font-size: 20px; margin-top:-33px"/>LEADERBOARD</button><br>
              </div>
              </form>
              <!--<button align="center" class="but btn-3">LEADER BOARD</button>-->
       <!--</tr>-->
       <!--<tr>-->
           <div>
                  <button  class="butson btnPush btnLightBlue dut" style="font-size: 20px" >QUIT GAME</button></div>
          </td>
       </tr>
  </table>    
    
    <script>
function openNav() {
    document.getElementById("myNav").style.height = "100%";
}

function closeNav() {
    document.getElementById("myNav").style.height = "0%";
}

    $(document).ready(function()
                  {
                    $("#hearts").click(function()
                                       {
                                         fadestuff("<span style='font-size: 150px; color: #f00;'>&hearts;</span><br/><span id='demlinkses'><a href='http://arminboss.de' target='_blank'>www.arminboss.de</a></span><br/><br/>");
                                       });
                    
                    $("#clubs").click(function()
                                      {
                                        fadestuff("<span style='font-size: 150px; color: #0f0;'>&clubs;</span>");
                                      });
                    
                    $("#diams").click(function()
                                      {
                                        fadestuff("<span style='font-size: 150px; color: #88f;'>&diams;</span>");
                                      });
                    
                    $("#spades").click(function()
                                       {
                                         fadestuff("<span style='font-size: 150px; color: #f80;'>&spades;</span>");
                                       });
                  });

function fadestuff(cont)
{
  $("#contentses").fadeTo(250,0);
  setTimeout(function()
             {
               $("#contentses").html("<div style='text-align: center'>"+cont+"</div>");
               $("#contentses").append(lipsum());
               $("#contentses").fadeTo(250,1);
             },250);
}

function lipsum()
{
  var words = ["lorem","ipsum","dolor","sit","amet","coloris","et","doloris",
               "ante","primis","quis","ut","pellentesque","interdum","vivamus",
               "bibendum","orci","ac","accusam","philosophus","mansisses"];
  
  var dec = Math.floor(Math.random()*2);
  var res = "Lorem ipsum dolor sit amet, ";				
  
  for(var i=0; i<150; i++)
  {
    if(dec === 1)
    {
      res += words[Math.floor(Math.random()*words.length)] + ". ";
      var inter = words[Math.floor(Math.random()*words.length)];
      res += (inter.charAt(0).toUpperCase() + inter.substring(1)) + " ";
    }
    else
    {
      res += words[Math.floor(Math.random()*words.length)] + " ";
    }
  }
  
  res += words[Math.floor(Math.random()*words.length)] + ".";
  
  return res;
}

</script>
    

    <div id="container">     
        <!--<div class="lead">
        <!--<div class="box-corner top left">-->
        <img class="box-corner top left" src="Image/1.png" alt="" />
        <!--</div>-->
        <!--<div class="box-wire top left lmarg ">-->
        <img class="box-wire" src="Image/chk2.gif" alt="" />
        <!--</div>-->
        <!--<div class="box-wire top right rmarg">3</div>-->
        <!--<div class="box-corner top right">-->
        <img class="box-corner top right" src="Image/1.png" alt="" />
        <!--</div>-->
    
        <!--<div class="box-lr-center middle left">-->
        <img class="box-lr-center middle left b1" src="Image/led.gif" alt="" />
        <img class="box-lr-center middle left b2" src="Image/led.gif" alt="" />
        <img class="box-lr-center middle left b3" src="Image/led.gif" alt="" />
        <img class="box-lr-center middle left b4" src="Image/led.gif" alt="" />
        <img class="box-lr-center middle left b5" src="Image/led.gif" alt="" />
        <img class="box-lr-center middle left b6" src="Image/led.gif" alt="" />
        <img class="box-lr-center middle left b7" src="Image/led.gif" alt="" /> 
        <img class="box-lr-center middle left b8" src="Image/led.gif" alt="" />
        <img class="box-lr-center middle left b9" src="Image/led.gif" alt="" />
        <!--</div>-->
        <div class="box-digit-side left">            
<div class="led led-reds"></div>
<div class="led led-oranges"></div>
<div class="led led-greens"></div>
        </div>
        <div class="box-digit">
            <!--<div class="left dbox1" >-->
            <div class="chip1">
        <form method="post" action="question5.jsp" onclick="mytime()">
            <input type="hidden" name="time" id="demo5" value="">
            <%
            try{
                i=5;
                if(i<=lc)
                {
                    out.println("<input type=submit class=\"button \" value="+ans5+" style=\"background:url(Image/chipof1.gif) no-repeat;font-family: digital-7;\" disabled>");
                }
                else if(i==lc+1)
                {
                    out.println("<input type=submit class=\"button1 btn-5 btn-cursor\" value=\"5th\" style=\"background:url(Image/chipof1.gif) no-repeat;font-family: digital-7;\">");
                }
                else
                {
                    out.println("<input type=\"submit\" class=\"button1 btn-dull\"  value=\"5th\" style=\"background:url(Image/chipof1.gif) no-repeat;font-family: digital-7\" disabled>");
                }
//                 if(ans5!=-1){
//                out.println("<input type=submit class=\"button\" value="+ans5+" style=\"background:url(Image/chipof1.gif) no-repeat;font-family: digital-7;\">");
//            }
//            else{
//                out.println("<input type=\"submit\" class=\"button1\"  value=\"5th\" style=\"background:url(Image/chipof1.gif) no-repeat;font-family: digital-7\">");
//            }
            }catch(Exception e){
                out.println("error......<br>+e");
            }
            %>
            <!--<input type="submit" value="5" style="background:url(Image/chipof1.gif) no-repeat;font-family: digital-7">-->
        </form>
                <!--<div class="transbox1"><a href="#level5"><h1><center>5</center></h1></a></div>-->
            </div>
            <div class="chip2">
        <form method="post" action="question4.jsp" onclick="mytime()">
            <input type="hidden" name="time" id="demo4" value="">
            <%
            try{
                i=4;
                if(i<=lc){
                    out.println("<input type=submit class=\"button \" value="+ans4+" style=\"background:url(Image/chipof1.gif) no-repeat;font-family: digital-7;\" disabled>");
                }
                else if(i==lc+1){
                    out.println("<input type=submit class=\"button1 btn-5 btn-cursor\" value=\"4th\" style=\"background:url(Image/chipof1.gif) no-repeat;font-family: digital-7;\">");
                }
                else{
                    out.println("<input type=\"submit\" class=\"button1 btn-dull\"  value=\"4th\" style=\"background:url(Image/chipof1.gif) no-repeat;font-family: digital-7\" disabled>");
                }
            }catch(Exception e){
                out.println("error......<br>+e");
            }
            %>
        </form>
                <!--<div class="transbox1"><a href="#level4"><h1><center>4</center></h1></a></div>-->
            </div>
            <div class="chip3">
        <form method="post" action="question3.jsp" onclick="mytime()">
            <input type="hidden" name="time" id="demo3" value="">
            <%
            try{
                i=3;
                 if(i<=lc){
                    out.println("<input type=submit class=\"button \" value="+ans3+" style=\"background:url(Image/chipof1.gif) no-repeat;font-family: digital-7;\" disabled>");
                }
                else if(i==lc+1){
                    out.println("<input type=submit class=\"button1 btn-5 btn-cursor\" value=\"3rd\" style=\"background:url(Image/chipof1.gif) no-repeat;font-family: digital-7;\">");
                }
                else{
                    out.println("<input type=\"submit\" class=\"button1 btn-dull\"  value=\"3rd\" style=\"background:url(Image/chipof1.gif) no-repeat;font-family: digital-7\" disabled>");
                }
            }catch(Exception e){
                out.println("error......<br>+e");
            }
            %>
        </form>
                <!--<div class="transbox1"><a href="#level3"><h1><center>3</center></h1></a></div>-->
            </div> 
            <div class="chip4">
        <form method="post" action="question2.jsp" onclick="mytime()">
            <input type="hidden" name="time" id="demo2" value="">
            <%
            try{
                i=2;
               if(i<=lc){
                    out.println("<input type=submit class=\"button \" value="+ans2+" style=\"background:url(Image/chipof1.gif) no-repeat;font-family: digital-7;\" disabled>");
                }
                else if(i==lc+1){
                    out.println("<input type=submit class=\"button1 btn-5 btn-cursor\" value=\"2nd\" style=\"background:url(Image/chipof1.gif) no-repeat;font-family: digital-7;\">");
                }
                else{
                    out.println("<input type=\"submit\" class=\"button1 btn-dull\"  value=\"2nd\" style=\"background:url(Image/chipof1.gif) no-repeat;font-family: digital-7\" disabled>");
                }
            }catch(Exception e){
                out.println("error......<br>+e");
            }
            %>
        </form>
                <!--<div class="transbox1"><a href="#level2"><h1><center>2</center></h1></a></div>-->
            </div>
            <div class="chip5">
        <form method="post" action="question1.jsp" onclick="mytime()">
            <input type="hidden" name="time" id="demo1" value="">
            <%
            try{
                i=1;
                if(i<=lc){
                    out.println("<input type=submit class=\"button \" value="+ans1+" style=\"background:url(Image/chipof1.gif) no-repeat;font-family: digital-7; opacity:0.89;\" disabled>");
                }
                else if(i==lc+1){
                    out.println("<input type=submit class=\"button1 btn-5 btn-cursor\" value=\"1st\" style=\"background:url(Image/chipof1.gif) no-repeat;font-family: digital-7;\">");
                }
                else{
                    out.println("<input type=\"submit\" class=\"button1 btn-dull\"  value=\"1st\" style=\"background:url(Image/chipof1.gif) no-repeat;font-family: digital-7\" disabled>");
                }
            }catch(Exception e){
                out.println("error......<br>+e");
            }
            
            try
            {
               int tim = Integer.parseInt(timer);
               String levelsql="update teams set timeleft= "+tim+" where teamid = "+teamid+" ";
               PreparedStatement ps = con.prepareStatement(levelsql);
               ps.executeUpdate();
               ps.close(); 
            }
            catch(Exception e){
                out.println("error......<br>+e");
            }
            
            %>
        </form>
                <!--<a href="google.com"><div class="transbox1"><h1 >&nbsp;&nbsp;&nbsp;1</h1></div></a>-->
                <!--<div class="blocked"><a href="#level1"><h1><center>X</center></h1></a></div>-->
            </div>             
        </div>
        <div class="box-digit-side right">          
<div class="led led-reds"></div>
<div class="led led-yellows"></div>
<div class="led led-blues"></div>
        </div>
        <!--<div class="box-lr-center middle right">-->
        <img class="box-lr-center middle right b11" src="Image/led.gif" alt="" />
        <img class="box-lr-center middle right b21" src="Image/led.gif" alt="" />
        <img class="box-lr-center middle right b31" src="Image/led.gif" alt="" />
        <img class="box-lr-center middle right b41" src="Image/led.gif" alt="" />
        <img class="box-lr-center middle right b51" src="Image/led.gif" alt="" />
        <img class="box-lr-center middle right b61" src="Image/led.gif" alt="" />
        <img class="box-lr-center middle right b71" src="Image/led.gif" alt="" />
        <img class="box-lr-center middle right b81" src="Image/led.gif" alt="" />
        <img class="box-lr-center middle right b91" src="Image/led.gif" alt="" />
        <!--</div>-->
        
        <div class="box-sec-line left">
            <div class="y1">
               <div class="led-red"></div>
            </div>       
        </div>
        
        <div class="box-sec-line right">   
            <div class="r1">
                <div class="led-red"></div>  
            </div>    
        </div>
        
        <div class="box-third-line left right">
        <div class="inbox-third-line left right">
            <section class="clock">
  <div id="digit-5" class="left tim1 digit">
    <div class="cell"></div>
    <div class="cell"></div>
    <div class="cell"></div>
    <div class="cell"></div>
    <div class="cell"></div>
    <div class="cell"></div>
    <div class="cell"></div>
    <div class="cell"></div>
    <div class="cell"></div>
    <div class="cell"></div>
    <div class="cell"></div>
    <div class="cell"></div>
    <div class="cell"></div>
    <div class="cell"></div>
    <div class="cell"></div>
    <div class="cell"></div>
    <div class="cell"></div>
    <div class="cell"></div>
    <div class="cell"></div>
    <div class="cell"></div>
    <div class="cell"></div>
    <div class="cell"></div>
    <div class="cell"></div>
    <div class="cell"></div>
    <div class="cell"></div>
    <div class="cell"></div>
    <div class="cell"></div>
    <div class="cell"></div>
  </div>
  <div id="digit-4" class="left tim2 digit">
    <div class="cell"></div>
    <div class="cell"></div>
    <div class="cell"></div>
    <div class="cell"></div>
    <div class="cell"></div>
    <div class="cell"></div>
    <div class="cell"></div>
    <div class="cell"></div>
    <div class="cell"></div>
    <div class="cell"></div>
    <div class="cell"></div>
    <div class="cell"></div>
    <div class="cell"></div>
    <div class="cell"></div>
    <div class="cell"></div>
    <div class="cell"></div>
    <div class="cell"></div>
    <div class="cell"></div>
    <div class="cell"></div>
    <div class="cell"></div>
    <div class="cell"></div>
    <div class="cell"></div>
    <div class="cell"></div>
    <div class="cell"></div>
    <div class="cell"></div>
    <div class="cell"></div>
    <div class="cell"></div>
    <div class="cell"></div>
  </div> 
  <div id="digit-bt" class="left light1 btw"> 
    <div class="cell1"></div>
    <div class="cell1"></div>
    <div class="cellb"></div>
    <div class="cell1"></div>
    <div class="cellb"></div>
    <div class="cell1"></div>
    <div class="cell1"></div>
  </div>
  <div id="digit-3" class="left tim3 digit">
    <div class="cell"></div>
    <div class="cell"></div>
    <div class="cell"></div>
    <div class="cell"></div>
    <div class="cell"></div>
    <div class="cell"></div>
    <div class="cell"></div>
    <div class="cell"></div>
    <div class="cell"></div>
    <div class="cell"></div>
    <div class="cell"></div>
    <div class="cell"></div>
    <div class="cell"></div>
    <div class="cell"></div>
    <div class="cell"></div>
    <div class="cell"></div>
    <div class="cell"></div>
    <div class="cell"></div>
    <div class="cell"></div>
    <div class="cell"></div>
    <div class="cell"></div>
    <div class="cell"></div>
    <div class="cell"></div>
    <div class="cell"></div>
    <div class="cell"></div>
    <div class="cell"></div>
    <div class="cell"></div>
    <div class="cell"></div>
  </div>
  <div id="digit-2" class="left tim4 digit">
    <div class="cell"></div>
    <div class="cell"></div>
    <div class="cell"></div>
    <div class="cell"></div>
    <div class="cell"></div>
    <div class="cell"></div>
    <div class="cell"></div>
    <div class="cell"></div>
    <div class="cell"></div>
    <div class="cell"></div>
    <div class="cell"></div>
    <div class="cell"></div>
    <div class="cell"></div>
    <div class="cell"></div>
    <div class="cell"></div>
    <div class="cell"></div>
    <div class="cell"></div>
    <div class="cell"></div>
    <div class="cell"></div>
    <div class="cell"></div>
    <div class="cell"></div>
    <div class="cell"></div>
    <div class="cell"></div>
    <div class="cell"></div>
    <div class="cell"></div>
    <div class="cell"></div>
    <div class="cell"></div>
    <div class="cell"></div>
  </div>
  <div id="digit-bt" class="left light2 btw"> 
    <div class="cell1"></div>
    <div class="cell1"></div>
    <div class="cellb"></div>
    <div class="cell1"></div>
    <div class="cellb"></div>
    <div class="cell1"></div>
    <div class="cell1"></div>
  </div>
  <div id="digit-1" class=" left tim5 digit">
    <div class="cell"></div>
    <div class="cell"></div>
    <div class="cell"></div>
    <div class="cell"></div>
    <div class="cell"></div>
    <div class="cell"></div>
    <div class="cell"></div>
    <div class="cell"></div>
    <div class="cell"></div>
    <div class="cell"></div>
    <div class="cell"></div>
    <div class="cell"></div>
    <div class="cell"></div>
    <div class="cell"></div>
    <div class="cell"></div>
    <div class="cell"></div>
    <div class="cell"></div>
    <div class="cell"></div>
    <div class="cell"></div>
    <div class="cell"></div>
    <div class="cell"></div>
    <div class="cell"></div>
    <div class="cell"></div>
    <div class="cell"></div>
    <div class="cell"></div>
    <div class="cell"></div>
    <div class="cell"></div>
    <div class="cell"></div>
  </div>
  <div id="digit-0" class="left tim6 digit">
    <div class="cell"></div>
    <div class="cell"></div>
    <div class="cell"></div>
    <div class="cell"></div>
    <div class="cell"></div>
    <div class="cell"></div>
    <div class="cell"></div>
    <div class="cell"></div>
    <div class="cell"></div>
    <div class="cell"></div>
    <div class="cell"></div>
    <div class="cell"></div>
    <div class="cell"></div>
    <div class="cell"></div>
    <div class="cell"></div>
    <div class="cell"></div>
    <div class="cell"></div>
    <div class="cell"></div>
    <div class="cell"></div>
    <div class="cell"></div>
    <div class="cell"></div>
    <div class="cell"></div>
    <div class="cell"></div>
    <div class="cell"></div>
    <div class="cell"></div>
    <div class="cell"></div>
    <div class="cell"></div>
    <div class="cell"></div>
  </div>
</section>
        </div>
        </div>
        
        <div class="box-fourth-line left right bottom">
            <div id="progressBar">
            <div></div>
            </div>            
        </div>
    
        <!--<div class="box-corner bottom left">-->
        <img class="box-corner bottom left" src="Image/1.png" alt="" />
        <!--</div>-->
        <!--<div class="box-corner bottom right">-->
        <img class="box-corner bottom right" src="Image/1.png" alt="" />
        <!--</div>-->
    </div>
        <!--</div>-->
        
    </body>
<script>
    
var go=<%=timer%>;
    function progress(timeleft, timetotal, $element) 
    {
        
    var progressBarWidth = timeleft * $element.width() / timetotal;
    $element.find('div').animate({ width: progressBarWidth }, timeleft === timetotal ? 0 : 1000, 'linear');
    if(timeleft > 0) {
        setTimeout(function() {
            progress(timeleft - 1, timetotal, $element);
        }, 1000);
    }
};

progress(go-2, 3600, $('#progressBar'));

var ret = new Date();
ret.setTime(ret.getTime() + go*1000);
var grad = new Date(ret),
  digit0 = $('#digit-0');
  digit1 = $('#digit-1'),
  digit2 = $('#digit-2'),
  digit3 = $('#digit-3'),
  digit4 = $('#digit-4'),
  digit5 = $('#digit-5');

function renderDigit(container, number) {
  var matrix;
  switch(number) {
    case 0:
      matrix = [
        true, true, true, true,
        true, false, false, true,
        true, false, false, true,
        true, false, false, true,
        true, false, false, true,
        true, false, false, true,
        true, true, true, true
      ];
      break;
    case 1:
      matrix = [
        false, false, false, true,
        false, false, false, true,
        false, false, false, true,
        false, false, false, true,
        false, false, false, true,
        false, false, false, true,
        false, false, false, true
      ];
      break;
    case 2:
      matrix = [
        true, true, true, true,
        false, false, false, true,
        false, false, false, true,
        true, true, true, true,
        true, false, false, false,
        true, false, false, false,
        true, true, true, true
      ];
      break;
    case 3:
      matrix = [
        true, true, true, true,
        false, false, false, true,
        false, false, false, true,
        false, true, true, true,
        false, false, false, true,
        false, false, false, true,
        true, true, true, true
      ];
      break;
    case 4:
      matrix = [
        true, false, false, true,
        true, false, false, true,
        true, false, false, true,
        true, true, true, true,
        false, false, false, true,
        false, false, false, true,
        false, false, false, true
      ];
      break;
    case 5:
      matrix = [
        true, true, true, true,
        true, false, false, false,
        true, false, false, false,
        true, true, true, true,
        false, false, false, true,
        false, false, false, true,
        true, true, true, true
      ];
      break;
    case 6:
      matrix = [
        true, true, true, true,
        true, false, false, false,
        true, false, false, false,
        true, true, true, true,
        true, false, false, true,
        true, false, false, true,
        true, true, true, true
      ];
      break;
    case 7:
      matrix = [
        true, true, true, true,
        true, false, false, true,
        false, false, false, true,
        false, false, false, true,
        false, false, false, true,
        false, false, false, true,
        false, false, false, true
      ];
      break;
    case 8:
      matrix = [
        true, true, true, true,
        true, false, false, true,
        true, false, false, true,
        true, true, true, true,
        true, false, false, true,
        true, false, false, true,
        true, true, true, true
      ];
      break;
    case 9:
      matrix = [
        true, true, true, true,
        true, false, false, true,
        true, false, false, true,
        true, true, true, true,
        false, false, false, true,
        false, false, false, true,
        false, false, false, true
      ];
      break;
  }
  var children = container.children();
  var len = matrix.length;
  for (var i = 0; i < len; i++) {
    children.eq(i).toggleClass('on', matrix[i]);
  }
}

var passon;
function render() {
    
  var now = new Date();
  var diff = grad.getTime() - now.getTime();
    
   if(diff<0)
   {
//        document.getElementById("demo").innerHTML = "over !";
   }
   else if(diff>0)
   {
       diff = diff /1000;
       passon = parseInt(diff);
       var seconds = Math.floor(diff%60);
       var res = String(seconds);
       var lens = res.length;
       renderDigit(digit0, Number(res.charAt(lens-1)));
       renderDigit(digit1, Number(res.charAt(lens-2)));

       diff  = diff /60; 
       var minutes = Math.floor(diff% 60);
       var rem = String(minutes);
       var lenm = rem.length;
       renderDigit(digit2, Number(rem.charAt(lenm-1)));
       renderDigit(digit3, Number(rem.charAt(lenm-2)));

       diff  = diff /60; 
       var hours = Math.floor(diff  % 24);  
       var reh = String(hours);
       var lenh = reh.length;
       renderDigit(digit4, Number(reh.charAt(lenh-1)));
       renderDigit(digit5, Number(reh.charAt(lenh-2)));
   
        requestAnimationFrame(render);
   }

}
requestAnimationFrame(render);

function mytime() 
{
    document.getElementById("demo5").value=passon;
    document.getElementById("demo4").value=passon;
    document.getElementById("demo3").value=passon;
    document.getElementById("demo2").value=passon;
    document.getElementById("demo1").value=passon;
    document.getElementById("demoi").value=passon;
    document.getElementById("demol").value=passon;
}
</script>    


    <%
         String nextlevel = (String)request.getAttribute("nextlevel");
        
        if(nextlevel!=null&&!nextlevel.isEmpty()&&nextlevel.equals("block"))
        {
            %>    <div id="snackbar" >CORRECT !! You successfully unlocked next level.</div>     <%
        }    
    %>

<script>
$(function() 
{
  $("#snackbar").delay(0).fadeIn();
});
$(function() 
{
  $("#snackbar").delay(3000).fadeOut();
});
</script>
</html>
