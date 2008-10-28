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

<form action="<portlet:actionURL />" method="post" name="viewallsolutions" onSubmit="return submitconfirm(this)">

<%
DateFormat dateFormatDateTime = DateFormat.getDateInstance();
String command = request.getParameter("command");
/*List countryItems = CountryItemDAO.getCountryItems();
List coverageCountryItems = CountryItemDAO.getCountryItems();
List parentCountryItems = CountryItemDAO.getCountryItems();
List businessTypeItems = BusinesstypeItemDAO.getBusinessTypeItems(); 
List businessTypeItems2 = BusinesstypeItemDAO.getBusinessTypeItems(); 
List sapSolutionItems = SAPSolutionItemDAO.getSAPSolutionItems(); 
List industryItems = IndustryItemDAO.getIndustryItems();*/ 


if ((command != null) && (command.equals("add") || command.equals("edit"))) {
	int id = 0;
	
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
	String countryPriceEuroStr = "";
	String solFocusStr = "";
    List industry = null; 
    List geographic_coverage = null;
        
	if (command.equals("edit")) {
		id = Integer.parseInt(request.getParameter("id"));
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
	     		
	 	
	}
	else  //add
	{
	
	}
%>

	<input name="command" type="hidden" value="<%= command %>">
	<input name="id" type="hidden" value="<%= id %>">

	<br>

	<input class="portlet-form-button" type="submit" value="Save">

	<%
	if (renderRequest.getWindowState().equals(WindowState.MAXIMIZED)) {
	%>

		<script type="text/javascript">
			document.viewallsolutions.userCompanyName.focus();
		</script>
	<%
	}
	%>

<%
}
else {
	int id =0;
//search + viewall
%>
	<input name="command" type="hidden" value="<%= command %>">
	<input name="id" type="hidden" value="<%= id %>">
	<br>
	<input class="portlet-form-button" type="submit" value="Refresh"> 
		
	<br>

	<table class="lfr-table" border="1" cellpadding="4" cellspacing="2" width="100%">
	<tr BGCOLOR="#99CCFF">
		<td width="20%">
			<b>Partner Name</b>
		</td>
		<td width="30%">
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
	solutionItems = SolutionItemDAO.getSolutionItems();
	
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
