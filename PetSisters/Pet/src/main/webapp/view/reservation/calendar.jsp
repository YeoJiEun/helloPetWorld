﻿<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.util.Date"%>
<%@page import="java.util.Calendar"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c"   uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page import="java.io.*,javax.servlet.*,java.util.*,com.example.pet.service.*,com.example.pet.domain.*,org.springframework.context.*,org.springframework.context.support.*" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<%
	request.setCharacterEncoding("UTF-8");

	int action = 0; //up(1) down(0)
	int currYear = 0;
	int currMonth = 0;
	String boxSize = "70";

	Calendar c = Calendar.getInstance();
	Calendar cal = Calendar.getInstance();

	if(request.getParameter("action") == null) {
    	currMonth = c.get(Calendar.MONTH);
     	currYear = c.get(Calendar.YEAR);
     	cal.set(currYear,currMonth,1);
	} else {
    	if(request.getParameter("action") != null){
        	currMonth = Integer.parseInt(request.getParameter("month"));
          	currYear = Integer.parseInt(request.getParameter("year"));
         
          	if(Integer.parseInt(request.getParameter("action"))==1) {
            	cal.set(currYear, currMonth, 1);
               	cal.add(Calendar.MONTH, 1); //다음달
               	currMonth = cal.get(Calendar.MONTH);
               	currYear = cal.get(Calendar.YEAR);
              
          	} else {              
            	cal.set(currYear, currMonth, 1);
               	cal.add(Calendar.MONTH, -1); //이전달
               	currMonth = cal.get(Calendar.MONTH);
               	currYear = cal.get(Calendar.YEAR);         
          	}
     	}
	}
%>
<%!
	// 표시할 날짜와 입력된 날짜가 같은지 확인하는 메소드
	public boolean sameDate(Calendar c, int dispDay, Date d)
	{
		if(d.getYear() != c.get(Calendar.YEAR))
			return false;
		if(d.getMonth() != c.get(Calendar.MONTH))
			return false;
		if(d.getDate() != dispDay)
			return false;
		return true;
	}

	// 입력한 날짜가 올바른지 확인하는 메소드
     public boolean isDate(int y, int m, int d) {
          m -= 1;
          Calendar c = Calendar.getInstance();
          c.setLenient(false);
         
          try {
               c.set(y, m, d);
               Date dt = c.getTime(); 
          } catch(IllegalArgumentException e) {
               return false;
          }
          return true;
     }

     public String getTitle(Calendar cal){    
	   SimpleDateFormat sdf = new SimpleDateFormat("yyyy년 MM월");
       return sdf.format(cal.getTime());   
     }
