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
function submitconfirm(searchsolution)
{
	if(""==document.forms.searchsolution.solName.value)
	{
	alert("Please enter a solution name.");
	return false;
	}
	return true;
}
//-->
</SCRIPT>


<form action="<portlet:actionURL />" method="post" name="searchsolution" onSubmit="return submitconfirm(this)">

<%
SimpleDateFormat dateFormatDateTime = new SimpleDateFormat("MM/dd/yyyy");
String command = request.getParameter("command");

List coverageCountryItems = CountryItemDAO.getCountryItems();
List industryItems = IndustryItemDAO.getIndustryItems(); 
List companyItems = CompanyItemDAO.getCompanyItems(); 
List sapSolFocusItems = SolutionUtil.getSolSapSol(); 
List mySAPAllInOneVers = SolutionUtil.getMySAPAllInOneVersions(); 
List mySAPOneProductVers = SolutionUtil.getMySAPOneProductVersions(); 
List maturity = SolutionUtil.getMaturity(); 
List statusByProvider = SolutionUtil.getStatusByProvider(); 
String pleaseChoose = "---------------Please choose----------------";
String ANY = "-------------------------Any-------------------------";

List YN = SolutionUtil.YesNoList();


if ((command != null) && (command.equals("add") || command.equals("edit"))) {
	int id = 0;
	int userId = 0;
	
	int companyId = 0;
	long partNumber  = 0;	
	String solName = "";	
	String solDesc = "";	
	String partComSite	= "";
	int solFocus  = 0;
	int solStatusPartner = 0;
	int solStatusSAP = 0;
	
	String sapCertSince	= "";;
	String lastReviewBySAP = "";	
	int averTrainEndUser = 0;
	int averImplTrainingDays = 0;	
	int averImplEffort = 0;	
	int averImplDuration = 0;	
	int averSizeImplTeam = 0;	
	int averSaleCycle = 0;	
	int noCustomers = 0;	
	int smallImpl = 0;
	int largeImpl = 0;	
	int smallImplTime = 0;	
	int largeImplTime = 0;	
	int smallImplTeamNo = 0;	
	int largeImplTeamNo = 0;	
	String solSite = "";
	
	int countryPriceEuro = 0;
	
	String refCustAvailForUse = "";	
	int totalAppBaseLinePrice = 0;	
	int appPriceEur	 = 0;
	int hardwareCost = 0;
	int hardwareCostEur = 0;	
	int averLicensePrice = 0;	
	int averLicensePriceEur = 0;	
	int addServiceCost = 0;
	int addServicePriceEur = 0;	
	int implCost	 = 0;
	int implCostEur = 0;	
	String  sapDiscount	 = "";
	String dbUsed = "";	
	String SAPBusUsed = "";	
	String SAPGUIUsed = "";	
	String compA1B1Used = "";	
	String thirdPartyUsed = "";	
	String thirdPartyName  = "";	
	String otherIT = "";	
	String addRemarks = "";	
	String solSAPMicroSite = "";	
	
	String lastPartRevieDate = "";	
	String reviewedBy	 = "";
	String profileAdded	 = "";
	String dateCreated	 = "";
	String modifiedBy = "";	
	String dateUpdated = "";	
	String notificationProc = "";
	String notificationText = "";
	
	// childs
	String sol_countryPriceEuro = "";
	String sol_solFocusStr = "";
    List sol_geographic_coverage = null;
	List sol_industry = null; 
	List sol_mySAPAllInOneVers = null; 
	List sol_mySAPOneProductVers  = null; 
	String sol_maturity  = ""; 
	String sol_statusByProvider  = null; 
	String sol_statusBySAP  = null; 
	List sol_targetCompSize  = null; 
	List sol_categTarget  = null; 
	List sol_langAvailable  = null; 
	String sol_userType  = null; 
	List sol_progLang  = null; 
	List sol_os  = null; 
	List sol_aioBased  = null;     
        
	if (command.equals("edit")) {
		id = Integer.parseInt(request.getParameter("id"));
		UserItem userItem = UserItemDAO.getUserItemByCompanyId(id);
		// company part
		SolutionItem solutionItem = SolutionItemDAO.getSolutionItem(id);

	companyId = solutionItem.companyId;
	partNumber = solutionItem.partNumber;	
	solName = solutionItem.solName;	
	solDesc = solutionItem.solDesc;	
	partComSite = solutionItem.partComSite ;
	solFocus =  solutionItem.solFocus;
	solStatusPartner = solutionItem.solStatusPartner;
	solStatusSAP = solutionItem.solStatusSAP;
	sapCertSince = String.valueOf(dateFormatDateTime.format(solutionItem.sapCertSince));
	lastReviewBySAP = String.valueOf(dateFormatDateTime.format(solutionItem.lastReviewBySAP));	
	averTrainEndUser = solutionItem.averTrainEndUser;
	averImplTrainingDays = solutionItem.averImplTrainingDays;	
	averImplEffort = solutionItem.averImplEffort;	
	averImplDuration = solutionItem.averImplDuration;	
	averSizeImplTeam = solutionItem.averSizeImplTeam;	
	averSaleCycle = solutionItem.averSaleCycle;	
	noCustomers = solutionItem.noCustomers;	
	smallImpl =  solutionItem.smallImpl;
	largeImpl = solutionItem.largeImpl;	
	smallImplTime = solutionItem.smallImplTime;	
	largeImplTime = solutionItem.largeImplTime;	
	smallImplTeamNo = solutionItem.smallImplTeamNo;	
	largeImplTeamNo = solutionItem.largeImplTeamNo;	
	solSite = solutionItem.solSite;
	
	countryPriceEuro = solutionItem.countryPriceEuro;
	
	refCustAvailForUse =solutionItem.refCustAvailForUse;	
	totalAppBaseLinePrice = solutionItem.totalAppBaseLinePrice;	
	appPriceEur	= solutionItem.appPriceEur;
	hardwareCost = solutionItem.hardwareCost	;
	hardwareCostEur = solutionItem.hardwareCostEur;	
	averLicensePrice = solutionItem.averLicensePrice;	
	averLicensePriceEur = solutionItem.averLicensePriceEur;	
	addServiceCost = solutionItem.addServiceCost	;
	addServicePriceEur = solutionItem.addServicePriceEur;	
	implCost = solutionItem.implCost	;
	implCostEur = solutionItem.implCostEur;	
	sapDiscount = solutionItem.sapDiscount;
	dbUsed = solutionItem.dbUsed;	
	SAPBusUsed = solutionItem.SAPBusUsed;	
	SAPGUIUsed = solutionItem.SAPGUIUsed;	
	compA1B1Used = solutionItem.compA1B1Used ;	
	thirdPartyUsed = solutionItem.thirdPartyUsed;	
	thirdPartyName = solutionItem.thirdPartyName;	
	otherIT = solutionItem.otherIT;	
	addRemarks = solutionItem.addRemarks;	
	solSAPMicroSite = solutionItem.solSAPMicroSite;	
	
	lastPartRevieDate = String.valueOf(dateFormatDateTime.format(solutionItem.lastPartRevieDate));	
	reviewedBy = solutionItem.reviewedBy	;
	profileAdded = solutionItem.profileAdded	;
	dateCreated= String.valueOf(dateFormatDateTime.format(solutionItem.dateCreated));
	modifiedBy = solutionItem.modifiedBy;	
	dateUpdated = String.valueOf(dateFormatDateTime.format(solutionItem.dateUpdated));	
	notificationProc = solutionItem.notificationProc;
	notificationText = solutionItem.notificationText;
	
// get the childs item

		 	
	}
	else  //add
	{
	
	}
%>

	<input name="command" type="hidden" value="<%= command %>">
	<input name="id" type="hidden" value="<%= id %>">

	<br>

	<input class="portlet-form-button" type="submit" value="Save">
	&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
	<input class="portlet-form-button" type="button" value="Cancel" onClick="self.location = '<portlet:renderURL></portlet:renderURL>';"> 

	<%
	if (renderRequest.getWindowState().equals(WindowState.MAXIMIZED)) {
	%>

		<script type="text/javascript">
			document.searchsolution.solName.focus();
		</script>
	<%
	}
	%>

<%
}
else {
	long id =0;
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
	pout.write(" solution name --> " + name_search_liv);
if((desc_search_liv != null) && !desc_search_liv.equalsIgnoreCase(""))
	pout.write(" solution description --> " + desc_search_liv);
if((industry_search_liv != null) && !industry_search_liv.equalsIgnoreCase(ANY))
	pout.write(" industry --> " + industry_search_liv);
if((sapsol_search_liv != null) && !sapsol_search_liv.equalsIgnoreCase(ANY))
	pout.write(" solution focus --> " + sapsol_search_liv);
if((country_search_liv != null) && !country_search_liv.equalsIgnoreCase(ANY))
	pout.write(" partner name --> " + country_search_liv);
if((country_coverage_search_liv != null) && !country_coverage_search_liv.equalsIgnoreCase(ANY))
	pout.write(" geographic coverage --> " + country_coverage_search_liv);
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
			Partner Name
		</th>
		<td style="padding-left: 10px;"></td>
		<td>
			<SELECT NAME="country_search" style="width:40" >
			<OPTION><%=ANY%></OPTION>
			 <%
		     for (int j = 0; j< companyItems.size(); j++ )
		      {
				CompanyItem companyItem = (CompanyItem)companyItems.get(j);			 
				String optionCategoryValue = companyItem.getName();			 
                //This is a category from the database
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
            	//Close the result set and statment to free up resoures
			%>
		</td>
	</tr>	
	<tr>
		<th colspan="2">
			Solution name
		</th>
		<td style="padding-left: 10px;"></td>
		<td>
			<input class="form-text" size = 40 name="name_search" type="text" value="<%= name_search_liv %>">
		</td>
	</tr>	
	<tr>
		<th colspan="2">
			Solution description
		</th>
		<td style="padding-left: 10px;"></td>
		<td>
			<input class="form-text" size = 40 name="desc_search" type="text" value="<%= desc_search_liv %>">
		</td>
	</tr>	
	<tr>
		<th colspan="2">
			Solution Focus
		</th>
		<td style="padding-left: 10px;"></td>
		<td>
			<SELECT NAME="sap_solution_focus_search" style="width:40" >
			<OPTION><%=ANY%></OPTION>
			 <%
		     for (int j = 0; j< sapSolFocusItems.size(); j++ )
		      {
				String optionCategoryValue = (String)sapSolFocusItems.get(j);			 
                //This is a category from the database
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
	<tr>
		<th colspan= "2">
			Geographic Coverage
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
	</table>
	<br>
	<input class="portlet-form-button" type="submit" value="Search"> 
	&nbsp;&nbsp;&nbsp;&nbsp;
	<input class="portlet-form-button" type="button" value="Reset" onClick="self.location = '<portlet:renderURL><portlet:param name="command" value="search" /><portlet:param name="industrySearch" value="${industry_search}" /></portlet:renderURL>';"> 
	<!-- <input class="portlet-form-button" type="button" value="Search" onClick="self.location = '<portlet:renderURL><portlet:param name="command" value="search" /><portlet:param name="industrySearch" value="${industry_search}" /></portlet:renderURL>';"> -->
		
		<br><br>
	<input name="command" type="hidden" value="<%= command %>">
	<input name="id" type="hidden" value="<%= id %>">

		<br><br>

	<table class="lfr-table" border="1" cellpadding="4" cellspacing="2" width="100%">
	<tr BGCOLOR="#99CCFF">
		<td width="20%">
			<b>Partner Name</b>
		</td>
		<td width="10%">
			<b>Solution Name</b>
		</td>
		<td>
			<b>Solution Focus</b>
		</td>
		<td>
			<b>Industry</b>
		</td>
		<td>
			<b>Geographic Coverage</b>
		</td>
	</tr>

	<%
	List solutionItems = null;
	boolean cond = industry_search_liv != null ||  
				   sapsol_search_liv != null ||
				   country_coverage_search_liv != null ||
				   ((name_search_liv != null) && (!name_search_liv.equalsIgnoreCase(""))) ||
				   ((desc_search_liv != null) && (!desc_search_liv.equalsIgnoreCase("")));
				   
	if(!cond)
		{
		solutionItems = SolutionItemDAO.getSolutionItems();
		}
	else {
		solutionItems = SolutionUtil.getSolutionItemsBySearch(industry_search_liv, sapsol_search_liv, country_search_liv, country_coverage_search_liv, primary_business_type_search_liv, name_search_liv, desc_search_liv);
		}	
	
	int count = solutionItems.size();
	boolean even = false;
	for (int i = 0; i < 2*solutionItems.size(); i++) {
		SolutionItem solutionItem = (SolutionItem)solutionItems.get(i/2);
		even = (i%2 == 0);
	%>
		<% if (even){ 
		%>
		<tr>
			<td class = "fontweightbolder">
				<%= SolutionUtil.getSolutionPartnerName(solutionItem) %>
			</td>
			<td>
				<%= solutionItem.solName %>
			</td>
			<td>
				<%= SolutionUtil.getSolutionSolFocus(solutionItem) %>
			</td>
			<td>
				<%= SolutionUtil.getSolutionIndustriesString(solutionItem) %>
			</td>
			<td>
				<%= SolutionUtil.getSolutionCountryCoverageString(solutionItem) %>
			</td>
		</tr>
		<%} else  {%>
		<tr>
		<TH colspan="5"  style="font-size: 8pt; font-weight: normal">
		<% if(solutionItem.solDesc != null) {%>
				<%= solutionItem.solDesc.substring(0, java.lang.Math.min(200,solutionItem.solDesc.length()))+"..." %>
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
