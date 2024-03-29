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

<%@ taglib uri="http://java.sun.com/portlet" prefix="portlet" %>

<%@ page import="com.sample.registration.model.UserItem" %>
<%@ page import="com.sample.registration.model.CountryItem" %>
<%@ page import="com.sample.registration.model.CompanyItem" %>
<%@ page import="com.sample.registration.model.BusinesstypeItem" %>
<%@ page import="com.sample.registration.model.UserItemDAO" %>
<%@ page import="com.sample.registration.model.CountryItemDAO" %>
<%@ page import="com.sample.registration.model.CompanyItemDAO" %>
<%@ page import="com.sample.registration.model.AdressItem" %>
<%@ page import="com.sample.registration.model.AdressItemDAO" %>
<%@ page import="com.sample.registration.model.BusinesstypeItemDAO" %>
<%@ page import="com.sample.registration.model.CompanyToBusinesstypeItemDAO" %>
<%@ page import="com.sample.registration.model.SAPSolutionItem" %>
<%@ page import="com.sample.registration.model.SAPSolutionItemDAO" %>
<%@ page import="com.sample.registration.model.IndustryItem" %>
<%@ page import="com.sample.registration.model.IndustryItemDAO" %>
<%@ page import="com.sample.registration.util.ConnectionPool" %>
<%@ page import="com.sample.registration.model.CompanyUtil" %>

<%@ page import="java.util.List" %>

<%@ page import="javax.portlet.WindowState" %>

<portlet:defineObjects />

<form action="<portlet:actionURL />" method="post" name="fm">

<%
String command = request.getParameter("command");
List countryItems = CountryItemDAO.getCountryItems();
List userCountryItems = CountryItemDAO.getCountryItems();
List coverageCountryItems = CountryItemDAO.getCountryItems();
List parentCountryItems = CountryItemDAO.getCountryItems();
List businessTypeItems = BusinesstypeItemDAO.getBusinessTypeItems(); 
List businessTypeItems2 = BusinesstypeItemDAO.getBusinessTypeItems(); 
List sapSolutionItems = SAPSolutionItemDAO.getSAPSolutionItems(); 
List industryItems = IndustryItemDAO.getIndustryItems(); 


