<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
</head>


<%@ page language="Java" import="java.sql.*" %>   
<jsp:useBean id="db" scope="request" class="com.icuas.view.DbBean1" /> 
<jsp:setProperty name="db" property="*" /> 


<%
ResultSet rs,rsp;
Boolean found;
int bedID=1;
try{
db.connect();
bedID=Integer.parseInt(request.getParameter("bedID"));
//inserting values to the course table
//db.updateSQL("insert into course values('JOHNSY','JOHNS','B-56','PR-160')");
}catch(Exception e){e.printStackTrace();}
rs=db.execSQL("SELECT P.FIRST_NAME,P.LAST_NAME, P.AGE, P.PHOTO_PATH,D.DISEASE,D.REMARKS AS DISEASE_REMARKS,PA.ADMIT_TYPE,PA.RISKS,PA.CHECKIN_TIME AS PA_ADMIT_CHECKIN_TIME FROM ICU_ADMIT IA JOIN ICU_BED IB ON IA.ICU_ADMIT_ID=IB.ICU_ADMIT_ID AND IA.ICU_BED_ID=IB.ICU_BED_ID JOIN PATIENT_ADMIT PA ON IA.PATIENT_ADM_ID=PA.PATIENT_ADM_ID JOIN PATIENT P ON PA.PATIENT_ID=P.PATIENT_ID LEFT JOIN DISEASE D ON D.DISEASE_ID= PA.DISEASE_ID WHERE IA.ICU_BED_ID="+bedID);
//if(!found){out.println("BED NO:"+bedID+"IS UNOCCUPIED");}
//else{
//rsp=db.execSQL("select * from patient where bedno ='B01' ");
String name,img,al,age,dis,on,to;

while(rs.next())
{	
name=rs.getString("first_name")+" "+rs.getString("last_name");
img=rs.getString("photo_path");
age=rs.getString("age");
al=rs.getString("risks");
dis=rs.getString("disease");
on=rs.getString("pa_admit_checkin_time");
to=rs.getString("admit_type");
%>
<body>
<center>
<h1><font color="blue">ICUAS-JMMC</font></h1>
<table>
<tr>
<td rowspan="7"><img src=<%=img%> width="160" height="170"></td>
<td>NAME::</td>  <td><font color="blue"><%=name%></font></td></tr>

<tr><td>AGE::</td> <td><font color="blue"><%=age%></font></tr>
<tr><td>ALLERGIES/RISKS::</td><td><font color="red"><%=al%></font></tr>
<tr><td>BED NO::</td> <td><font color="blue"><%=bedID%></font></tr>
<tr><td>CAUSE::</td> <td><font color="blue"><%=dis%></font></tr>
<tr><td>ADMITTED ON::</td> <td><font color="blue"><%=on%></font></tr>
<tr><td>ADMITTED TO::</td> <td><font color="blue"><%=to%></font></tr>
</table>
<%}%>

</center>
</body>
</html>