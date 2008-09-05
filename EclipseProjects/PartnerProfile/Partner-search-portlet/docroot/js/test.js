<script language="javascript" type="text/javascript"> 

function dge_DrawNextPrevPagesEx ( int from, int pageCount, int foundCount, String strLink, String name, String coment )
    prevIdx = from - pageCount
	nextIdx = from + pageCount
	
	If prevIdx < 1 Then 
		prevIdx = 1
	End If

    pageCount = from + pageCount - 1
	If pageCount > foundCount Then
		pageCount = foundCount
	End If

	If foundCount <= 0 Then
		from = 0
	End If
%>
 <table border="0" width="100%" cellspacing="0" cellpadding="0">
 <tr>
 <td width="122"><span class="BodyTitleText">&nbsp;</span>
 <%If from > 1 Then %>
	 <b><font face="Tahoma" color="#16404B" size="1">
	 <A HREF="<%=strLink%><%=prevIdx%>">&lt;&lt;Previous</A>
	</font></b>
 <%End If%>
</td>
 <td width="469" valign="bottom">
 <p align="center"><b><font face="Tahoma" size="2" color="#16404B"><%=name%>&nbsp;<%=from%> - <%=pageCount%> of <%=foundCount%>&nbsp;<%=coment%></font></b></td>
 <td width="129">
 <p align="right">
<%If pageCount < foundCount Then %>
	<b><font face="Tahoma" color="#16404B" size="1"><A HREF="<%=strLink%><%=nextIdx%>">Next
	&gt;&gt;</A></font></b>
 <%End If%>
 </td>
 </tr>
 </table>
 <%End Sub%>


function validateForm(compprofile)
{

if(""==document.forms.compprofile.userCompanyName.value)
{
alert("Please enter your full name.");
return false;
}else
{alert("E bine.");
}return true;
}

if(""==document.forms.compprofile.email.value)
{
alert("Please enter your email address.");
return false;
}

if(""==document.forms.compprofile.phoneNum.value)
{
alert("Please enter your phone number.");
return false;
}

}
</script>

  1:<%@include  file="header.jsp"%>
   2:<%@ page import="java.util.List" %>
   3:<%@ page import="java.util.Iterator" %>
   4:<p align="center"><font size="+1" color="navy">
   5:    <b><%=renderRequest.getPortletSession().getAttribute("title")%></b></font>
   6:</p>
   7:<table align="center" width="80%" border="0" cellspacing="0" cellpadding="0" >
   8:<thead>
   9:    <tr>  
  10:<%
  11://Show column headings here:
  12:String [] queryColumns =  (String [])renderRequest.getPortletSession().getAttribute("queryColumns");
  13:
  14:int tableCols = queryColumns.length;
  15://Display column headings:
  16:for(int i = 0; i < queryColumns.length;i++) {
  17:%>
  18:    <th><b><%=queryColumns[i]%></b></th>
  19:<%}%>
  20:    </tr>
  21:</thead>
  22:<tbody>
  23:<%
  24://Display the table data:
  25:List queryData =  (List)renderRequest.getPortletSession().getAttribute("queryData");
  26:%>
  27:    <tr>
  28:        <td colspan=<%=tableCols%>><hr color="navy"></td>
  29:    </tr>
  30:<%
  31:String colorTR = "#EEEEEE";
  32:Iterator it = queryData.iterator();
  33:it = queryData.iterator();
  34:while(it.hasNext()) { %>
  35:    <tr bgcolor="<%=colorTR%>">
  36:<% 
  37:   if(colorTR.equals("#EEEEEE")) {
  38:     colorTR = "#FFFFFF";
  39:   }else{
  40:    colorTR = "#EEEEEE";
  41:   }
  42:   String[] rec = (String[])it.next();
  43:   for(int i = 0; i < rec.length;i++) {
  44:%>
  45:    <td align="center"><%=rec[i]%></td>
  46:<%}%>
  47:    </tr>
  48:<%}%>
  49:    <tr>
  50:        <td colspan=<%=tableCols%>>
  51:            <hr color="navy">
  52:        </td>
  53:    </tr>
  54:</tbody>
  55:</table>
