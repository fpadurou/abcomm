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

<SCRIPT TYPE="text/javascript">
<!--
function submitconfirm(compprofile)
{
	if(""==document.forms.compprofile.userCompanyName.value)
	{
	alert("Please enter a company name.");
	return false;
	}
	return true;
}
//-->
</SCRIPT>


<form action="<portlet:actionURL />" method="post" name="compprofile" onSubmit="return submitconfirm(this)">

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
String ANY = "-------------------------Any-------------------------";


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
	if (renderRequest.getWindowState().equals(WindowState.MAXIMIZED)) {
	%>

		<script type="text/javascript">
			document.compprofile.userCompanyName.focus();
		</script>
	<%
	}
	%>

<%
}
else {
	String industrySearch ="";
	industrySearch = request.getParameter("industrySearch");
//search + viewall
%>

<%
String industry_search_liv= request.getParameter("industry_search");
String sapsol_search_liv= request.getParameter("sap_solution_focus_search");
String country_search_liv= request.getParameter("country_search");
String country_coverage_search_liv= request.getParameter("country_coverage_search");
String primary_business_type_search_liv= request.getParameter("primary_business_type_search");
String name_search_liv= request.getParameter("name_search");
if(name_search_liv == null)
	name_search_liv = "";
	
String desc_search_liv= request.getParameter("desc_search");
if(desc_search_liv == null)
	desc_search_liv = "";

PrintWriter pout=null;
pout = response.getWriter();
pout.write("<BR> Search by: ");
if((name_search_liv != null) && !name_search_liv.equalsIgnoreCase(""))
	pout.write(" partner name --> " + name_search_liv);
if((desc_search_liv != null) && !desc_search_liv.equalsIgnoreCase(""))
	pout.write(" partner description --> " + desc_search_liv);
if((industry_search_liv != null) && !industry_search_liv.equalsIgnoreCase(ANY))
	pout.write(" industry --> " + industry_search_liv);
if((sapsol_search_liv != null) && !sapsol_search_liv.equalsIgnoreCase(ANY))
	pout.write(" sap solution --> " + sapsol_search_liv);
if((country_search_liv != null) && !country_search_liv.equalsIgnoreCase(ANY))
	pout.write(" country --> " + country_search_liv);
if((country_coverage_search_liv != null) && !country_coverage_search_liv.equalsIgnoreCase(ANY))
	pout.write(" country coverage --> " + country_coverage_search_liv);
if((primary_business_type_search_liv != null) && !primary_business_type_search_liv.equalsIgnoreCase(ANY))
	pout.write(" business type --> " + primary_business_type_search_liv);

%>

	<br>
	<table class="lfr-table" border="1" cellpadding="4" cellspacing="2" width="50%">
	<tr BGCOLOR="#99CCFF">
		<th colspan="4" >
			Search By
		</th>
	</tr>
	<tr>
		<th colspan="2">
			Partner name
		</th>
		<td style="padding-left: 10px;"></td>
		<td>
			<input class="form-text" size = 40 name="name_search" type="text" value="<%= name_search_liv %>">
		</td>
	</tr>	
	<tr>
		<th colspan="2">
			Partner description
		</th>
		<td style="padding-left: 10px;"></td>
		<td>
			<input class="form-text" size = 40 name="desc_search" type="text" value="<%= desc_search_liv %>">
		</td>
	</tr>	
	<tr>
		<th colspan="2">
			SAP solution
		</th>
		<td style="padding-left: 10px;"></td>
		<td>
			<SELECT NAME="sap_solution_focus_search" style="width:40" >
			<OPTION><%=ANY%></OPTION>
			 <%
		     for (int j = 0; j< sapSolutionItems.size(); j++ )
		      {
				SAPSolutionItem sapsolutionItem = (SAPSolutionItem)sapSolutionItems.get(j);			 
                //This is a category from the database
                String optionCategoryValue = sapsolutionItem.getSAPSolutionName();
 
                //Construct the option tag in a String variable
                String optionTag = "<OPTION VALUE=\"" + optionCategoryValue + "\"";
                if(optionCategoryValue.equals(sapsol_search_liv))
                {
                    optionTag += " selected=\"selected\"";
                }
                    
                //close the option tag
                optionTag += ">" + optionCategoryValue + "</OPTION>";
                    
                //printout the option tag
                out.println(optionTag);
		      }			 
            	//Close the result set and statment to free up resoures
			%>
		</td>
	</tr>
	<tr>
		<th colspan="2">
			Primary country
		</th>
		<td style="padding-left: 10px;"></td>
		<td>
			<SELECT NAME="country_search" >
			<OPTION><%=ANY%></OPTION>
			 <%
			     for (int j = 0; j< countryItems.size(); j++ )
			      {
					CountryItem countryItem = (CountryItem)countryItems.get(j);			 
                    //This is a category from the database
                    String optionCategoryValue = countryItem.getCountryName();
 
                    //Construct the option tag in a String variable
                    String optionTag = "<OPTION VALUE=\"" + optionCategoryValue + "\"";
	                if(optionCategoryValue.equals(country_search_liv))
	                {
	                    optionTag += " selected=\"selected\"";
	                }
                    
                    //close the option tag
                    optionTag += ">" + optionCategoryValue + "</OPTION>";
                    
                    //printout the option tag
                    out.println(optionTag);
			      }			 
			%>
			</SELECT>
		</td>
	</tr>
	<tr>
	
		<th colspan= "2">
			Country coverage
		</td>
		<td style="padding-left: 10px;"></td>
		<td>
			<SELECT NAME="country_coverage_search" style="width:40">
			<OPTION><%=ANY%></OPTION>
			 <%
			     for (int j = 0; j< coverageCountryItems.size(); j++ )
			      {
					CountryItem countryItem = (CountryItem)coverageCountryItems.get(j);			 
                    //This is a category from the database
                    String optionCategoryValue = countryItem.getCountryName();
 
                    //Construct the option tag in a String variable
                    String optionTag = "<OPTION VALUE=\"" + optionCategoryValue + "\"";
	                if(optionCategoryValue.equals(country_coverage_search_liv))
	                {
	                    optionTag += " selected=\"selected\"";
	                }
                    
                    //close the option tag
                    optionTag += ">" + optionCategoryValue + "</OPTION>";
                    
                    //printout the option tag
                    out.println(optionTag);
			      }			 
			%>
			</SELECT>
		</td>
	</tr>
	<tr>
		<th colspan = "2">
			Primary business type
		</th>
		<td style="padding-left: 10px;"></td>
		<td>
			<SELECT NAME="primary_business_type_search" style="width:40" >
			<OPTION><%=ANY%></OPTION>
			 <%
		     for (int j = 0; j< businessTypeItems.size(); j++ )
		      {
				BusinesstypeItem businessItem = (BusinesstypeItem)businessTypeItems.get(j);			 
                //This is a category from the database
                String optionCategoryValue = businessItem.getBusinessName();
 
                //Construct the option tag in a String variable
                String optionTag = "<OPTION VALUE=\"" + optionCategoryValue + "\"";
                if(optionCategoryValue.equals(primary_business_type_search_liv))
                {
                    optionTag += " selected=\"selected\"";
                }
                    
                //close the option tag
                optionTag += ">" + optionCategoryValue + "</OPTION>";
                    
                //printout the option tag
                out.println(optionTag);
		      }			 
			%>
			</SELECT>		
		</td>
	</tr>	
	<tr>
		<th colspan = "2" >
			Industry
		</th>
		<td style="padding-left: 10px;"></td>
		<td>
			<SELECT NAME="industry_search" style="width:40" >
			<OPTION><%=ANY%></OPTION>
			 <%
		     for (int j = 0; j< industryItems.size(); j++ )
		      {
				IndustryItem industryItem = (IndustryItem)industryItems.get(j);			 
                //This is a category from the database
                String optionCategoryValue = industryItem.getIndustryName();
 
                //Construct the option tag in a String variable
                String optionTag = "<OPTION VALUE=\"" + optionCategoryValue + "\"";
                if(optionCategoryValue.equals(industry_search_liv))
                {
                    optionTag += " selected=\"selected\"";
                }
                    
                //close the option tag
                optionTag += ">" + optionCategoryValue + "</OPTION>";
                    
                //printout the option tag
                out.println(optionTag);
		      }			 
			%>
		</td>
	</tr>
	</table>
	<br>
	<input class="portlet-form-button" type="submit" value="Search"> 
	&nbsp;&nbsp;&nbsp;&nbsp;
	<input class="portlet-form-button" type="button" value="Reset" onClick="self.location = '<portlet:renderURL><portlet:param name="command" value="search" /><portlet:param name="industrySearch" value="${industry_search}" /></portlet:renderURL>';"> 
	<!-- <input class="portlet-form-button" type="button" value="Search" onClick="self.location = '<portlet:renderURL><portlet:param name="command" value="search" /><portlet:param name="industrySearch" value="${industry_search}" /></portlet:renderURL>';"> -->
		
		<br><br>

	<table class="lfr-table" border="1" cellpadding="4" cellspacing="2" width="100%">
	<tr BGCOLOR="#99CCFF">
		<td width="20%">
			<b>Company Name</b>
		</td>
		<td width="10%">
			<b>Industry</b>
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
	boolean cond = industry_search_liv != null ||  
				   sapsol_search_liv != null ||
				   country_search_liv!= null ||
				   country_coverage_search_liv != null ||
				   primary_business_type_search_liv != null ||
				   ((name_search_liv != null) && (!name_search_liv.equalsIgnoreCase(""))) ||
				   ((desc_search_liv != null) && (!desc_search_liv.equalsIgnoreCase("")));
				   
	if(!cond)
		{
		companyItems = CompanyItemDAO.getCompanyItems();
		}
	else {
		companyItems = CompanyUtil.getCompanyItemsBySearch(industry_search_liv, sapsol_search_liv, country_search_liv, country_coverage_search_liv, primary_business_type_search_liv, name_search_liv, desc_search_liv);
		}
	
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