<%
/**
 * Copyright (c) 2000-2006 Liferay, LLC. All rights reserved.
 *
 * Permission is hereby granted, free of charge, to any person obtaining a copy
 * of this software and associated documentation files (the "Software"), to deal
 * in the Software without restriction, including without limitation the rights
 * to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
 * copies of the Software, and to permit persons to whom the Software is
 * furnished to do so, subject to the following conditions:
 *
 * The above copyright notice and this permission notice shall be included in
 * all copies or substantial portions of the Software.
 *
 * THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
 * IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
 * FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
 * AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
 * LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
 * OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE
 * SOFTWARE.
 */
%>
<%@ include file="init.jsp" %>

<form action="<portlet:actionURL />" method="post" name="viewallpartners">

<%
DateFormat dateFormatDateTime = DateFormat.getDateInstance();
String command = request.getParameter("command");
List countryItems = CountryItemDAO.getCountryItems();
List userCountryItems = CountryItemDAO.getCountryItems();
List coverageCountryItems = CountryItemDAO.getCountryItems();
List parentCountryItems = CountryItemDAO.getCountryItems();
List businessTypeItems = BusinesstypeItemDAO.getBusinessTypeItems(); 
List businessTypeItems2 = BusinesstypeItemDAO.getBusinessTypeItems(); 
List sapSolutionItems = SAPSolutionItemDAO.getSAPSolutionItems(); 
List industryItems = IndustryItemDAO.getIndustryItems(); 



if ((command != null) && (command.equals("add") || command.equals("edit"))) {
	int id = 0;
	int userId = 0;
    String userCompanyName = "";
    String userPositionCompany = "";
    String userMobilePhone = "";
    String userWorkPhone = ""; 
	String partnerDescription = ""; 
	int partnerNumber = 1; 
    String telephone = ""; 
    String telefax = ""; 
    String mail = ""; 
    String street1 = ""; 
    String street2 = ""; 
    String zipcode = ""; 
    String city = ""; 
    String state_province = ""; 
    String country = ""; 
	String micrositeAdress = ""; 
	String company_website = "";
	String first_name = "";	
	String last_name = ""	;
	String telephone_user = ""; 	
	String telefax_user = "";	
	String mail_user= "";	
	String street1_user = "";	
	String street2_user = "";	
	String zipcode_user = "";	
	String city_user = "";	
	String state_province_user = "";	
	String country_user = "";
    String noemployees = "" ;
    List geographic_coverage = null; 	
    String parent_company_name = ""; 
    String country_parent_company = ""; 
    String channel_partner_since = ""; 
    String primary_business_type = ""; 	
    String secondary_business_type	= ""; 
    List sap_solution_focus = null; 
    List industry = null; 
    String industry_micro_vertical_focus = ""; 	
    String last_review_Date = ""; 	
    String reviewed_by = ""; 
    String profile_added = ""; 
    String date_updated = ""; 
    String modified_by = ""; 
 
%>

	<input name="command" type="hidden" value="<%= command %>">
	<input name="id" type="hidden" value="<%= id %>">

	<br>

	<input class="portlet-form-button" type="submit" value="Save">


<%
}
else {
//viewall
%>
	<br>
	<input class="portlet-form-button" type="submit" value="Refresh"> 
		
	<br>

	<table class="lfr-table" border="1" cellpadding="4" cellspacing="2" width="100%">
	<tr BGCOLOR="#99CCFF">
		<td width="20%">
			<b>Company Name</b>
		</td>
		<td width="10%">
			<b>Industry</b>
		</td>
		<td width="10%">
			<b>Company logo</b>
		</td>
		<td>
			<b>Company size</b>
		</td>
		<td>
			<b>Primary country</b>
		</td>
		<td>
			<b>Primary region</b>
		</td>
		<td>
			<b>Primary business type</b>
		</td>
		<td>
			<b>Country coverage</b>
		</td>
		<td>
			<b>SAP solution</b>
		</td>
	</tr>

	<%
	List companyItems = null;
	companyItems = CompanyItemDAO.getCompanyItems();
	
	int count = companyItems.size();
	boolean even = false;
	for (int i = 0; i < 2*companyItems.size(); i++) {
		CompanyItem companyItem = (CompanyItem)companyItems.get(i/2);
		even = (i%2 == 0);
	%>
		<% if (even){ 
		%>
		<tr>
			<td class = "fontweightbolder">
				<%= companyItem.getName() %>
			</td>
			<td>
				<%= CompanyUtil.getCompanyIndustries(companyItem) %>
			</td>
			<td>
				<!--  <img src='showImage?id="<%=i%>"'> -->
				<%if (((i/2)%4 == 0)&& (i<8)) {%>
				<IMG SRC="<%=request.getContextPath()%>/Logo/1.jpg" ALT="logo" HEIGHT = 30>
				<% } else if (((i/2)%4 == 1) && (i<8)) {%>
				<IMG SRC="<%=request.getContextPath()%>/Logo/2.gif" ALT="logo" HEIGHT = 30>
				<% } else if (((i/2)%4 == 2)&& (i<8)) {%>
				<IMG SRC="<%=request.getContextPath()%>/Logo/3.jpg" ALT="logo" HEIGHT = 30>
				<% } else if (((i/2)%4 == 3) && (i<8)){%>
				<IMG SRC="<%=request.getContextPath()%>/Logo/4.png" ALT="logo" HEIGHT = 30>
				<% } %>
			</td>
			<td>
				<% if (companyItem.getCompanyEmpNo() > 0){ 
				%>
				<%= companyItem.getCompanyEmpNo() %>
				<%} else  {%>
				<b></b>
				<% 
				} 
				%>
				
			</td>
			<td>
				<%= CompanyUtil.getCompanyCountryName(companyItem) %>
			</td>
			<td>
				<%= CompanyUtil.getCompanyRegionName(companyItem) %>
				<!--  -->
			</td>
			<td>
				<%= CompanyUtil.getCompanyBusinessSolution(companyItem.getId(), 1) %>
			</td>
			<td>
				<%= CompanyUtil.getCompanyCountryCoverageString(companyItem) %>
			</td>
			<td>
				<%= CompanyUtil.getCompanySAPSolution(companyItem) %>
			</td>
		</tr>
		<%} else  {%>
		<tr>
		<TH colspan="9" style="font-size: 8pt; font-weight: normal">
		<% if(companyItem.getDescription() != null) {%>
				<%= companyItem.getDescription().substring(0, java.lang.Math.min(200,companyItem.getDescription().length()))+"..." %>
				<%}else {%>
				<b></b>
				<%}%>
				</TH>
		</tr>
		<%
		}
		%>

	<%
	}
	%>

	</table>

<%
}
%>

</form>