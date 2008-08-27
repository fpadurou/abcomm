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

