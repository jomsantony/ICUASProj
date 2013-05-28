
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head></head>
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
rs=db.execSQL("SELECT P.FIRST_NAME,P.MIDDLE_NAME,P.LAST_NAME, P.AGE, P.PATIENT_ADDRESS, P.CITY, P.STATE,P.PIN,P.COUNTRY,P.SEX,P.LANDLINE,P.MOBILE,P.PHOTO_PATH,D.DISEASE,D.REMARKS AS DISEASE_REMARKS,PA.ADMIT_TYPE, PA.DOCTOR_IN_CHARGE,PA.DISEASE_ID,PA.REMARKS AS PA_ADMIT_REMARKS, PA.CHECKIN_TIME AS PA_ADMIT_CHECKIN_TIME, IA.REMARKS AS ICU_ADMIT_REMARKS,IA.CHECKIN_TIME AS ICU_ADMIT_CHECKIN_TIME FROM ICU_ADMIT IA JOIN ICU_BED IB ON IA.ICU_ADMIT_ID=IB.ICU_ADMIT_ID AND IA.ICU_BED_ID=IB.ICU_BED_ID  JOIN PATIENT_ADMIT PA ON IA.PATIENT_ADM_ID=PA.PATIENT_ADM_ID JOIN PATIENT P ON PA.PATIENT_ID=P.PATIENT_ID LEFT JOIN DISEASE D ON D.DISEASE_ID= PA.DISEASE_ID  WHERE IA.ICU_BED_ID=1");
//if(!found){out.println("BED NO:"+bedID+"IS UNOCCUPIED");}
//else{
//rsp=db.execSQL("select * from patient where bedno ='B01' ");
String addr,city,pin,state,country,landline,mobile,disease_remarks,admit_remarks,icu_admit_remarks;

while(rs.next())
{	
addr=rs.getString("patient_address");
city=rs.getString("city");
pin=rs.getString("pin");
state=rs.getString("state");
country=rs.getString("country");
landline=rs.getString("landline");
mobile=rs.getString("mobile");
disease_remarks=rs.getString("disease_remarks");
admit_remarks=rs.getString("pa_admit_remarks");
icu_admit_remarks=rs.getString("icu_admit_remarks");
%>

<body >
<center>
<h1><font color="blue">ICUAS-JMMC</font></h1>
<img src="pd.png" width="200" height="50"><br><br><br>
 <iframe src="http://192.168.2.8:8080/ICUASProj/jmmc/Vitals.jsp?bedID=1" width="500" height="300"></iframe><br><br><br>
 
 
 <dl>
<dt><h3>PATIENT ADDRESS</h3></dt>
<dd><font color="blue">
<%=addr%><br>
<%=city%><br>
<%=state %><br>
<%=pin %><br>
<%=country%><br>
</font>
</dd>
<dt><h3>CONTACT DETAILS</h3></dt>
<dd><font color="blue">
<%=landline%><br>
<%=mobile%><br>
</font>
</dd>
<dt><h3>ADMITT REMARKS</h3></dt>
<dd>DISEASE REMARKS:<br>

<font color="blue">
<%=disease_remarks%></font><br>

ADMIT REMARKS:<br>

<font color="blue">
<%=admit_remarks%><br>
</font>

ICU ADMIT REMARKS:<br>

<font color="blue">
<%=icu_admit_remarks%><br>
</font>


</dd>
</dl>
<%}%>
</center>
</body>
</html>
