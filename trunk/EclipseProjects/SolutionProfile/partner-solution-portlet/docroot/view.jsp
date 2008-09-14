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
function submitconfirm(solutionprofile)
{
	if(""==document.forms.solutionprofile.userCompanyName.value)
	{
	alert("Please enter a company name.");
	return false;
	}
	return true;
}
//-->
</SCRIPT>


<form action="<portlet:actionURL />" method="post" name="solutionprofile" onSubmit="return submitconfirm(this)">

<%
DateFormat dateFormatDateTime = DateFormat.getDateInstance();
String command = request.getParameter("command");
List countryItems = CountryItemDAO.getCountryItems();
List coverageCountryItems = CountryItemDAO.getCountryItems();
List parentCountryItems = CountryItemDAO.getCountryItems();
List businessTypeItems = BusinesstypeItemDAO.getBusinessTypeItems(); 
List businessTypeItems2 = BusinesstypeItemDAO.getBusinessTypeItems(); 
List sapSolutionItems = SAPSolutionItemDAO.getSAPSolutionItems(); 
List industryItems = IndustryItemDAO.getIndustryItems(); 


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
	String countryPriceEuroStr = "";
	String solFocusStr = "";
    List industry = null; 
    List geographic_coverage = null;
        
	if (command.equals("edit")) {
		id = Integer.parseInt(request.getParameter("id"));
		UserItem userItem = UserItemDAO.getUserItemByCompanyId(id);
		if(userItem != null)
		{
			userId = userItem.getId();
		}
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
	
/*		userCompanyName = companyItem.getName();
		partnerNumber = companyItem.getCompanyNo(); 
	    parent_company_name = companyItem.getParentCompanyName(); 
		micrositeAdress = companyItem.getCompanyFriendlySite();
		company_website = companyItem.getCompanySite();
		if(companyItem.getCompanyEmpNo() >0)
	    	noemployees = String.valueOf(companyItem.getCompanyEmpNo());
	    else
	    	noemployees ="";	
	    if(companyItem.getDateLastReview() != null)
		    last_review_Date = String.valueOf(dateFormatDateTime.format(companyItem.getDateLastReview()));
		else
			last_review_Date = "";
	    
	    reviewed_by = companyItem.getReviewedBy(); 
	    profile_added = String.valueOf(dateFormatDateTime.format(companyItem.getDateCreated())); 
	    date_updated = String.valueOf(dateFormatDateTime.format(companyItem.getDateUpdated())); 
	    modified_by = companyItem.getModifiedBy();
*/	     		
// get the childs item
	    if(countryPriceEuro >0)
	    	countryPriceEuroStr = CountryItemDAO.getCountryItem(countryPriceEuro).getCountryName(); 

	    if(solFocus >0)
		    solFocusStr = SolutionUtil.getSolutionSolFocus(solutionItem);
		    
	    industry = SolutionUtil.getSolutionIndustries(solutionItem);
	    geographic_coverage = SolutionUtil.getSolutionCountryCoverage(solutionItem);
	    //primary_business_type = CompanyUtil.getCompanyBusinessSolution(id, 1);
	 	
	}
	else  //add
	{
	
	}