%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html class='no-js' >
	<head>
      <meta http-equiv="X-UA-Compatible" content="IE=edge">
      <meta name="viewport" content="width=device-width, initial-scale=1">
      <!-- The above 3 meta tags *must* come first in the head; any other head content must come *after* these tags -->
   
      <title>예약하기</title>
      
      <!--[if lt IE 9]>
        <script src="//html5shim.googlecode.com/svn/trunk/html5.js"></script>
      <![endif]-->
      
      <link rel='stylesheet' type='text/css' href='<c:url value="/resources/bootstrap/css/bootstrap.min.css" />' />
      <link rel='stylesheet' type='text/css' href='<c:url value="/resources/css/ionicons.min.css" />' />
      
      <link rel='stylesheet' type='text/css' href='<c:url value="/resources/css/owl.carousel.css" />' />
      <link rel='stylesheet' type='text/css' href='<c:url value="/resources/css/owl.theme.css" />' />
      <link rel='stylesheet' type='text/css' href='<c:url value="/resources/css/owl.transitions.css" />' />
      <link rel='stylesheet' type='text/css' href='<c:url value="/resources/css/magnific-popup.css" />' />
      <link rel='stylesheet' type='text/css' href='<c:url value="/resources/css/style.css" />' />
      <link rel='stylesheet' type='text/css' href='<c:url value="/resources/css/color-default.css" />' />
      
      <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
      <script type="text/javascript">
     	 var loc;
		  
		  function findDate() {
			var findval = document.getElementById('r_date').value;
			
			if(findval)
				loc = findval;
			
			System.out.println(findval);
		  }
		  function insertReservation() {
			  form.submit();
		  }
	  </script>
		
      <style>
        #calendarTable, #calendarTable th, #calendarTable td   {
        	border-collapse: collapse;              
    	} 
    
    	#calendarTable {
      	  	border:2px solid #000;
        	width:519px;
    	}
    
    	#calendarTable th, #calendarTable td {
        	width: <%=boxSize%>px;
        	border:1px solid #000;        
        	border-collapse: collapse;
        	padding: 5px;        
    	}
    
    	#calendarTable th {        
       	 	background-color: #666;
        	color: #fff;
	    }    
    
    	#calendarTable td {        
        	height: <%=boxSize%>px;
        	text-align : left;            
    	}
    
    	#calendarTable td.empty {
        	background-color: #DFDCD8;
    	}
    
    	#calendarTable td.toDayColor {
        	background-color: #6C7EAA;
    	}
      </style>
	</head>

	<body bgcolor='white'>
  	  <!--=============================================================================
         Preloader
      ===============================================================================-->
      <div id='preloader' >
         <div class='loader' >
            <img src='<c:url value="/resources/img/load.gif" />' alt='symp' />
         </div>
      </div>
      
      <!--=============================================================================
         Main Wrapper
      ===============================================================================-->
      <div id='wrapper' >
         
      <%@ include file="/view/include/navbar.jsp"%>   
      
      <div class='portfolio-block section-block' >   
       <div class='container' >
        <div class='row' >
         <div class='col-md-6 col-md-offset-3' >
          <div class='section-header text-center' >
           <h2 class='animate text-over-block' >예약하기</h2>
		   
		   <br>

		   <table width="521" align="center" cellpadding="0" cellspacing="0">
  			  <tr>
     			<td width='150' align='right' valign='middle'>
         		  <a href="calendar.jsp?month=<%=currMonth%>&year=<%=currYear%>&action=0">
               	    <font size="2">이전달</font>
         		  </a>
     			</td>
     			<td width='260' align='center' valign='middle'>
         		  <b><%= getTitle(cal)%></b>
     			</td>
     			<td width='173' align='left' valign='middle'>
         		  <a href="calendar.jsp?month=<%=currMonth%>&year=<%=currYear%>&action=1">
             		<font size="2">다음달</font>
         		  </a>
    			</td>
  			  </tr>
			</table>
			
			<br>

			<table align="center">
  			  <tr>         
  				<td width="100%" >
    			  <table id="calendarTable" align="center">
       				<tr>
              		  <th>일</th>
              		  <th>월</th>
              		  <th>화</th>
              		  <th>수</th>
              		  <th>목</th>
              		  <th>금</th>
              		  <th>토</th>                      
       				</tr>
     
					<%  // Calendar loop
 					  int currDay;
					  String todayColor = "";
					  int count = 1;
					  int dispDay = 1;

     				  for (int w = 1; w < 7; w++) {
     					out.println("<tr>");
					
          				for (int d = 1; d < 8; d++) {
               			  if (!(count >= cal.get(Calendar.DAY_OF_WEEK))) {
               				out.println("<td class='empty'>&nbsp;</td>");
                    		count += 1;
               			  } else {
  						    if (isDate (currYear, currMonth + 1,dispDay) ) { // use the isDate method
  	                    	  todayColor = "";
                           
                              if (dispDay == c.get(Calendar.DAY_OF_MONTH) && c.get(Calendar.MONTH) == cal.get(Calendar.MONTH) 
                                     									  && c.get(Calendar.YEAR) == cal.get(Calendar.YEAR)) { //오늘
                                todayColor = "class='toDayColor'";
                           	  } else {                      	  	                        	 
                       		/*    for(Schedule sArr : scheduleArr)
                       		    {
                       		    	System.out.println("sArr: "+sArr.getS_date());
	     	                        if(sameDate(c, dispDay, sArr.getS_date()))
	     	                        {
	     	                        	todayColor = "class='empty'";
	     	                        }
                             	}*/
                         	  }

                           	  String nowDate = currYear +"-"+(currMonth+1)+"-"+dispDay; 
	                      	  String later ="F" ;
                         
	                      	  if(dispDay > c.get(Calendar.DAY_OF_MONTH) || (currMonth) >  c.get(Calendar.MONTH) )
                     		    later = "T";
                         
	                      	  if((currMonth) <  c.get(Calendar.MONTH))
                        	    later ="F";                        
					%>				
          					  <td <%=todayColor%>><%=dispDay%><br>
          						<c:set var="todayMonth" value="<%=c.get(Calendar.MONTH) %>" />
								<c:set var="todayDate" value="<%=cal.get(Calendar.DAY_OF_MONTH) %>" />
 								<c:set var="date" value="<%=later %>" />
 		 						<c:set var="mon" value="<%=(currMonth+1) %>" />
     							<c:set var="now" value="<%=nowDate %>" />
    							
    							<form name="form"  action="<c:url value='/reservation/insert/real/${b_num}'/>">
        						  <c:set var="have" value="F" />
	      						  
	      						  <c:forEach var="sche" items="${schedule}">
		       						<c:if test="${sche.s_date eq now}">
		       						  <c:set var="have" value="T"/>
		       						</c:if> 
	        					  </c:forEach>
        		
        						  <c:if test="${have eq 'F' && date eq 'T' }" >
        							<input type="radio" name="r_date" id="r_date" value="<%=currYear%>-<%=currMonth+1%>-<%=dispDay %>" />
       			 				  </c:if>
        						</form>
          					  </td>
					<%
                         	  count += 1;
                              dispDay += 1;
						    } else {
						    	out.println("<td class='empty'>&nbsp;</td>");					
                    		}
               			  }
       					}
          				
          				out.println("</tr>");
					  }
					%>
    			  </table>
                </td>
     		  </tr>
			</table>
			
			<br>

			<div class='section-header text-center' >
			  <input type="submit" value="예약" onclick="insertReservation()" class="btn btn-default btn-lg">
			</div>
 
  		  </div>
  	  	 </div>
  		</div>
  	   </div>
      </div>
      </div>
	</body>
</html>