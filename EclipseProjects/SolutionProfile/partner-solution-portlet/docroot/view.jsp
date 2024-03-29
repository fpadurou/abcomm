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
	if(""==document.forms.solutionprofile.solName.value)
	{
	alert("Please enter a solution name.");
	return false;
	}
	var ret = true;

	var itemobj = document.getElementsByName("sapCertSince");
	var objValue = document.getElementsByName("lastReviewBySAP");
	if(!itemobj)
    {
      alert("BUG: Couldnot get the input object named: "+itemname);
	    ret = false;                 
        return ret;
    }
	if(Date.parse(objValue.value) < Date.parse(itemobj.value))
	{ 
	    if(!strError || strError.length ==0) 
	    { 
	      strError = objValue.name + " : value should be greater than SAP certified date"; 
	    }//if               
    sfm_show_error_msg(strError,objValue); 
    ret = false;                 
   }//if   
return ret;          	
}
//-->
</SCRIPT>


<form action="<portlet:actionURL />" method="post" name="solutionprofile" onSubmit="return submitconfirm(this)">

<%
SimpleDateFormat dateFormatDateTime = new SimpleDateFormat("MM/dd/yyyy");
String command = request.getParameter("command");

List countryItems = CountryItemDAO.getCountryItems();
List coverageCountryItems = CountryItemDAO.getCountryItems();
List sapSolutionItems = SAPSolutionItemDAO.getSAPSolutionItems();
List industryItems = IndustryItemDAO.getIndustryItems(); 
List sapSolFocusItems = SolutionUtil.getSolSapSol(); 
List mySAPAllInOneVers = SolutionUtil.getMySAPAllInOneVersions(); 
List mySAPOneProductVers = SolutionUtil.getMySAPOneProductVersions(); 
List maturity = SolutionUtil.getMaturity(); 
List statusByProvider = SolutionUtil.getStatusByProvider(); 
List statusBySAP = SolutionUtil.getStatusBySAP(); 
List targetCompSize = SolutionUtil.getTargetCompanySize(); 
List categTarget = SolutionUtil.getCategTarget(); 
List langAvailable = SolutionUtil.getLangAvailable(); 
List userType = SolutionUtil.getSolUserType(); 
List progLang = SolutionUtil.getProgLang(); 
List os = SolutionUtil.getOS(); 
List aioBased = SolutionUtil.getMySAPAllInOneBased(); 
List company_names = CompanyItemDAO.getCompanyNames();
String pleaseChoose = "---------------Please choose----------------";

List YN = SolutionUtil.YesNoList();

long lrUserId = PortalUtil.getUserId(request); 