%>

	<input name="command" type="hidden" value="<%= command %>">
	<input name="id" type="hidden" value="<%= id %>">

	<table class="lfr-table">

	<%
	if (command.equals("edit")) {
	%>

		<tr>
			<td>
				ID
			</td>
			<td style="padding-left: 10px;"></td>
			<td>
				<%= id %>
			</td>
		</tr>

	<%
	}
	%>
	<tr>
		<td>
			Solution Name
		</td>
		<td style="padding-left: 10px;"></td>
		<td>
			<input class="form-text" size = 40 name="solName" type="text" value="<%= solName %>">
		</td>
	</tr>
	<tr>
		<td>
			Solution description
		</td>
		<td style="padding-left: 10px;"></td>
		<td>
			<TEXTAREA rows="4" cols= "60" input class="form-text" name="solDesc" align = left>
			<%= solDesc.trim() %>
			</TEXTAREA>
		</td>
	</tr>
	<tr>
		<td>
			CPSN Partner Community/Microsite Address
		</td>
		<td style="padding-left: 10px;"></td>
		<td>
			<input class="form-text" size = 40 name="partComSite" type="text" value="<%= partComSite %>">
		</td>
	</tr>	
	<tr>
		<td>
			Solution Focus
		</td>
		<td style="padding-left: 10px;"></td>
		<td>
			<input class="form-text" size = 40 name="solFocus" type="text" value="<%= solFocus %>">
		</td>
	</tr>	
	<tr>
		<td>
			Applicable mySAP All-in-One versions
		</td>
		<td style="padding-left: 10px;"></td>
		<td>
			<input class="form-text" size = 40 name="solStatusPartner" type="text" value="<%= solStatusPartner %>">
		</td>
	</tr>	
	<tr>
		<td>
			Applicable SAP Business One product versions
		</td>
		<td style="padding-left: 10px;"></td>
		<td>
			<input class="form-text" size = 40 name="solStatusPartner" type="text" value="<%= solStatusPartner %>">
		</td>
	</tr>	
	<tr>
		<td>
			Solution Maturity
		</td>
		<td style="padding-left: 10px;"></td>
		<td>
			<input class="form-text" size = 40 name="solStatusPartner" type="text" value="<%= solStatusPartner %>">
		</td>
	</tr>	
	<tr>
		<td>
			Industry
		</td>
		<td style="padding-left: 10px;"></td>
		<td>
			<SELECT NAME="industry" style="width:40" MULTIPLE SIZE: 10>
			 <%
		     for (int j = 0; j< industryItems.size(); j++ )
		      {
				IndustryItem industryItem = (IndustryItem)industryItems.get(j);			 
                //This is a category from the database
                String optionCategoryValue = industryItem.getIndustryName();
 
                //Construct the option tag in a String variable
                String optionTag = "<OPTION VALUE=\"" + optionCategoryValue + "\"";
                    
                if(industry != null && industry.contains(optionCategoryValue))
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
		<td>
			Solution Status (provided by Partner)
		</td>
		<td style="padding-left: 10px;"></td>
		<td>
			<input class="form-text" size = 40 name="solStatusPartner" type="text" value="<%= solStatusPartner %>">
		</td>
	</tr>	
	<tr>
		<td>
			Solution Status (provided by SAP)
		</td>
		<td style="padding-left: 10px;"></td>
		<td>
			<input class="form-text" size = 40 name="solStatusPartner" type="text" value="<%= solStatusPartner %>">
		</td>
	</tr>	
	<tr>
		<td>
			mySAP All-in-One Qualified / SAP Business One Certified since
		</td>
		<td style="padding-left: 10px;"></td>
		<td>
			<input class="form-text" size = 40 name="solStatusPartner" type="text" value="<%= solStatusPartner %>">
		</td>
	</tr>	
	<tr>
		<td>
			Solution Last Reviewed by SAP
		</td>
		<td style="padding-left: 10px;"></td>
		<td>
			<input class="form-text" size = 40 name="solStatusPartner" type="text" value="<%= solStatusPartner %>">
		</td>
	</tr>	
	<tr>
		<td>
			Geographic Coverage
		</td>
		<td style="padding-left: 10px;"></td>
		<td>
			<SELECT NAME="geographic_coverage" style="width:40">
			 <%
			     for (int j = 0; j< countryItems.size(); j++ )
			      {
					CountryItem countryItem = (CountryItem)countryItems.get(j);			 
                    //This is a category from the database
                    String optionCategoryValue = countryItem.getCountryName();
 
                    //Construct the option tag in a String variable
                    String optionTag = "<OPTION VALUE=\"" + optionCategoryValue + "\"";
	                if(geographic_coverage != null && geographic_coverage.contains(optionCategoryValue))
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
			</SELECT>
		</td>
	</tr>	
	<tr>
		<td>
			Target Company Size
		</td>
		<td style="padding-left: 10px;"></td>
		<td>
			<input class="form-text" size = 40 name="solStatusPartner" type="text" value="<%= solStatusPartner %>">
		</td>
	</tr>	
	<tr>
		<td>
			Solution Category Target (SAP Business One Solutions Only)
		</td>
		<td style="padding-left: 10px;"></td>
		<td>
			<input class="form-text" size = 40 name="solStatusPartner" type="text" value="<%= solStatusPartner %>">
		</td>
	</tr>	
	<tr>
		<td>
			Languages available
		</td>
		<td style="padding-left: 10px;"></td>
		<td>
			<input class="form-text" size = 40 name="solStatusPartner" type="text" value="<%= solStatusPartner %>">
		</td>
	</tr>	
	<tr>
		<td>
			Average training for end user (days)
		</td>
		<td style="padding-left: 10px;"></td>
		<td>
			<input class="form-text" size = 40 name="solStatusPartner" type="text" value="<%= solStatusPartner %>">
		</td>
	</tr>	
	<tr>
		<td>
			Average implementation training for partner (days)
		</td>
		<td style="padding-left: 10px;"></td>
		<td>
			<input class="form-text" size = 40 name="solStatusPartner" type="text" value="<%= solStatusPartner %>">
		</td>
	</tr>	
	<tr>
		<td>
			Average implementation time (person-days)
		</td>
		<td style="padding-left: 10px;"></td>
		<td>
			<input class="form-text" size = 40 name="solStatusPartner" type="text" value="<%= solStatusPartner %>">
		</td>
	</tr>	
	<tr>
		<td>
			Average implementation duration (months)
		</td>
		<td style="padding-left: 10px;"></td>
		<td>
			<input class="form-text" size = 40 name="solStatusPartner" type="text" value="<%= solStatusPartner %>">
		</td>
	</tr>	
	<tr>
		<td>
			Average size of implementation team (number of people)
		</td>
		<td style="padding-left: 10px;"></td>
		<td>
			<input class="form-text" size = 40 name="solStatusPartner" type="text" value="<%= solStatusPartner %>">
		</td>
	</tr>	
	<tr>
		<td>
			Average sales cycle (months)
		</td>
		<td style="padding-left: 10px;"></td>
		<td>
			<input class="form-text" size = 40 name="solStatusPartner" type="text" value="<%= solStatusPartner %>">
		</td>
	</tr>	
	<tr>
		<td>
			Number of Customers using this solution
		</td>
		<td style="padding-left: 10px;"></td>
		<td>
			<input class="form-text" size = 40 name="solStatusPartner" type="text" value="<%= solStatusPartner %>">
		</td>
	</tr>	
	<tr>
		<td>
			Smallest implementation (number of individual users)
		</td>
		<td style="padding-left: 10px;"></td>
		<td>
			<input class="form-text" size = 40 name="solStatusPartner" type="text" value="<%= solStatusPartner %>">
		</td>
	</tr>	
	<tr>
		<td>
			Largest implementation (number of individual users)
		</td>
		<td style="padding-left: 10px;"></td>
		<td>
			<input class="form-text" size = 40 name="solStatusPartner" type="text" value="<%= solStatusPartner %>">
		</td>
	</tr>	
	<tr>
		<td>
			Small implementation time (days)
		</td>
		<td style="padding-left: 10px;"></td>
		<td>
			<input class="form-text" size = 40 name="solStatusPartner" type="text" value="<%= solStatusPartner %>">
		</td>
	</tr>	
	<tr>
		<td>
			Large implementation (days)
		</td>
		<td style="padding-left: 10px;"></td>
		<td>
			<input class="form-text" size = 40 name="solStatusPartner" type="text" value="<%= solStatusPartner %>">
		</td>
	</tr>	
	<tr>
		<td>
			Small implementation: number of team members needed
		</td>
		<td style="padding-left: 10px;"></td>
		<td>
			<input class="form-text" size = 40 name="solStatusPartner" type="text" value="<%= solStatusPartner %>">
		</td>
	</tr>	
	<tr>
		<td>
			Large implementation: number of team members needed
		</td>
		<td style="padding-left: 10px;"></td>
		<td>
			<input class="form-text" size = 40 name="solStatusPartner" type="text" value="<%= solStatusPartner %>">
		</td>
	</tr>	
	<tr>
		<td>
			Solution webpage/site
		</td>
		<td style="padding-left: 10px;"></td>
		<td>
			<input class="form-text" size = 40 name="solStatusPartner" type="text" value="<%= solStatusPartner %>">
		</td>
	</tr>	
	<tr>
		<td>
			Main Country that pricing is based on (expressed in EUR)
		</td>
		<td style="padding-left: 10px;"></td>
		<td>
			<SELECT NAME="country" style="width:40">
			 <%
			     for (int j = 0; j< countryItems.size(); j++ )
			      {
					CountryItem countryItem = (CountryItem)countryItems.get(j);			 
                    //This is a category from the database
                    String optionCategoryValue = countryItem.getCountryName();
 
                    //Construct the option tag in a String variable
                    String optionTag = "<OPTION VALUE=\"" + optionCategoryValue + "\"";
                    
                    if(optionCategoryValue.equals(countryPriceEuroStr))
                    {
                        optionTag += " selected=\"selected\"";
                    }
                    
                    //close the option tag
                    optionTag += ">" + optionCategoryValue + "</OPTION>";
                    
                    //printout the option tag
                    out.println(optionTag);
			        //System.out.print(i.next()); 
			      }			 
                //Close the result set and statment to free up resoures
			%>
			</SELECT>
		</td>
	</tr>	
	<tr>
		<td>
			Total application baseline price
		</td>
		<td style="padding-left: 10px;"></td>
		<td>
			<input class="form-text" size = 40 name="solStatusPartner" type="text" value="<%= solStatusPartner %>">
		</td>
	</tr>	
	<tr>
		<td>
			Hardware cost (average)
		</td>
		<td style="padding-left: 10px;"></td>
		<td>
			<input class="form-text" size = 40 name="solStatusPartner" type="text" value="<%= solStatusPartner %>">
		</td>
	</tr>	
	<tr>
		<td>
			Average per-user license price
		</td>
		<td style="padding-left: 10px;"></td>
		<td>
			<input class="form-text" size = 40 name="solStatusPartner" type="text" value="<%= solStatusPartner %>">
		</td>
	</tr>	
	<tr>
		<td>
			Additional services costs (average)
		</td>
		<td style="padding-left: 10px;"></td>
		<td>
			<input class="form-text" size = 40 name="solStatusPartner" type="text" value="<%= solStatusPartner %>">
		</td>
	</tr>	
	<tr>
		<td>
			Implementation cost (average)
		</td>
		<td style="padding-left: 10px;"></td>
		<td>
			<input class="form-text" size = 40 name="solStatusPartner" type="text" value="<%= solStatusPartner %>">
		</td>
	</tr>	
	<tr>
		<td>
			User type
		</td>
		<td style="padding-left: 10px;"></td>
		<td>
			<input class="form-text" size = 40 name="solStatusPartner" type="text" value="<%= solStatusPartner %>">
		</td>
	</tr>	
	<tr>
		<td>
			SAP Channel Partner discount or special pricing offered?
		</td>
		<td style="padding-left: 10px;"></td>
		<td>
			<input class="form-text" size = 40 name="solStatusPartner" type="text" value="<%= solStatusPartner %>">
		</td>
	</tr>	
	<tr>
		<td>
			Programming language
		</td>
		<td style="padding-left: 10px;"></td>
		<td>
			<input class="form-text" size = 40 name="solStatusPartner" type="text" value="<%= solStatusPartner %>">
		</td>
	</tr>	
	<tr>
		<td>
			Operating system/platform
		</td>
		<td style="padding-left: 10px;"></td>
		<td>
			<input class="form-text" size = 40 name="solStatusPartner" type="text" value="<%= solStatusPartner %>">
		</td>
	</tr>	
	<tr>
		<td>
			Databases
		</td>
		<td style="padding-left: 10px;"></td>
		<td>
			<input class="form-text" size = 40 name="solStatusPartner" type="text" value="<%= solStatusPartner %>">
		</td>
	</tr>	
	<tr>
		<td>
			Is there a connection via SDK: SAP Business One used?
		</td>
		<td style="padding-left: 10px;"></td>
		<td>
			<input class="form-text" size = 40 name="solStatusPartner" type="text" value="<%= solStatusPartner %>">
		</td>
	</tr>	
	<tr>
		<td>
			Is the SAP Business One GUI used?
		</td>
		<td style="padding-left: 10px;"></td>
		<td>
			<input class="form-text" size = 40 name="solStatusPartner" type="text" value="<%= solStatusPartner %>">
		</td>
	</tr>	
	<tr>
		<td>
			Components used (A1/B1)
		</td>
		<td style="padding-left: 10px;"></td>
		<td>
			<input class="form-text" size = 40 name="solStatusPartner" type="text" value="<%= solStatusPartner %>">
		</td>
	</tr>	
	<tr>
		<td>
			Is your mySAP All-in-One Solution based on:
		</td>
		<td style="padding-left: 10px;"></td>
		<td>
			<input class="form-text" size = 40 name="solStatusPartner" type="text" value="<%= solStatusPartner %>">
		</td>
	</tr>	
	<tr>
		<td>
			Do you also use another third-party product or partner to implement your solution?
		</td>
		<td style="padding-left: 10px;"></td>
		<td>
			<input class="form-text" size = 40 name="solStatusPartner" type="text" value="<%= solStatusPartner %>">
		</td>
	</tr>	
	<tr>
		<td>
			What is the name of the third party partner?
		</td>
		<td style="padding-left: 10px;"></td>
		<td>
			<input class="form-text" size = 40 name="solStatusPartner" type="text" value="<%= solStatusPartner %>">
		</td>
	</tr>	
	<tr>
		<td>
			Other technology information
		</td>
		<td style="padding-left: 10px;"></td>
		<td>
			<input class="form-text" size = 40 name="solStatusPartner" type="text" value="<%= solStatusPartner %>">
		</td>
	</tr>	
	<tr>
		<td>
			Additional Remarks
		</td>
		<td style="padding-left: 10px;"></td>
		<td>
			<input class="form-text" size = 40 name="solStatusPartner" type="text" value="<%= solStatusPartner %>">
		</td>
	</tr>	
	<tr>
		<td>
			Solution information on SAP Channel Partner Micro-site on the SAP CPSN
		</td>
		<td style="padding-left: 10px;"></td>
		<td>
			<input class="form-text" size = 40 name="solStatusPartner" type="text" value="<%= solStatusPartner %>">
		</td>
	</tr>	

	</table>

	<br>

	<input class="portlet-form-button" type="submit" value="Save">

	<%
	if (renderRequest.getWindowState().equals(WindowState.MAXIMIZED)) {
	%>

		<script type="text/javascript">
			document.solutionprofile.userCompanyName.focus();
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
	<input class="portlet-form-button" type="button" value="Add" onClick="self.location = '<portlet:renderURL><portlet:param name="command" value="add" /></portlet:renderURL>';">

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
		<td>
			<b>Action</b>
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
			<td>
				<input class="portlet-form-button" type="button" value="Edit" onClick="self.location = '<portlet:renderURL><portlet:param name="command" value="edit" /><portlet:param name="id" value="<%= String.valueOf(solutionItem.getId()) %>" /></portlet:renderURL>';">

				<input class="portlet-form-button" type="button" value="Delete" onClick="document.solutionprofile.command.value = 'delete'; document.solutionprofile.id.value = '<%= solutionItem.getId() %>'; document.solutionprofile.submit();">
			</td>
		</tr>
		<%} else  {%>
		<tr>
		<TH colspan="6"  style="font-size: 8pt; font-weight: normal">
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

<script language="JavaScript" type="text/javascript">
 var frmvalidator = new Validator("solutionprofile");
 frmvalidator.addValidation("userCompanyName","req","Please enter the Company Name");
 //frmvalidator.addValidation("userCompanyName","alpha");
 

 frmvalidator.addValidation("mail","maxlen=50", "Please provide a valid e-mail adress");
 //frmvalidator.addValidation("mail","req");
 frmvalidator.addValidation("mail","email", "Please provide a valid e-mail adress");
 
 frmvalidator.addValidation("telephone","maxlen=15", "Please provide a valid phone number, data entered too long");
 //frmvalidator.addValidation("telephone","numeric", "Please provide a valid phone number, digits only");
 frmvalidator.addValidation("telefax","maxlen=15", "Please provide a valid fax number, data entered too long");
 //frmvalidator.addValidation("telefax","numeric", "Please provide a valid phone number, digits only");

 frmvalidator.addValidation("channel_partner_since", "numeric", "Please provide a valid 4 digit year");
 frmvalidator.addValidation("channel_partner_since", "maxlen=4", "Please provide a valid 4 digit year, data enetered too long");
// frmvalidator.addValidation("channel_partner_since", "minlen=4", "Please provide a valid 4 digit year, data enetered too short");

 frmvalidator.addValidation("noemployees", "numeric", "Please provide a valid digit number");
  
 frmvalidator.addValidation("partnerNumber","numeric", "Please provide a valid number");  
 //frmvalidator.addValidation("Address","maxlen=50");
 frmvalidator.addValidation("country","dontselect=0", "Please select one option for country");
 frmvalidator.addValidation("country_coverage","dontselect=-1", "Please select at least one option for country coverage");
 frmvalidator.addValidation("country_parent_company","dontselect=0", "Please select one option for parent company country");
 frmvalidator.addValidation("primary_business_type","dontselect=0", "Please select one option for primary business type");
 frmvalidator.addValidation("secondary_business_type","dontselect=0", "Please select one option for secondary business type");
 frmvalidator.addValidation("sap_solution_focus","dontselect=-1", "Please select at least one option for SAP solution focus");
 frmvalidator.addValidation("industry","dontselect=-1", "Please select at least one option for industry");
 frmvalidator.addValidation("last_review_Date","date", "Please enter a valid date");
 //secondary_business_type
</script>