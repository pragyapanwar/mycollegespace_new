<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>

<html>


    <title>COLLEGE SPACE</title>
  <style>
body {
    font-family: "Lato", sans-serif;
}

.table, td, th {    
    border: 1px solid #ddd;
    text-align: left;
}

.table {
    border-collapse: collapse;
    width: 100%;
}

.sidenav {
    height: 100%;
    width: 0;
    position: fixed;
    z-index: 1;
    top: 0;
    left: 0;
    background-color: #111;
    overflow-x: hidden;
    transition: 0.5s;
    padding-top: 60px;
}

.sidenav a {
    padding: 8px 8px 8px 32px;
    text-decoration: none;
    font-size: 25px;
    color: #818181;
    display: block;
    transition: 0.3s
}

.sidenav a:hover, .offcanvas a:focus{
    color: #f1f1f1;
}

.sidenav .closebtn {
    position: absolute;
    top: 0;
    right: 25px;
    font-size: 36px;
    margin-left: 50px;
}

@media screen and (max-height: 450px) {
  .sidenav {padding-top: 15px;}
  .sidenav a {font-size: 18px;}
}
</style>  
    <meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="http://www.w3schools.com/lib/w3.css">
<link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Raleway">
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.6.3/css/font-awesome.min.css">
<style>
body,h1,h2,h3,h4,h5,h6 {font-family: "Raleway", sans-serif}
.sidenav a,.sidenav h4 {font-weight:bold}
</style>
    <head>
       
        <title>COLLEGE SPACE</title>
        <style>
input[type=text] {
    width: 130px;
    box-sizing: border-box;
    border: 2px solid #ccc;
    border-radius: 4px;
    font-size: 16px;
    background-color: white;
    background-image: url('searchicon.png');
    background-position: 10px 10px;
    background-repeat: no-repeat;
    padding: 12px 20px 12px 40px;
    -webkit-transition: width 0.4s ease-in-out;
    transition: width 0.4s ease-in-out;
}

input[type=text]:focus {
    width: 100%;
}
</style>
        <style>
ul {
    list-style-type: none;
    margin: 0px;
    padding: 0;
    overflow: hidden;
    background-color: #333;
}

li {
    float: left;
}

li a {
    display: block;
    color: white;
    text-align: center;
    padding: 14px 16px;
    text-decoration: none;
}

li a:hover {
    background-color: #111;
}
</style>
        
        <style>
            header {
    background-color:  #262626;
    
}
.main-header {
 text-align: center;
}

header h1 {
    text-align: center;
    margin: 0;
    
}
header h2 {
    text-align: center;
    margin: 0;
    
    
}

html, body {
    margin: 0;
    padding: 0;
}
            body{
                background-color:#4d4d4d;
            }
        </style>
    </head>
    <style>
body {
   font-family: "LATO" ,sans-serif;
}


</style>

    <body>
        <ul>
  <li><a class="active" href="#home">Home</a></li>
  <li><a href="#news">News</a></li>
  <li><a href="#contact">Contact</a></li>
  <li><a href="#about">About</a></li>
</ul> 
        
       <header>
           
           <div id="mySidenav" class="sidenav">
  <a href="javascript:void(0)" class="closebtn" onclick="closeNav()">&times;</a>
  <a href="#">Notice </a>
  <a href="#">Timetable</a>
  <a href="#">Datesheets</a>
  <a href="#">Results</a>
    <a href="#">Notes</a>
      <a href="#">Exam Papers</a>
        <a href="#">Academics</a>
          <a href="#">Syllabus</a>
            <a href="#">Internship</a>
             
               
</div>
           
           <div style="overflow: hidden;float: left;margin-top: 30px;padding-left: 40px;"><span style="font-size:30px;cursor:pointer" onclick="openNav()">&#9776; </span></div>
           <div style="overflow: hidden;">
    <h1 style ="color:#ffffff"><b>WEB BULLETIN</b></h1>
    <h2 style ="color:#ffffff">college space </h2>
           </div>

       </header>


        


<script>
function openNav() {
    document.getElementById("mySidenav").style.width = "250px";
}

function closeNav() {
    document.getElementById("mySidenav").style.width = "0";
}
</script>
     <form>
  <input type="text" name="search" placeholder="Search..">
</form>


        <div style="position: absolute;">
            <div style="float: left;overflow:hidden;margin-left:100px;height: 400px;width: 400px;background-color: white;">
                <center><h1>TABLES</h1></center>
                <div style="text-align: center;">
<table border="1" align="center" id="table">
<thead>
<tr>
<th style="text-align: center;">Branch</th>
<th style="text-align: center;">Time Tables</th>
</tr>
</thead>
<tbody>
<tr>
<td style="text-align: center;">CSE</td>
<td style="text-align: center;">DOWNLOAD</td>
</tr>
<tr>
<td style="text-align: center;">IT</td>
<td style="text-align: center;">DOWNLOAD</td>
</tr>
<tr>
<td style="text-align: center;">ECE</td>
<td style="text-align: center;">DOWNLOAD</td>
</tr>
<tr>
<td style="text-align: center;">B.ARCH</td>
<td style="text-align: center;">DOWNLOAD</td>
</tr>
<tr>
<td style="text-align: center;">MAE</td>
<td style="text-align: center;">DOWNLOAD</td>
</tr>
<tr>
<td style="text-align: center;">M.TECH</td>
<td style="text-align: center;"> To be uploaded</td>
</tr>
</tbody>
</table>
</div>
			
            </div>
            
            <div style="overflow:hidden; margin-left:400px;overflow-y: scroll;height: 400px;width: 600px;background-color: white;">
                <center><h1>CONTENTS</h1></center>
                <table style="margin-left: 50px;">
                    <tr>
                        <td><img src ="http://updates.collegespace.in/wp-content/uploads/2016/11/1.2.jpg"style="width:400px;height:400px;" /></td>
                    </tr>
                    <tr>
                        <td><img src ="http://updates.collegespace.in/wp-content/uploads/2016/11/1.3.jpg"style="width:400px;height:400px;" /></td>
                    </tr>
                    <tr>
                        <td><img src ="http://updates.collegespace.in/wp-content/uploads/2016/11/1.3.jpg"style="width:400px;height:400px;" /></td>
                    </tr>
                    <tr>
                        <td><img src ="http://updates.collegespace.in/wp-content/uploads/2016/11/1.3.jpg" style="width:400px;height:400px;"/></td>
                    </tr>
                    <tr>
                        <td><img src ="http://updates.collegespace.in/wp-content/uploads/2016/11/3.1.jpg"style="width:400px;height:400px;"/></td>
                    </tr>
                    <tr>
                        <td><img src ="http://updates.collegespace.in/wp-content/uploads/2016/11/3.1.jpg"style="width:400px;height:400px;" /></td>
                    </tr>
                    <tr>
                        <td><img src ="http://updates.collegespace.in/wp-content/uploads/2016/11/3.3.jpg"style="width:400px;height:400px;" /></td>
                    </tr>
                    <tr>
                        <td><img src ="http://updates.collegespace.in/wp-content/uploads/2016/11/3.3.jpg"style="width:400px;height:400px;" /></td>
                    </tr>
                    <tr>
                        <td><img src ="http://updates.collegespace.in/wp-content/uploads/2016/11/3.3.jpg"style="width:400px;height:400px;" /></td>
                    </tr>
                    <tr>
                        <td><img src ="http://updates.collegespace.in/wp-content/uploads/2016/11/3.3.jpg"style="width:400px;height:400px;" /></td>
                    </tr>
                </table>            
            </div>            
        </div> 

    </body>

</html>