if ((command != null) && (command.equals("add") || command.equals("edit"))) {
	int id = 0;
	int userId = 0;
	
	int companyId = 0;
	long partNumber  = 0;	
	String solName = "";	
	String solDesc = "";	
	String partComSite	= "http://";
	int solFocus  = 0;
	int solStatusPartner = 0;
	int solStatusSAP = 0;
	
	String sapCertSince	= "";
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
	String solSite = "http://";
	
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
	String company_name  = null; 
	
	// all partner names
	List partner_names = null;
	        
	if (command.equals("edit")) {
		id = Integer.parseInt(request.getParameter("id"));
		// company part
		SolutionItem solutionItem = SolutionItemDAO.getSolutionItem(id);

	companyId = solutionItem.companyId;
	company_name = CompanyItemDAO.getCompanyNameById(companyId);
	
	partNumber = solutionItem.partNumber;	
	solName = solutionItem.solName;	
	solDesc = solutionItem.solDesc;	
	partComSite = solutionItem.partComSite ;
	if(partComSite.isEmpty())
		partComSite = "http://";
		
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
	if(solSAPMicroSite.isEmpty())
		solSAPMicroSite = "http://";
		
	
	lastPartRevieDate = String.valueOf(dateFormatDateTime.format(solutionItem.lastPartRevieDate));	
	reviewedBy = solutionItem.reviewedBy	;
	profileAdded = solutionItem.profileAdded	;
	dateCreated= String.valueOf(dateFormatDateTime.format(solutionItem.dateCreated));
	modifiedBy = solutionItem.modifiedBy;	
	dateUpdated = String.valueOf(dateFormatDateTime.format(solutionItem.dateUpdated));	
	notificationProc = solutionItem.notificationProc;
	notificationText = solutionItem.notificationText;
	
// get the childs item

	    if(solFocus >0)
		    sol_solFocusStr = SolutionUtil.getSolutionSolFocus(solutionItem);
		    
		sol_mySAPAllInOneVers = SolutionUtil.getSolutionMySAPAllInOneVersions(solutionItem);
		sol_mySAPOneProductVers  = SolutionUtil.getSolutionSAPOneProductVersions(solutionItem);
		sol_maturity  = SolutionUtil.getSolMaturity(solutionItem); 
		sol_industry = SolutionUtil.getSolutionIndustries(solutionItem); 
		sol_statusByProvider  = SolutionUtil.getSolStatusByProvider(solutionItem); 
		sol_statusBySAP  = SolutionUtil.getSolStatusBySAP(solutionItem); 
	    sol_geographic_coverage = SolutionUtil.getSolutionCountryCoverage(solutionItem);
		sol_targetCompSize = SolutionUtil.getSolTargetCompanySize(solutionItem);
		sol_categTarget  = SolutionUtil.getSolutionCategTarget(solutionItem);
		sol_langAvailable  = SolutionUtil.getSolutionLangAvailable(solutionItem);
	    
	    if(countryPriceEuro >0)
	    	sol_countryPriceEuro = SolutionUtil.getSolCountryEur(solutionItem); 

		sol_userType  = SolutionUtil.getSolUserType(solutionItem);
		sol_progLang  = SolutionUtil.getSolutionProgLang(solutionItem); 
		sol_os  = SolutionUtil.getSolutionOS(solutionItem);
		sol_aioBased  = SolutionUtil.getSolutionMySAPAllInOneBased(solutionItem);
		 	
	}
	else  //add
	{
		sapCertSince = String.valueOf(dateFormatDateTime.format(new Date()));
		lastReviewBySAP = String.valueOf(dateFormatDateTime.format(new Date()));	
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
			Partner Name
		</td>
		<td style="padding-left: 10px;"></td>
		<td>
			<SELECT NAME="company_names" style="width:40" >
			<OPTION><%=pleaseChoose%></OPTION>
			 <%
		     for (int j = 0; j< company_names.size(); j++ )
		      {
                String optionCategoryValue = (String)company_names.get(j);

                //Construct the option tag in a String variable
                String optionTag = "<OPTION VALUE=\"" + optionCategoryValue + "\"";
                    
                if(company_name != null && company_name.equals(optionCategoryValue))
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
			<TEXTAREA style="text-align: left" rows="4" cols= "60" name="solDesc"><%= solDesc.trim() %></TEXTAREA>
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
			<SELECT NAME="solFocus" style="width:40" >
			<OPTION><%=pleaseChoose%></OPTION>
			 <%
		     for (int j = 0; j< sapSolFocusItems.size(); j++ )
		      {
                String optionCategoryValue = (String)sapSolFocusItems.get(j);

                //Construct the option tag in a String variable
                String optionTag = "<OPTION VALUE=\"" + optionCategoryValue + "\"";
                    
                if(sol_solFocusStr != null && sol_solFocusStr.equals(optionCategoryValue))
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
			Applicable mySAP All-in-One versions
		</td>
		<td style="padding-left: 10px;"></td>
		<td>
			<SELECT NAME="mySAPAllInOneVers" style="width:40" MULTIPLE SIZE: 4 >
			 <%
		     for (int j = 0; j< mySAPAllInOneVers.size(); j++ )
		      {
                String optionCategoryValue = (String)mySAPAllInOneVers.get(j);

                //Construct the option tag in a String variable
                String optionTag = "<OPTION VALUE=\"" + optionCategoryValue + "\"";
                    
                if(sol_mySAPAllInOneVers != null && sol_mySAPAllInOneVers.contains(optionCategoryValue))
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
			Applicable SAP Business One product versions
		</td>
		<td style="padding-left: 10px;"></td>
		<td>
			<SELECT NAME="mySAPOneProductVers" style="width:40" MULTIPLE SIZE: 4 >
			 <%
		     for (int j = 0; j< mySAPOneProductVers.size(); j++ )
		      {
                String optionCategoryValue = (String)mySAPOneProductVers.get(j);

                //Construct the option tag in a String variable
                String optionTag = "<OPTION VALUE=\"" + optionCategoryValue + "\"";
                    
                if(sol_mySAPOneProductVers != null && sol_mySAPOneProductVers.contains(optionCategoryValue))
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
			Solution Maturity
		</td>
		<td style="padding-left: 10px;"></td>
		<td>
			<SELECT NAME="maturity" style="width:40" >
			<OPTION><%=pleaseChoose%></OPTION>
			 <%
		     for (int j = 0; j< maturity.size(); j++ )
		      {
                String optionCategoryValue = (String)maturity.get(j);

                //Construct the option tag in a String variable
                String optionTag = "<OPTION VALUE=\"" + optionCategoryValue + "\"";
                    
                if(sol_maturity != null && sol_maturity.equals(optionCategoryValue))
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
                    
                if(sol_industry != null && sol_industry.contains(optionCategoryValue))
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
			<SELECT NAME="statusByProvider" style="width:40" >
			<OPTION><%=pleaseChoose%></OPTION>
			 <%
		     for (int j = 0; j< statusByProvider.size(); j++ )
		      {
                //This is a category from the database
                String optionCategoryValue = (String)statusByProvider.get(j);
 
                //Construct the option tag in a String variable
                String optionTag = "<OPTION VALUE=\"" + optionCategoryValue + "\"";
                    
                if(sol_statusByProvider != null && sol_statusByProvider.equals(optionCategoryValue))
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
			Solution Status (provided by SAP)
		</td>
		<td style="padding-left: 10px;"></td>
		<td>
			<SELECT NAME="statusBySAP" style="width:40" >
			 <%
		     for (int j = 0; j< statusBySAP.size(); j++ )
		      {
                //This is a category from the database
                String optionCategoryValue = (String)statusBySAP.get(j);
 
                //Construct the option tag in a String variable
                String optionTag = "<OPTION VALUE=\"" + optionCategoryValue + "\"";
                    
                if(sol_statusBySAP != null && sol_statusBySAP.equals(optionCategoryValue))
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
			mySAP All-in-One Qualified / SAP Business One Certified since
		</td>
		<td style="padding-left: 10px;"></td>
		<td>
			<input class="form-text" size = 40 id="sapCertSince" name="sapCertSince" type="text" value="<%= sapCertSince %>">
		</td>
	</tr>	
	<tr>
		<td>
			Solution Last Reviewed by SAP
		</td>
		<td style="padding-left: 10px;"></td>
		<td>
			<input class="form-text" size = 40 name="lastReviewBySAP" type="text" value="<%= lastReviewBySAP %>">
		</td>
	</tr>	
	<tr>
		<td>
			Geographic Coverage
		</td>
		<td style="padding-left: 10px;"></td>
		<td>
			<SELECT NAME="geographic_coverage" style="width:40" MULTIPLE SIZE:10>
			 <%
			     for (int j = 0; j< countryItems.size(); j++ )
			      {
					CountryItem countryItem = (CountryItem)countryItems.get(j);			 
                    //This is a category from the database
                    String optionCategoryValue = countryItem.getCountryName();
 
                    //Construct the option tag in a String variable
                    String optionTag = "<OPTION VALUE=\"" + optionCategoryValue + "\"";
	                if(sol_geographic_coverage != null && sol_geographic_coverage.contains(optionCategoryValue))
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
			<SELECT NAME="targetCompSize" style="width:40" MULTIPLE SIZE :10>
			 <%
			     for (int j = 0; j< targetCompSize.size(); j++ )
			      {
                    //This is a category from the database
                    String optionCategoryValue = (String)targetCompSize.get(j);
 
                    //Construct the option tag in a String variable
                    String optionTag = "<OPTION VALUE=\"" + optionCategoryValue + "\"";
	                if(sol_targetCompSize != null && sol_targetCompSize.contains(optionCategoryValue))
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
			Solution Category Target (SAP Business One Solutions Only)
		</td>
		<td style="padding-left: 10px;"></td>
		<td>
			<SELECT NAME="categTarget" style="width:40" MULTIPLE SIZE :10>
			 <%
			     for (int j = 0; j< categTarget.size(); j++ )
			      {
                    //This is a category from the database
                    String optionCategoryValue = (String)categTarget.get(j);
 
                    //Construct the option tag in a String variable
                    String optionTag = "<OPTION VALUE=\"" + optionCategoryValue + "\"";
	                if(sol_categTarget != null && sol_categTarget.contains(optionCategoryValue))
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
			Languages available
		</td>
		<td style="padding-left: 10px;"></td>
		<td>
			<SELECT NAME="langAvailable" style="width:40" MULTIPLE SIZE :10>
			 <%
			     for (int j = 0; j< langAvailable.size(); j++ )
			      {
                    //This is a category from the database
                    String optionCategoryValue = (String)langAvailable.get(j);
 
                    //Construct the option tag in a String variable
                    String optionTag = "<OPTION VALUE=\"" + optionCategoryValue + "\"";
	                if(sol_langAvailable != null && sol_langAvailable.contains(optionCategoryValue))
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
			Average training for end user (days)
		</td>
		<td style="padding-left: 10px;"></td>
		<td>
			<input class="form-text" size = 40 name="averTrainEndUser" type="text" value="<%= averTrainEndUser %>">
		</td>
	</tr>	
	<tr>
		<td>
			Average implementation training for partner (days)
		</td>
		<td style="padding-left: 10px;"></td>
		<td>
			<input class="form-text" size = 40 name="averImplTrainingDays" type="text" value="<%= averImplTrainingDays %>">
		</td>
	</tr>	
	<tr>
		<td>
			Average implementation time (person-days)
		</td>
		<td style="padding-left: 10px;"></td>
		<td>
			<input class="form-text" size = 40 name="averImplEffort" type="text" value="<%= averImplEffort %>">
		</td>
	</tr>	
	<tr>
		<td>
			Average implementation duration (months)
		</td>
		<td style="padding-left: 10px;"></td>
		<td>
			<input class="form-text" size = 40 name="averImplDuration" type="text" value="<%= averImplDuration %>">
		</td>
	</tr>	
	<tr>
		<td>
			Average size of implementation team (number of people)
		</td>
		<td style="padding-left: 10px;"></td>
		<td>
			<input class="form-text" size = 40 name="averSizeImplTeam" type="text" value="<%= averSizeImplTeam %>">
		</td>
	</tr>	
	<tr>
		<td>
			Average sales cycle (months)
		</td>
		<td style="padding-left: 10px;"></td>
		<td>
			<input class="form-text" size = 40 name="averSaleCycle" type="text" value="<%= averSaleCycle %>">
		</td>
	</tr>	
	<tr>
		<td>
			Number of Customers using this solution
		</td>
		<td style="padding-left: 10px;"></td>
		<td>
			<input class="form-text" size = 40 name="noCustomers" type="text" value="<%= noCustomers %>">
		</td>
	</tr>	
	<tr>
		<td>
			Smallest implementation (number of individual users)
		</td>
		<td style="padding-left: 10px;"></td>
		<td>
			<input class="form-text" size = 40 name="smallImpl" type="text" value="<%= smallImpl %>">
		</td>
	</tr>	
	<tr>
		<td>
			Largest implementation (number of individual users)
		</td>
		<td style="padding-left: 10px;"></td>
		<td>
			<input class="form-text" size = 40 name="largeImpl" type="text" value="<%= largeImpl %>">
		</td>
	</tr>	
	<tr>
		<td>
			Small implementation time (days)
		</td>
		<td style="padding-left: 10px;"></td>
		<td>
			<input class="form-text" size = 40 name="smallImplTime" type="text" value="<%= smallImplTime %>">
		</td>
	</tr>	
	<tr>
		<td>
			Large implementation (days)
		</td>
		<td style="padding-left: 10px;"></td>
		<td>
			<input class="form-text" size = 40 name="largeImplTime" type="text" value="<%= largeImplTime %>">
		</td>
	</tr>	
	<tr>
		<td>
			Small implementation: number of team members needed
		</td>
		<td style="padding-left: 10px;"></td>
		<td>
			<input class="form-text" size = 40 name="smallImplTeamNo" type="text" value="<%= smallImplTeamNo %>">
		</td>
	</tr>	
	<tr>
		<td>
			Large implementation: number of team members needed
		</td>
		<td style="padding-left: 10px;"></td>
		<td>
			<input class="form-text" size = 40 name="largeImplTeamNo" type="text" value="<%= largeImplTeamNo %>">
		</td>
	</tr>	
	<tr>
		<td>
			Solution webpage/site
		</td>
		<td style="padding-left: 10px;"></td>
		<td>
			<input class="form-text" size = 40 name="solSite" type="text" value="<%= solSite %>">
		</td>
	</tr>	
	<tr>
		<td>
			Are reference customers available for use?
		</td>
		<td style="padding-left: 10px;"></td>
		<td>
			<SELECT NAME="refCustAvailForUse" style="width:40">
			<OPTION><%=pleaseChoose%></OPTION>
			 <%
			     for (int j = 0; j< YN.size(); j++ )
			      {
                    //This is a category from the database
                    String optionCategoryValue = (String)YN.get(j);
 
                    //Construct the option tag in a String variable
                    String optionTag = "<OPTION VALUE=\"" + optionCategoryValue + "\"";
	                if(refCustAvailForUse != null && refCustAvailForUse.equals(optionCategoryValue))
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
			Main Country that pricing is based on (expressed in EUR)
		</td>
		<td style="padding-left: 10px;"></td>
		<td>
			<SELECT NAME="country" style="width:40">
			<OPTION><%=pleaseChoose%></OPTION>
			 <%
			     for (int j = 0; j< countryItems.size(); j++ )
			      {
					CountryItem countryItem = (CountryItem)countryItems.get(j);			 
                    //This is a category from the database
                    String optionCategoryValue = countryItem.getCountryName();
 
                    //Construct the option tag in a String variable
                    String optionTag = "<OPTION VALUE=\"" + optionCategoryValue + "\"";
                    
                    if(optionCategoryValue.equals(sol_countryPriceEuro))
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
			<input class="form-text" size = 40 name="totalAppBaseLinePrice" type="text" value="<%= totalAppBaseLinePrice %>">
		</td>
	</tr>	
	<tr>
		<td>
			Hardware cost (average)
		</td>
		<td style="padding-left: 10px;"></td>
		<td>
			<input class="form-text" size = 40 name="hardwareCost" type="text" value="<%= hardwareCost %>">
		</td>
	</tr>	
	<tr>
		<td>
			Average per-user license price
		</td>
		<td style="padding-left: 10px;"></td>
		<td>
			<input class="form-text" size = 40 name="averLicensePrice" type="text" value="<%= averLicensePrice %>">
		</td>
	</tr>	
	<tr>
		<td>
			Additional services costs (average)
		</td>
		<td style="padding-left: 10px;"></td>
		<td>
			<input class="form-text" size = 40 name="addServiceCost" type="text" value="<%= addServiceCost %>">
		</td>
	</tr>	
	<tr>
		<td>
			Implementation cost (average)
		</td>
		<td style="padding-left: 10px;"></td>
		<td>
			<input class="form-text" size = 40 name="implCost" type="text" value="<%= implCost %>">
		</td>
	</tr>	
	<tr>
		<td>
			User type
		</td>
		<td style="padding-left: 10px;"></td>
		<td>
			<SELECT NAME="userType" style="width:40" >
			 <%
			     for (int j = 0; j< userType.size(); j++ )
			      {
                    //This is a category from the database
                    String optionCategoryValue = (String)userType.get(j);
 
                    //Construct the option tag in a String variable
                    String optionTag = "<OPTION VALUE=\"" + optionCategoryValue + "\"";
	                if(sol_userType != null && sol_userType.equals(optionCategoryValue))
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
			SAP Channel Partner discount or special pricing offered?
		</td>
		<td style="padding-left: 10px;"></td>
		<td>
			<SELECT NAME="sapDiscount" style="width:40">
			 <%
			     for (int j = 0; j< YN.size(); j++ )
			      {
                    //This is a category from the database
                    String optionCategoryValue = (String)YN.get(j);
 
                    //Construct the option tag in a String variable
                    String optionTag = "<OPTION VALUE=\"" + optionCategoryValue + "\"";
	                if(sapDiscount != null && sapDiscount.equals(optionCategoryValue))
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
			Programming language
		</td>
		<td style="padding-left: 10px;"></td>
		<td>
			<SELECT NAME="progLang" style="width:40" MULTIPLE SIZE:4>
			 <%
			     for (int j = 0; j< progLang.size(); j++ )
			      {
                    //This is a category from the database
                    String optionCategoryValue = (String)progLang.get(j);
 
                    //Construct the option tag in a String variable
                    String optionTag = "<OPTION VALUE=\"" + optionCategoryValue + "\"";
	                if(sol_progLang != null && sol_progLang.contains(optionCategoryValue))
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
			Operating system/platform
		</td>
		<td style="padding-left: 10px;"></td>
		<td>
			<SELECT NAME="os" style="width:40" MULTIPLE SIZE :4>
			 <%
			     for (int j = 0; j< os.size(); j++ )
			      {
                    //This is a category from the database
                    String optionCategoryValue = (String)os.get(j);
 
                    //Construct the option tag in a String variable
                    String optionTag = "<OPTION VALUE=\"" + optionCategoryValue + "\"";
	                if(sol_os != null && sol_os.contains(optionCategoryValue))
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
			Databases
		</td>
		<td style="padding-left: 10px;"></td>
		<td>
			<input class="form-text" size = 40 name="dbUsed" type="text" value="<%= dbUsed %>">
		</td>
	</tr>	
	<tr>
		<td>
			Is there a connection via SDK: SAP Business One used?
		</td>
		<td style="padding-left: 10px;"></td>
		<td>
			<SELECT NAME="SAPBusUsed" style="width:40">
			 <%
			     for (int j = 0; j< YN.size(); j++ )
			      {
                    //This is a category from the database
                    String optionCategoryValue = (String)YN.get(j);
 
                    //Construct the option tag in a String variable
                    String optionTag = "<OPTION VALUE=\"" + optionCategoryValue + "\"";
	                if(SAPBusUsed != null && SAPBusUsed.equals(optionCategoryValue))
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
			Is the SAP Business One GUI used?
		</td>
		<td style="padding-left: 10px;"></td>
		<td>
			<SELECT NAME="SAPGUIUsed" style="width:40">
			 <%
			     for (int j = 0; j< YN.size(); j++ )
			      {
                    //This is a category from the database
                    String optionCategoryValue = (String)YN.get(j);
 
                    //Construct the option tag in a String variable
                    String optionTag = "<OPTION VALUE=\"" + optionCategoryValue + "\"";
	                if(SAPGUIUsed != null && SAPGUIUsed.equals(optionCategoryValue))
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
			Components used (A1/B1)
		</td>
		<td style="padding-left: 10px;"></td>
		<td>
			<input class="form-text" size = 40 name="compA1B1Used" type="text" value="<%= compA1B1Used %>">
		</td>
	</tr>	
	<tr>
		<td>
			Is your mySAP All-in-One Solution based on:
		</td>
		<td style="padding-left: 10px;"></td>
		<td>
			<SELECT NAME="aioBased" style="width:40" MULTIPLE SIZE : 4>
			 <%
			     for (int j = 0; j< aioBased.size(); j++ )
			      {
                    //This is a category from the database
                    String optionCategoryValue = (String)aioBased.get(j);
 
                    //Construct the option tag in a String variable
                    String optionTag = "<OPTION VALUE=\"" + optionCategoryValue + "\"";
	                if(sol_aioBased != null && sol_aioBased.contains(optionCategoryValue))
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
			Do you also use another third-party product or partner to implement your solution?
		</td>
		<td style="padding-left: 10px;"></td>
		<td>
			<SELECT NAME="thirdPartyUsed" style="width:40">
			<OPTION><%=pleaseChoose%></OPTION>
			 <%
			     for (int j = 0; j< YN.size(); j++ )
			      {
                    //This is a category from the database
                    String optionCategoryValue = (String)YN.get(j);
 
                    //Construct the option tag in a String variable
                    String optionTag = "<OPTION VALUE=\"" + optionCategoryValue + "\"";
	                if(thirdPartyUsed != null && thirdPartyUsed.equals(optionCategoryValue))
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
			What is the name of the third party partner?
		</td>
		<td style="padding-left: 10px;"></td>
		<td>
			<input class="form-text" size = 40 name="thirdPartyName" type="text" value="<%= thirdPartyName %>">
		</td>
	</tr>	
	<tr>
		<td>
			Other technology information
		</td>
		<td style="padding-left: 10px;"></td>
		<td>
			<input class="form-text" size = 40 name="otherIT" type="text" value="<%= otherIT %>">
		</td>
	</tr>	
	<tr>
		<td>
			Additional Remarks
		</td>
		<td style="padding-left: 10px;"></td>
		<td>
			<input class="form-text" size = 40 name="addRemarks" type="text" value="<%= addRemarks %>">
		</td>
	</tr>	
	<tr>
		<td>
			Solution information on SAP Channel Partner Micro-site on the SAP CPSN
		</td>
		<td style="padding-left: 10px;"></td>
		<td>
			<input class="form-text" size = 40 name="solSAPMicroSite" type="text" value="<%= solSAPMicroSite %>">
		</td>
	</tr>	

	</table>

	<br>

	<input class="portlet-form-button" type="submit" value="Save">
	&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
	<input class="portlet-form-button" type="button" value="Cancel" onClick="self.location = '<portlet:renderURL></portlet:renderURL>';"> 

	<%
	if (renderRequest.getWindowState().equals(WindowState.MAXIMIZED)) {
	%>

		<script type="text/javascript">
			document.solutionprofile.solName.focus();
		</script>
	<%
	}
	%>

<%
}
else {
	long id =0;
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
	List solutionItemsIds = null;
	//solutionItems = SolutionItemDAO.getSolutionItems();
	//solutionItemsIds = SolutionItemDAO.getSolutionItemsIdByUserId(lrUserId);
	solutionItems = SolutionItemDAO.getSolutionItemsByUserId(lrUserId);
	
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
			<% if(true){
			%>
				<input class="portlet-form-button" type="button" value="Edit" onClick="self.location = '<portlet:renderURL><portlet:param name="command" value="edit" /><portlet:param name="id" value="<%= String.valueOf(solutionItem.getId()) %>" /></portlet:renderURL>';">

				<input class="portlet-form-button" type="button" value="Delete" onClick="document.solutionprofile.command.value = 'delete'; document.solutionprofile.id.value = '<%= solutionItem.getId() %>'; document.solutionprofile.submit();">
			<% } %>
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
 
 frmvalidator.addValidation("solName","req","Please enter the Solution Name");
 frmvalidator.addValidation("solDesc","req","Please enter the Solution Description");

 frmvalidator.addValidation("solFocus","dontselect=0", "Please select one option for solution focus");
 frmvalidator.addValidation("refCustAvailForUse","dontselect=0", "Please specify if there are reference customers available for use");

 //frmvalidator.addValidation("mySAPAllInOneVers","dontselect=-1", "Please select at least one option for mySAP All-in-One versions");
 //frmvalidator.addValidation("mySAPOneProductVers","dontselect=-1", "Please select at least one option for SAP Business One product versions");
 frmvalidator.addValidation("maturity","dontselect=0", "Please select one option for Solution Maturity");
 frmvalidator.addValidation("industry","dontselect=-1", "Please select at least one option for Industry");
 frmvalidator.addValidation("statusByProvider","dontselect=0", "Please select one option for Solution Status (provided by partner)");
 frmvalidator.addValidation("geographic_coverage","dontselect=-1", "Please select at least one option for country coverage");
 frmvalidator.addValidation("langAvailable","dontselect=-1", "Please select at least one option for languages available");
 //frmvalidator.addValidation("targetCompSize","dontselect=-1", "Please select at least one option for Target Company Size");

 //frmvalidator.addValidation("noCustomers","req","Please enter the Number of Customers using this solution");
 frmvalidator.addValidation("refCustAvailForUse","dontselect=0", "Please select one option for customers available");
 //frmvalidator.addValidation("progLang","dontselect=-1", "Please select at least one option for Programming language");
 //frmvalidator.addValidation("os","dontselect=-1", "Please select at least one option for Operating system/platform");
 frmvalidator.addValidation("thirdPartyUsed","dontselect=0", "Please specify if use another third-party product or partner to implement your solution");

 frmvalidator.addValidation("averTrainEndUser", "numeric", "Please provide a valid digit number");
 frmvalidator.addValidation("averImplTrainingDays", "numeric", "Please provide a valid digit number");
 frmvalidator.addValidation("averImplEffort", "numeric", "Please provide a valid digit number");
 frmvalidator.addValidation("averImplDuration", "numeric", "Please provide a valid digit number");
 frmvalidator.addValidation("averSizeImplTeam", "numeric", "Please provide a valid digit number");
 frmvalidator.addValidation("averSaleCycle", "numeric", "Please provide a valid digit number");
 frmvalidator.addValidation("noCustomers", "numeric", "Please provide a valid digit number");
 frmvalidator.addValidation("smallImpl", "numeric", "Please provide a valid digit number");
 frmvalidator.addValidation("largeImpl", "numeric", "Please provide a valid digit number");
 frmvalidator.addValidation("smallImplTime", "numeric", "Please provide a valid digit number");
 frmvalidator.addValidation("largeImplTime", "numeric", "Please provide a valid digit number");
 frmvalidator.addValidation("smallImplTeamNo", "numeric", "Please provide a valid digit number");
 frmvalidator.addValidation("largeImplTeamNo", "numeric", "Please provide a valid digit number");
 frmvalidator.addValidation("totalAppBaseLinePrice", "numeric", "Please provide a valid digit number");
 frmvalidator.addValidation("hardwareCost", "numeric", "Please provide a valid digit number");
 frmvalidator.addValidation("averLicensePrice", "numeric", "Please provide a valid digit number");
 frmvalidator.addValidation("addServiceCost", "numeric", "Please provide a valid digit number");
 frmvalidator.addValidation("implCost", "numeric", "Please provide a valid digit number");

 frmvalidator.addValidation("lastReviewBySAP","date", "Please enter a valid date, format MM/DD/YYYY");
 frmvalidator.addValidation("lastReviewBySAP","date_lessthan_today", "The date is greater than today date");

 frmvalidator.addValidation("sapCertSince","date", "Please enter a valid date, format MM/DD/YYYY");
 frmvalidator.addValidation("sapCertSince","date_lessthan_today", "The date is greater than today date");
 frmvalidator.addValidation("lastReviewBySAP","date_greater_than", "The date should be greater than certified date");

 
 //secondary_business_type
</script>