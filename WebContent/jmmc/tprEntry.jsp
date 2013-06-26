<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@page import="java.util.Random"%>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
</head>


<%@ page language="Java" import="java.sql.*,java.util.Date,com.icuas.view.DbBean2"%>   
<jsp:useBean id="db" scope="request" class="com.icuas.view.DbBean2" /> 
<jsp:setProperty name="db" property="*" /> 
<body>

<%
db.connect();
int mID,pressSys,pressDys,heartRate;
float temp,oxyContent;
String pID;
Date timeSt=new Date();

mID=1;
pID="b01";

//mID=request.getParameter("mID");

//pID=request.getParameter("pID");
temp=Float.parseFloat(request.getParameter("temp"));
heartRate=Integer.parseInt(request.getParameter("heartRate"));
pressSys=Integer.parseInt(request.getParameter("pressSys"));
pressDys=Integer.parseInt(request.getParameter("pressDys"));
oxyContent=Float.parseFloat(request.getParameter("oxyContent"));

out.println("yyyy"+temp);


try{
PreparedStatement pst;
pst=db.PreStmt("insert into bed_side_monitor_tpro values(?,?,?,?,?,?,?,?);");
pst.setInt(1, mID);
pst.setTimestamp(2, new Timestamp(DbBean2.getCurrentDateWithoutMilliseconds().getTime()));
pst.setString(3, pID);
pst.setFloat(4,temp);
pst.setInt(5,pressSys);
pst.setInt(6,pressSys);
pst.setInt(7,heartRate);
pst.setFloat(8,oxyContent);
pst.executeUpdate();
}catch(Exception e){e.printStackTrace();}



/*try{
PreparedStatement pst;
pst=db.PreStmt("insert into bed_side_monitor_tpro values(?,?,?,?,?,?,?,?);");
pst.setInt(1, 1);
pst.setTimestamp(2, new Timestamp(DbBean2.getCurrentDateWithoutMilliseconds().getTime()));
pst.setString(3, "b01");
pst.setFloat(4,60);
pst.setInt(5,100);
pst.setInt(6,100);
pst.setInt(7,80);
pst.setFloat(8,89);
pst.executeUpdate();
}catch(Exception e){e.printStackTrace();}*/


%>
</center>
</body>
</html>