if (command == null)
{

}
if ((command != null) && (command.equals("add") || command.equals("edit"))) {
	int id = 0;
	int userId = 0;
    String userCompanyName = "";
    String userPositionCompany = "";
    String userMobilePhone = "";
    String userWorkPhone = ""; 
	String partnerDescription = ""; 
	int partnerNumber = 1; 
    String partnerNumberWideEdit = ""; 
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
    String noemployees = "";
    String geographic_coverage = ""; 	
    String parent_company_name = ""; 
    String country_parent_company = ""; 
    String channel_partner_since = ""; 
    String primary_business_type = ""; 	
    String secondary_business_type	= ""; 
    String sap_solution_focus = ""; 
    String industry	= ""; 
    String industry_micro_vertical_focus = ""; 	
    String last_review_Date = ""; 	
    String reviewed_by = ""; 
    String profile_added = ""; 
    String date_updated = ""; 
    String modified_by = ""; 
    
	if (command.equals("edit")) {
		id = Integer.parseInt(request.getParameter("id"));
		UserItem userItem = UserItemDAO.getUserItemByCompanyId(id);
		AdressItem adressUserItem = null;
		if(userItem != null)
		{
			userId = userItem.getId();
			first_name = userItem.getName();
			last_name = userItem.getUserLastName();
			userCompanyName = userItem.getUserCompanyName();
			userPositionCompany = userItem.getUserPosition();
			telephone_user = userItem.getUserMobilePhone();
			telefax_user = userItem.getUserWorkPhone();
			int adressId = userItem.getAdressId();
			int countryId = 0;
			
			if(adressId>0)
			{
				adressUserItem = AdressItemDAO.getAdressItem(adressId);
				mail_user= adressUserItem.getMail();	
				street1_user = adressUserItem.getStreet1();	
				street2_user = adressUserItem.getStreet2();	
				zipcode_user = adressUserItem.getZip();	
				city_user = adressUserItem.getCity();	
				state_province_user = adressUserItem.getCity();
				countryId = adressUserItem.getCountryId();
			}	
			if(countryId > 0)
				country_user = CountryItemDAO.getCountryItem(countryId).getCountryName();
		}
		else
		{
		//alert("User is null!);
		}		
		// company part
		AdressItem adressCompItem = null;
		CompanyItem companyItem = CompanyItemDAO.getCompanyItem(id);
		userCompanyName = companyItem.getName();
		partnerDescription = companyItem.getDescription();
		//partnerNumber = companyItem.getCompanyNo(); 
		micrositeAdress = ""; 
		company_website = "";
	    noemployees = "";
	    last_review_Date = ""; 	
	    reviewed_by = ""; 
	    profile_added = ""; 
	    date_updated = ""; 
	    modified_by = ""; 		

    	telephone = "";// companyItem.getAdressId(); 
    	telefax = "" ;//companyItem.getAdressId(); 
    	mail = "";//companyItem.getAdressId(); 
	    street1 = "";//companyItem.getAdressId(); 
	    street2 = "";//companyItem.getAdressId(); 
    	zipcode = ""; 
    	city = ""; 
    	state_province = ""; 
    	country = ""; 
	    geographic_coverage = ""; 	
	    parent_company_name = ""; 
	    country_parent_company = ""; 
	    channel_partner_since = ""; 
	    primary_business_type = ""; 	
	    secondary_business_type	= ""; 
	    sap_solution_focus = ""; 
	    industry = ""; 
	    industry_micro_vertical_focus = ""; 	
		
	}
%>
<script type="text/javascript">

</script>
	<input name="command" type="hidden" value="<%= command %>">
	<input name="id" type="hidden" value="<%= id %>">
	<input name="userId" type="hidden" value="<%= userId %>">

	<table border="0" cellpadding="0" cellspacing="0">

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
			<input class="form-text" name="userCompanyName" type="text" value="<%= userCompanyName %>">
		</td>
	</tr>
	<tr>
		<td>
			Partner description
		</td>
		<td style="padding-left: 10px;"></td>
		<td>
			<input class="form-text" name="partnerDescription" type="text" value="<%= partnerDescription %>">
		</td>
	</tr>
	<tr>
		<td>
			Partner number
		</td>
		<td style="padding-left: 10px;"></td>
		<td>
			<input class="form-text" name="partnerNumber" type="text" value="<%= partnerNumber %>">
		</td>
	</tr>
	<tr>
		<td>
			Telephone
		</td>
		<td style="padding-left: 10px;"></td>
		<td>
			<input class="form-text" name="telephone" type="text" value="<%= telephone %>">
		</td>
	</tr>
	<tr>
		<td>
			Telefax
		</td>
		<td style="padding-left: 10px;"></td>
		<td>
			<input class="form-text" name="telefax" type="text" value="<%= telefax %>">
		</td>
	</tr>
	<tr>
		<td>
			E-mail
		</td>
		<td style="padding-left: 10px;"></td>
		<td>
			<input class="form-text" name="mail" type="text" value="<%= mail %>">
		</td>
	</tr>
	<tr>
		<td>
			Street 1
		</td>
		<td style="padding-left: 10px;"></td>
		<td>
			<input class="form-text" name="street1" type="text" value="<%= street1 %>">
		</td>
	</tr>
	<tr>
		<td>
			Street 2
		</td>
		<td style="padding-left: 10px;"></td>
		<td>
			<input class="form-text" name="street2" type="text" value="<%= street2 %>">
		</td>
	</tr>
	<tr>
		<td>
			Postal/ZIP code
		</td>
		<td style="padding-left: 10px;"></td>
		<td>
			<input class="form-text" name="zipcode" type="text" value="<%= zipcode %>">
		</td>
	</tr>
	<tr>
		<td>
			City
		</td>
		<td style="padding-left: 10px;"></td>
		<td>
			<input class="form-text" name="city" type="text" value="<%= city %>">
		</td>
	</tr>
	<tr>
		<td>
			State/Province
		</td>
		<td style="padding-left: 10px;"></td>
		<td>
			<input class="form-text" name="state_province" type="text" value="<%= state_province %>">
		</td>
	</tr>
	<tr>
		<td>
			Country
		</td>
		<td style="padding-left: 10px;"></td>
		<td>
			<SELECT NAME="country" >
			 <%
			     for (int j = 0; j< countryItems.size(); j++ )
			      {
					CountryItem countryItem = (CountryItem)countryItems.get(j);			 
                    //This is a category from the database
                    String optionCategoryValue = countryItem.getCountryName();
 
                    //Construct the option tag in a String variable
                    String optionTag = "<OPTION VALUE=\"" + optionCategoryValue + "\"";
                    
                    //if(optionCategoryValue.equals(userSelectedCategory))
                    //{
                    //    optionTag += " selected=\"selected\"";
                    //}
                    
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
			<input class="form-text" name="micrositeAdress" type="url" value="<%= micrositeAdress %>">
		</td>
	</tr>
	<tr>
		<td>
			Company Website
		</td>
		<td style="padding-left: 10px;"></td>
		<td>
			<input class="form-text" name="company_website" type="url" value="<%= company_website %>">
		</td>
	</tr>
	<tr>
		<td>
			Role/Title
		</td>
		<td style="padding-left: 10px;"></td>
		<td>
			<input class="form-text" name="userPositionCompany" type="text" value="<%= userPositionCompany %>">
		</td>
	</tr>	
	<tr>
		<td>
			First Name
		</td>
		<td style="padding-left: 10px;"></td>
		<td>
			<input class="form-text" name="first_name" type="text" value="<%= first_name %>">
		</td>
	</tr>	
	<tr>
		<td>
			Last Name
		</td>
		<td style="padding-left: 10px;"></td>
		<td>
			<input class="form-text" name="last_name" type="text" value="<%= last_name %>">
		</td>
	</tr>	
	<tr>
		<td>
			Telephone
		</td>
		<td style="padding-left: 10px;"></td>
		<td>
			<input class="form-text" name="telephone_user" type="text" value="<%= telephone_user %>">
		</td>
	</tr>	
	<tr>
		<td>
			Telefax
		</td>
		<td style="padding-left: 10px;"></td>
		<td>
			<input class="form-text" name="telefax_user" type="text" value="<%= telefax_user %>">
		</td>
	</tr>	
	<tr>
		<td>
			E-mail
		</td>
		<td style="padding-left: 10px;"></td>
		<td>
			<input class="form-text" name="mail_user" type="text" value="<%= mail_user %>">
		</td>
	</tr>	
	<tr>
		<td>
			Street 1
		</td>
		<td style="padding-left: 10px;"></td>
		<td>
			<input class="form-text" name="street1_user" type="text" value="<%= street1_user %>">
		</td>
	</tr>	
	<tr>
		<td>
			Street 2
		</td>
		<td style="padding-left: 10px;"></td>
		<td>
			<input class="form-text" name="street2_user" type="text" value="<%= street2_user %>">
		</td>
	</tr>	
	<tr>
		<td>
			Postal/ZIP Code
		</td>
		<td style="padding-left: 10px;"></td>
		<td>
			<input class="form-text" name="zipcode_user" type="text" value="<%= zipcode_user %>">
		</td>
	</tr>	
	<tr>
		<td>
			City
		</td>
		<td style="padding-left: 10px;"></td>
		<td>
			<input class="form-text" name="city_user" type="text" value="<%= city_user %>">
		</td>
	</tr>		
	<tr>
		<td>
			State/Province
		</td>
		<td style="padding-left: 10px;"></td>
		<td>
			<input class="form-text" name="state_province_user" type="text" value="<%= state_province_user %>">
		</td>
	</tr>		
	<tr>
		<td>
			Country
		</td>
		<td style="padding-left: 10px;"></td>
		<td>
			<SELECT NAME="country_user">
			 <%
			     for (int j = 0; j< userCountryItems.size(); j++ )
			      {
					CountryItem countryItem = (CountryItem)userCountryItems.get(j);			 
                    //This is a category from the database
                    String optionCategoryValue = countryItem.getCountryName();
 
                    //Construct the option tag in a String variable
                    String optionTag = "<OPTION VALUE=\"" + optionCategoryValue + "\"";
                    
                    //if(optionCategoryValue.equals(userSelectedCategory))
                    //{
                    //    optionTag += " selected=\"selected\"";
                    //}
                    
                    //close the option tag
                    optionTag += ">" + optionCategoryValue + "</OPTION>";
                    
                    //printout the option tag
                    out.println(optionTag);
			        //System.out.print(i.next()); 
			      }			 
                //Close the result set and statment to free up resoures
			%>
			</SELECT>
			<!-- <input class="form-text" name="country_user" type="text" value="<%= country_user %>"> -->
		</td>
	</tr>		
	<tr>
		<td>
			Total number of employees in your organization/company
		</td>
		<td style="padding-left: 10px;"></td>
		<td>
			<input class="form-text" name="noemployees" type="text" value="<%= noemployees %>">
		</td>
	</tr>		
	<tr>
		<td>
			Company geographic coverage
		</td>
		<td style="padding-left: 10px;"></td>
		<td>
			<SELECT NAME="country_coverage" MULTIPLE>
			 <%
			     for (int j = 0; j< coverageCountryItems.size(); j++ )
			      {
					CountryItem countryItem = (CountryItem)coverageCountryItems.get(j);			 
                    //This is a category from the database
                    String optionCategoryValue = countryItem.getCountryName();
 
                    //Construct the option tag in a String variable
                    String optionTag = "<OPTION VALUE=\"" + optionCategoryValue + "\"";
                    
                    //if(optionCategoryValue.equals(userSelectedCategory))
                    //{
                    //    optionTag += " selected=\"selected\"";
                    //}
                    
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
			<input class="form-text" name="parent_company_name" type="text" value="<%= parent_company_name %>">
		</td>
	</tr>	
	<tr>
		<td>
			Country of registration of parent company
		</td>
		<td style="padding-left: 10px;"></td>
		<td>
			<SELECT NAME="country_parent_company" >
			 <%
			     for (int j = 0; j< parentCountryItems.size(); j++ )
			      {
					CountryItem countryItem = (CountryItem)parentCountryItems.get(j);			 
                    //This is a category from the database
                    String optionCategoryValue = countryItem.getCountryName();
 
                    //Construct the option tag in a String variable
                    String optionTag = "<OPTION VALUE=\"" + optionCategoryValue + "\"";
                    
                    //if(optionCategoryValue.equals(userSelectedCategory))
                    //{
                    //    optionTag += " selected=\"selected\"";
                    //}
                    
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
			<input class="form-text" name="channel_partner_since" type="text" value="<%= channel_partner_since %>">
		</td>
	</tr>	
	<tr>
		<td>
			What is your primary business type?
		</td>
		<td style="padding-left: 10px;"></td>
		<td>
			<SELECT NAME="primary_business_type" >
			 <%
		     for (int j = 0; j< businessTypeItems.size(); j++ )
		      {
				BusinesstypeItem businessItem = (BusinesstypeItem)businessTypeItems.get(j);			 
                //This is a category from the database
                String optionCategoryValue = businessItem.getBusinessName();
 
                //Construct the option tag in a String variable
                String optionTag = "<OPTION VALUE=\"" + optionCategoryValue + "\"";
                    
                //if(optionCategoryValue.equals(userSelectedCategory))
                //{
                //    optionTag += " selected=\"selected\"";
                //}
                    
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
			<SELECT NAME="secondary_business_type" >
			 <%
		     for (int j = 0; j< businessTypeItems2.size(); j++ )
		      {
				BusinesstypeItem businessItem = (BusinesstypeItem)businessTypeItems2.get(j);			 
                //This is a category from the database
                String optionCategoryValue = businessItem.getBusinessName();
 
                //Construct the option tag in a String variable
                String optionTag = "<OPTION VALUE=\"" + optionCategoryValue + "\"";
                    
                //if(optionCategoryValue.equals(userSelectedCategory))
                //{
                //    optionTag += " selected=\"selected\"";
                //}
                    
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
			<SELECT NAME="sap_solution_focus" MULTIPLE SIZE 3 >
			 <%
		     for (int j = 0; j< sapSolutionItems.size(); j++ )
		      {
				SAPSolutionItem sapsolutionItem = (SAPSolutionItem)sapSolutionItems.get(j);			 
                //This is a category from the database
                String optionCategoryValue = sapsolutionItem.getSAPSolutionName();
 
                //Construct the option tag in a String variable
                String optionTag = "<OPTION VALUE=\"" + optionCategoryValue + "\"";
                    
                //if(optionCategoryValue.equals(userSelectedCategory))
                //{
                //    optionTag += " selected=\"selected\"";
                //}
                    
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
			<SELECT NAME="industry" MULTIPLE SIZE: 10>
			 <%
		     for (int j = 0; j< industryItems.size(); j++ )
		      {
				IndustryItem industryItem = (IndustryItem)industryItems.get(j);			 
                //This is a category from the database
                String optionCategoryValue = industryItem.getIndustryName();
 
                //Construct the option tag in a String variable
                String optionTag = "<OPTION VALUE=\"" + optionCategoryValue + "\"";
                    
                //if(optionCategoryValue.equals(userSelectedCategory))
                //{
                //    optionTag += " selected=\"selected\"";
                //}
                    
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
			<input class="form-text" name="last_review_Date" type="text" value="<%= last_review_Date %>">
		</td>
	</tr>	
	<tr>
		<td>
			Reviewed By
		</td>
		<td style="padding-left: 10px;"></td>
		<td>
			<input class="form-text" name="reviewed_by" type="text" value="<%= reviewed_by %>">
		</td>
	</tr>	


	</table>

	<br>

	<input class="portlet-form-button" type="submit" value="Save">

	<%
	if (renderRequest.getWindowState().equals(WindowState.MAXIMIZED)) {
	%>

		<script type="text/javascript">
			document.fm.name.focus();
		</script>
	<%
	}
	%>

<%
}
else {
%>

	<input name="command" type="hidden" value="">
	<input name="id" type="hidden" value="">

	<input class="portlet-form-button" type="button" value="Add" onClick="self.location = '<portlet:renderURL><portlet:param name="command" value="add" /></portlet:renderURL>';">

	<br><br>

	<table border="1" cellpadding="4" cellspacing="2" width="100%">
	<tr>
		<td>
			<b>Company Name</b>
		</td>
		<td>
			<b>Partner Description</b>
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
	List companyItems = CompanyItemDAO.getCompanyItems();

	for (int i = 0; i < companyItems.size(); i++) {
		CompanyItem companyItem = (CompanyItem)companyItems.get(i);
	%>

		<tr>
			<td>
				<%= companyItem.getName() %>
			</td>
			<td>
				<%= companyItem.getDescription() %>
			</td>
			<td>
				<%= CompanyUtil.getCompanyIndustries(companyItem) %>
			</td>
			<td>
				<%= companyItem.getCompanyEmpNo() %>
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

				<input class="portlet-form-button" type="button" value="Delete" onClick="document.fm.command.value = 'delete'; document.fm.id.value = '<%= companyItem.getId() %>'; document.fm.submit();">
			</td>
		</tr>

	<%
	}
	%>

	</table>

<%
}
%>

</form>