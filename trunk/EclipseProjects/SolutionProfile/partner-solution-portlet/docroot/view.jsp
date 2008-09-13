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
	
	int companyId;
	long partNumber;	
	String solName;	
	String solDesc;	
	String partComSite	;
	int solFocus	;
	int solStatusPartner;
	int solStatusSAP;
	Date sapCertSince	;
	Date lastReviewBySAP;	
	int averTrainEndUser;
	int averImplTrainingDays;	
	int averImplEffort;	
	int averImplDuration;	
	int averSizeImplTeam;	
	int averSaleCycle;	
	int noCustomers;	
	int smallImpl;
	int largeImpl;	
	int smallImplTime;	
	int largeImplTime;	
	int smallImplTeamNo;	
	int largeImplTeamNo;	
	String solSite;
	
	int countryPriceEuro;
	
	String refCustAvailForUse;	
	int totalAppBaseLinePrice;	
	int appPriceEur	;
	int hardwareCost	;
	int hardwareCostEur;	
	int averLicensePrice;	
	int averLicensePriceEur;	
	int addServiceCost	;
	int addServicePriceEur;	
	int implCost	;
	int implCostEur;	
	String  sapDiscount	;
	String dbUsed;	
	String SAPBusUsed;	
	String SAPGUIUsed;	
	String compA1B1Used;	
	String thirdPartyUsed;	
	String thirdPartyName ;	
	String otherIT;	
	String addRemarks;	
	String solSAPMicroSite;	
	
	Date lastPartRevieDate;	
	String reviewedBy	;
	String profileAdded	;
	Date dateCreated	;
	String modifiedBy;	
	Date dateUpdated;	
	String notificationProc;
	String notificationText;
    
	if (command.equals("edit")) {
		id = Integer.parseInt(request.getParameter("id"));
		UserItem userItem = UserItemDAO.getUserItemByCompanyId(id);
		if(userItem != null)
		{
			userId = userItem.getId();
		}
		// company part
		SolutionItem solutionItem = SolutionItemDAO.getSolutionItem(id);

	int companyId = companyId;
	long partNumber = partNumber;	
	String solName = solName;	
	String solDesc = solDesc;	
	String partComSite = partComSite ;
	int solFocus =  solFocus;
	int solStatusPartner = solStatusPartner;
	int solStatusSAP = solStatusSAP;
	Date sapCertSince = String.valueOf(dateFormatDateTime.format(sapCertSince));
	Date lastReviewBySAP = String.valueOf(dateFormatDateTime.format(lastReviewBySAP));	
	int averTrainEndUser = averTrainEndUser;
	int averImplTrainingDays = averImplTrainingDays;	
	int averImplEffort = averImplEffort;	
	int averImplDuration = averImplDuration;	
	int averSizeImplTeam = averSizeImplTeam;	
	int averSaleCycle = averSaleCycle;	
	int noCustomers = noCustomers;	
	int smallImpl =  smallImpl;
	int largeImpl = largeImpl;	
	int smallImplTime = smallImplTime;	
	int largeImplTime = largeImplTime;	
	int smallImplTeamNo = smallImplTeamNo;	
	int largeImplTeamNo = largeImplTeamNo;	
	String solSite = solSite;
	
	int countryPriceEuro = countryPriceEuro;
	
	String refCustAvailForUse =refCustAvailForUse;	
	int totalAppBaseLinePrice = totalAppBaseLinePrice;	
	int appPriceEur	= appPriceEur;
	int hardwareCost = hardwareCost	;
	int hardwareCostEur = hardwareCostEur;	
	int averLicensePrice = averLicensePrice;	
	int averLicensePriceEur = averLicensePriceEur;	
	int addServiceCost = addServiceCost	;
	int addServicePriceEur = addServicePriceEur;	
	int implCost = implCost	;
	int implCostEur = implCostEur;	
	String  sapDiscoun = sapDiscount;
	String dbUsed = dbUsed;	
	String SAPBusUsed = SAPBusUsed;	
	String SAPGUIUsed = SAPGUIUsed;	
	String compA1B1Used = compA1B1Used ;	
	String thirdPartyUsed = thirdPartyUsed;	
	String thirdPartyName = thirdPartyName;	
	String otherIT = otherIT;	
	String addRemarks = addRemarks;	
	String solSAPMicroSite = solSAPMicroSite;	
	
	Date lastPartRevieDate;	
	String reviewedBy = reviewedBy	;
	String profileAdded = profileAdded	;
	Date dateCreated	;
	String modifiedBy = modifiedBy;	
	Date dateUpdated;	
	String notificationProc = notificationProc;
	String notificationText = notificationText;


		userCompanyName = companyItem.getName();
		partnerDescription = companyItem.getDescription();
		partnerNumber = companyItem.getCompanyNo(); 
	    parent_company_name = companyItem.getParentCompanyName(); 
	    channel_partner_since = String.valueOf(companyItem.getYear()); 
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
	     		
// get the childs item
		int countryParentId = companyItem.getCountryRegistrationId();
	    if(countryParentId >0)
	    	country_parent_company = CountryItemDAO.getCountryItem(countryParentId).getCountryName(); 

	    sap_solution_focus = CompanyUtil.getCompanySAPSolutionList(companyItem);
	    industry = CompanyUtil.getCompanyIndustries(id);
	    geographic_coverage = CompanyUtil.getCompanyCountryCoverage(companyItem);
	    primary_business_type = CompanyUtil.getCompanyBusinessSolution(id, 1); 	
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
			Company Name
		</td>
		<td style="padding-left: 10px;"></td>
		<td>
			<input class="form-text" size = 40 name="userCompanyName" type="text" value="<%= userCompanyName %>">
		</td>
	</tr>
	<tr>
		<td>
			Partner description
		</td>
		<td style="padding-left: 10px;"></td>
		<td>
			<TEXTAREA rows="4" cols= "60" input class="form-text" name="partnerDescription" align = left>
			<%= partnerDescription.trim() %>
			</TEXTAREA>
		</td>
	</tr>
	<tr>
		<td>
			Partner number
		</td>
		<td style="padding-left: 10px;"></td>
		<td>
			<input class="form-text" size = 40 name="partnerNumber" type="text" value="<%= partnerNumber %>">
		</td>
	</tr>
	<tr>
		<td>
			Telephone
		</td>
		<td style="padding-left: 10px;"></td>
		<td>
			<input class="form-text" size = 40 name="telephone" type="text" value="<%= telephone %>">
		</td>
	</tr>
	<tr>
		<td>
			Telefax
		</td>
		<td style="padding-left: 10px;"></td>
		<td>
			<input class="form-text" size = 40 name="telefax" type="text" value="<%= telefax %>">
		</td>
	</tr>
	<tr>
		<td>
			E-mail
		</td>
		<td style="padding-left: 10px;"></td>
		<td>
			<input class="form-text" size = 40 name="mail" type="text" value="<%= mail %>">
		</td>
	</tr>
	<tr>
		<td>
			Street 1
		</td>
		<td style="padding-left: 10px;"></td>
		<td>
			<input class="form-text" size = 40 name="street1" type="text" value="<%= street1 %>">
		</td>
	</tr>
	<tr>
		<td>
			Street 2
		</td>
		<td style="padding-left: 10px;"></td>
		<td>
			<input class="form-text" size = 40 name="street2" type="text" value="<%= street2 %>">
		</td>
	</tr>
	<tr>
		<td>
			Postal/ZIP code
		</td>
		<td style="padding-left: 10px;"></td>
		<td>
			<input class="form-text" size = 40 name="zipcode" type="text" value="<%= zipcode %>">
		</td>
	</tr>
	<tr>
		<td>
			City
		</td>
		<td style="padding-left: 10px;"></td>
		<td>
			<input class="form-text" size = 40 name="city" type="text" value="<%= city %>">
		</td>
	</tr>
	<tr>
		<td>
			State/Province
		</td>
		<td style="padding-left: 10px;"></td>
		<td>
			<input class="form-text" size = 40 name="state_province" type="text" value="<%= state_province %>">
		</td>
	</tr>
	<tr>
		<td>
			Country
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
                    
                    if(optionCategoryValue.equals(country))
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
			<!-- <input class="form-text" name="country" type="text" value="<%= country %>"> -->
		</td>
	</tr>
	<tr>
		<td>
			CPSN Partner Community/Microsite Address
		</td>
		<td style="padding-left: 10px;"></td>
		<td>
			<input class="form-text" size = 40 name="micrositeAdress" type="url" value="<%= micrositeAdress %>">
		</td>
	</tr>
	<tr>
		<td>
			Company Website
		</td>
		<td style="padding-left: 10px;"></td>
		<td>
			<input class="form-text" size = 40 name="company_website" type="url" value="<%= company_website %>">
		</td>
	</tr>
	<tr>
		<td>
			Total number of employees in your organization/company
		</td>
		<td style="padding-left: 10px;"></td>
		<td>
			<input class="form-text" size = 40 name="noemployees" type="int" value="<%= noemployees %>">
		</td>
	</tr>		
	<tr>
		<td>
			Company geographic coverage
		</td>
		<td style="padding-left: 10px;"></td>
		<td>
			<SELECT NAME="country_coverage" style="width:40" MULTIPLE>
			 <%
			     for (int j = 0; j< coverageCountryItems.size(); j++ )
			      {
					CountryItem countryItem = (CountryItem)coverageCountryItems.get(j);			 
                    //This is a category from the database
                    String optionCategoryValue = countryItem.getCountryName();
 
                    //Construct the option tag in a String variable
                    String optionTag = "<OPTION VALUE=\"" + optionCategoryValue + "\"";
                    
                    if((geographic_coverage != null) && (geographic_coverage.contains(optionCategoryValue)))
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
			<!--	<input class="form-text" name="geographic_coverage" type="text" value="<%= geographic_coverage %>"> -->
		</td>
	</tr>		
	<tr>
		<td>
			Parent company name (Headquarters)
		</td>
		<td style="padding-left: 10px;"></td>
		<td>
			<input class="form-text" size = 40 name="parent_company_name" type="text" value="<%= parent_company_name %>">
		</td>
	</tr>	
	<tr>
		<td>
			Country of registration of parent company
		</td>
		<td style="padding-left: 10px;"></td>
		<td>
			<SELECT NAME="country_parent_company" style="width:40" >
			 <%
			     for (int j = 0; j< parentCountryItems.size(); j++ )
			      {
					CountryItem countryItem = (CountryItem)parentCountryItems.get(j);			 
                    //This is a category from the database
                    String optionCategoryValue = countryItem.getCountryName();
 
                    //Construct the option tag in a String variable
                    String optionTag = "<OPTION VALUE=\"" + optionCategoryValue + "\"";
                    
                    if(optionCategoryValue.equals(country_parent_company))
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
			SAP SME/Channel partner since (year)
		</td>
		<td style="padding-left: 10px;"></td>
		<td>
			<input class="form-text" size = 40 name="channel_partner_since" type="text" value="<%= channel_partner_since %>">
		</td>
	</tr>	
	<tr>
		<td>
			What is your primary business type?
		</td>
		<td style="padding-left: 10px;"></td>
		<td>
			<SELECT NAME="primary_business_type" style="width:40" >
			 <%
		     for (int j = 0; j< businessTypeItems.size(); j++ )
		      {
				BusinesstypeItem businessItem = (BusinesstypeItem)businessTypeItems.get(j);			 
                //This is a category from the database
                String optionCategoryValue = businessItem.getBusinessName();
 
                //Construct the option tag in a String variable
                String optionTag = "<OPTION VALUE=\"" + optionCategoryValue + "\"";
                    
                if(optionCategoryValue.equals(primary_business_type))
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
			<!-- <input class="form-text" name="primary_business_type" type="text" value="<%= primary_business_type %>"> -->
		</td>
	</tr>	
	<tr>
		<td>
			What is your secondary business type?
		</td>
		<td style="padding-left: 10px;"></td>
		<td>
			<SELECT NAME="secondary_business_type" style="width:40">
			 <%
		     for (int j = 0; j< businessTypeItems2.size(); j++ )
		      {
				BusinesstypeItem businessItem = (BusinesstypeItem)businessTypeItems2.get(j);			 
                //This is a category from the database
                String optionCategoryValue = businessItem.getBusinessName();
 
                //Construct the option tag in a String variable
                String optionTag = "<OPTION VALUE=\"" + optionCategoryValue + "\"";
                    
                if(optionCategoryValue.equals(secondary_business_type))
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
			 <!-- <input class="form-text" name="secondary_business_type" type="text" value="<%= secondary_business_type %>"> -->
		</td>
	</tr>	
	<tr>
		<td>
			SAP solution focus
		</td>
		<td style="padding-left: 10px;"></td>
		<td>
			<SELECT NAME="sap_solution_focus" style="width:40" MULTIPLE SIZE: 3 >
			 <%
		     for (int j = 0; j< sapSolutionItems.size(); j++ )
		      {
				SAPSolutionItem sapsolutionItem = (SAPSolutionItem)sapSolutionItems.get(j);			 
                //This is a category from the database
                String optionCategoryValue = sapsolutionItem.getSAPSolutionName();
 
                //Construct the option tag in a String variable
                String optionTag = "<OPTION VALUE=\"" + optionCategoryValue + "\"";
                    
                if((sap_solution_focus != null) &&  (sap_solution_focus.contains(optionCategoryValue)))
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
			<!-- <input class="form-text" name="sap_solution_focus" type="text" value="<%= sap_solution_focus %>"> -->
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
		        //System.out.print(i.next()); 
		      }			 
            //Close the result set and statment to free up resoures
			%>
			<!-- <input class="form-text" name="industry" type="text" value="<%= industry %>"> -->
		</td>
	</tr>	
	<tr>
		<td>
			Last Review Date
		</td>
		<td style="padding-left: 10px;"></td>
		<td>
			<input class="form-text" size = 40 name="last_review_Date" type="text" value="<%= last_review_Date %>">
		</td>
	</tr>	
	<tr>
		<td>
			Reviewed By
		</td>
		<td style="padding-left: 10px;"></td>
		<td>
			<input class="form-text" size = 40 name="reviewed_by" type="text" value="<%= reviewed_by %>">
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

PrintWriter pout=null;
pout = response.getWriter();
pout.write("<BR> Search by: ");
if((industry_search_liv != null) && !industry_search_liv.equalsIgnoreCase("---------Any---------"))
	pout.write(" industry --> " + industry_search_liv);
if((sapsol_search_liv != null) && !sapsol_search_liv.equalsIgnoreCase("---------Any---------"))
	pout.write(" sap solution --> " + sapsol_search_liv);
if((country_search_liv != null) && !country_search_liv.equalsIgnoreCase("---------Any---------"))
	pout.write(" country --> " + country_search_liv);
if((country_coverage_search_liv != null) && !country_coverage_search_liv.equalsIgnoreCase("---------Any---------"))
	pout.write(" country coverage --> " + country_coverage_search_liv);
if((primary_business_type_search_liv != null) && !primary_business_type_search_liv.equalsIgnoreCase("---------Any---------"))
	pout.write(" business type --> " + primary_business_type_search_liv);

%>
	<input class="portlet-form-button" type="button" value="Add" onClick="self.location = '<portlet:renderURL><portlet:param name="command" value="add" /></portlet:renderURL>';">

	<br><br>
	<table class="lfr-table" border="1" cellpadding="4" cellspacing="2" width="50%">
	<tr BGCOLOR="#99CCFF">
		<th colspan="4" >
			Search By
		</th>
	</tr>
	<tr>
		<th colspan="2">
			SAP solution focus
		</th>
		<td style="padding-left: 10px;"></td>
		<td>
			<SELECT NAME="sap_solution_focus_search" style="width:40" >
			<OPTION>---------Any---------</OPTION>
			 <%
		     for (int j = 0; j< sapSolutionItems.size(); j++ )
		      {
				SAPSolutionItem sapsolutionItem = (SAPSolutionItem)sapSolutionItems.get(j);			 
                //This is a category from the database
                String optionCategoryValue = sapsolutionItem.getSAPSolutionName();
 
                //Construct the option tag in a String variable
                String optionTag = "<OPTION VALUE=\"" + optionCategoryValue + "\"";
                    
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
			Country
		</th>
		<td style="padding-left: 10px;"></td>
		<td>
			<SELECT NAME="country_search" >
			<OPTION>---------Any---------</OPTION>
			 <%
			     for (int j = 0; j< countryItems.size(); j++ )
			      {
					CountryItem countryItem = (CountryItem)countryItems.get(j);			 
                    //This is a category from the database
                    String optionCategoryValue = countryItem.getCountryName();
 
                    //Construct the option tag in a String variable
                    String optionTag = "<OPTION VALUE=\"" + optionCategoryValue + "\"";
                    
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
			Company geographic coverage
		</td>
		<td style="padding-left: 10px;"></td>
		<td>
			<SELECT NAME="country_coverage_search" style="width:40">
			<OPTION>---------Any---------</OPTION>
			 <%
			     for (int j = 0; j< coverageCountryItems.size(); j++ )
			      {
					CountryItem countryItem = (CountryItem)coverageCountryItems.get(j);			 
                    //This is a category from the database
                    String optionCategoryValue = countryItem.getCountryName();
 
                    //Construct the option tag in a String variable
                    String optionTag = "<OPTION VALUE=\"" + optionCategoryValue + "\"";
                    
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
			<OPTION>---------Any---------</OPTION>
			 <%
		     for (int j = 0; j< businessTypeItems.size(); j++ )
		      {
				BusinesstypeItem businessItem = (BusinesstypeItem)businessTypeItems.get(j);			 
                //This is a category from the database
                String optionCategoryValue = businessItem.getBusinessName();
 
                //Construct the option tag in a String variable
                String optionTag = "<OPTION VALUE=\"" + optionCategoryValue + "\"";
                    
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
			<OPTION>---------Any---------</OPTION>
			 <%
		     for (int j = 0; j< industryItems.size(); j++ )
		      {
				IndustryItem industryItem = (IndustryItem)industryItems.get(j);			 
                //This is a category from the database
                String optionCategoryValue = industryItem.getIndustryName();
 
                //Construct the option tag in a String variable
                String optionTag = "<OPTION VALUE=\"" + optionCategoryValue + "\"";
                    
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
	<!-- <input class="portlet-form-button" type="button" value="Search" onClick="self.location = '<portlet:renderURL><portlet:param name="command" value="search" /><portlet:param name="industrySearch" value="${industry_search}" /></portlet:renderURL>';"> -->
		
		<br><br>

	<table class="lfr-table" border="1" cellpadding="4" cellspacing="2" width="100%">
	<tr BGCOLOR="#99CCFF">
		<td >
			<b>Company Name</b>
		</td>
		<td>
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
			<b>Action</b>
		</td>
	</tr>

	<%
	List userItems = UserItemDAO.getUserItems();
	List companyItems = null;
	boolean cond = industry_search_liv != null ||  
				   sapsol_search_liv != null ||
				   country_search_liv!= null ||
				   country_coverage_search_liv != null ||
				   primary_business_type_search_liv != null ;
				   
	if(!cond)
		{
		companyItems = CompanyItemDAO.getCompanyItems();
		}
	else {
		companyItems = CompanyUtil.getCompanyItemsBySearch(industry_search_liv, sapsol_search_liv, country_search_liv, country_coverage_search_liv, primary_business_type_search_liv);
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
			<td>
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
				<input class="portlet-form-button" type="button" value="Edit" onClick="self.location = '<portlet:renderURL><portlet:param name="command" value="edit" /><portlet:param name="id" value="<%= String.valueOf(companyItem.getId()) %>" /></portlet:renderURL>';">
			</td>
		</tr>
		<%} else  {%>
		<tr>
		<TH colspan="6" style="font-size: 8pt; color: navy">
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