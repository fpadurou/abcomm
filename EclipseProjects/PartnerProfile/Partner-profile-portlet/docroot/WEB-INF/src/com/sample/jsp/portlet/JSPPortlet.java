/**
 * Copyright (c) 2000-2007 Liferay, Inc. All rights reserved.
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

package com.sample.partnerprofile.portlet;

import com.sample.partnerprofile.model.UserItem;
import com.sample.partnerprofile.model.UserItemDAO;
import com.sample.partnerprofile.model.CompanyItem;
import com.sample.partnerprofile.model.CompanyItemDAO;
import com.sample.partnerprofile.model.CompanyUtil;
import com.sample.partnerprofile.model.CountryItem;
import com.sample.partnerprofile.model.CountryItemDAO;
import com.sample.partnerprofile.model.AdressItem;
import com.sample.partnerprofile.model.AdressItemDAO;
import com.sample.partnerprofile.util.ConnectionPool;
import com.sample.partnerprofile.model.CompanyImport ;
//import java.awt.List;
import java.io.IOException;
import java.util.List;

import javax.portlet.ActionRequest;
import javax.portlet.ActionResponse;
import javax.portlet.GenericPortlet;
import javax.portlet.PortletException;
import javax.portlet.PortletRequestDispatcher;
import javax.portlet.RenderRequest;
import javax.portlet.RenderResponse;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;

import java.sql.SQLException;
import java.util.Date;
import java.text.SimpleDateFormat;
import java.text.DateFormat;
import java.text.ParseException;
import javax.portlet.PortletConfig;

import com.liferay.portal.util.PortalUtil;

/**
 * <a href="JSPPortlet.java.html"><b><i>View Source</i></b></a>
 * 
 * @author Brian Wing Shun Chan
 * 
 */
public class JSPPortlet extends GenericPortlet {

	public void init(PortletConfig config) throws PortletException {
		super.init(config);

		_log.info("Initializing portlet");
	}

	public void processAction(ActionRequest req, ActionResponse res)
			throws IOException, PortletException {

		String command = req.getParameter("command");

		int id = 0;
		long userId = 0;
		userId = PortalUtil.getUserId(req); 
		System.out.println("userId in action request este " + String.valueOf(userId));
		
		try {
			id = Integer.parseInt(req.getParameter("id"));
			//userId = Integer.parseInt(req.getParameter("userId"));
		} catch (Exception e) {
		}

		// user relatesd
		String name = req.getParameter("first_name");
		String userLastName = req.getParameter("last_name");
		String userCompanyName = req.getParameter("userCompanyName");
		String userPositionCompany = req.getParameter("userPositionCompany");
		String userMobilePhone = req.getParameter("telephone_user");
		String userWorkPhone = req.getParameter("telefax_user");
		// company related
		String partnerDescription = req.getParameter("partnerDescription");
		int partnerNumber = 1;
		if(req.getParameter("partnerNumber") != null)
			partnerNumber = Integer.parseInt(req.getParameter("partnerNumber"));
		String telephone = req.getParameter("telephone");
		String telefax = req.getParameter("telefax");
		String mail = req.getParameter("mail");
		String street1 = req.getParameter("street1");
		String street2 = req.getParameter("street2");
		String zipcode = req.getParameter("zipcode");
		String city = req.getParameter("city");
		String state_province = req.getParameter("state_province");
		String country = req.getParameter("country");
		String micrositeAdress = req.getParameter("micrositeAdress");
		String company_website = req.getParameter("company_website");
		String noemployees = req.getParameter("noemployees");
		String geographic_coverage = req.getParameter("geographic_coverage");
		String parent_company_name = req.getParameter("parent_company_name");
		String country_parent_company = req.getParameter("country_parent_company");
		String channel_partner_since = req.getParameter("channel_partner_since");
		String primary_business_type = req.getParameter("primary_business_type");
		String secondary_business_type = req.getParameter("secondary_business_type");
		String sap_solution_focus = req.getParameter("sap_solution_focus");
		String industry_micro_vertical_focus = req.getParameter("industry_micro_vertical_focus");

		String last_review_Date = req.getParameter("last_review_Date");
		String reviewed_by = req.getParameter("reviewed_by");
		String profile_added = "" ;//req.getParameter("profile_added");
		String date_updated = "";//req.getParameter("date_updated");
		String modified_by = req.getParameter("modified_by");
	    String[] SAPitems = req.getParameterValues("sap_solution_focus");
		String[] industry = req.getParameterValues("industry");
		String[] countryCoverage = req.getParameterValues("country_coverage");

//search related
	    String[] SAPitems_search = req.getParameterValues("sap_solution_focus_search");
		String industrySearch = req.getParameter("industry_search");
		String[] countryCoverage_search = req.getParameterValues("country_coverage_search");
		String country_search = req.getParameter("country_search");
		String primary_business_type_search = req.getParameter("primary_business_type_search");
		try {
			SimpleDateFormat format =
	            new SimpleDateFormat("MM/dd/yyyy");
			DateFormat df = DateFormat.getDateInstance(DateFormat.SHORT);
			
			if (command.equals("add")) {
				// user
				// user adress + phone

				// company
				CompanyItem companyItem = new CompanyItem();

				companyItem.setName(userCompanyName);
				companyItem.setDescription(partnerDescription);
				companyItem.setCompanyNo(partnerNumber);
				companyItem.setCompanyFriendlySite(micrositeAdress);
				companyItem.setCompanySite(company_website);
				if(noemployees != null && !noemployees.isEmpty())
					companyItem.setCompanyEmpNo(Integer.parseInt(noemployees));
				companyItem.setParentCompanyName(parent_company_name);
				if(channel_partner_since != null && !channel_partner_since.isEmpty())
					companyItem.setYear(Integer.parseInt(channel_partner_since));
				if (country_parent_company != "")
				{
					CountryItem countryItemTemp = CountryItemDAO.getCountryItemByName(country_parent_company);
					if(countryItemTemp != null)
						companyItem.setCountryRegistrationId(countryItemTemp.getId());
				}

				Date tempDate = new Date();
				
				companyItem.setDateUpdated(new Date());
				companyItem.setDateLastReview(new Date());
				companyItem.setDateUpdated(new Date());

				if(last_review_Date != null && !last_review_Date.isEmpty())
				{
					try{
						tempDate = format.parse(last_review_Date);
						String value = tempDate.toString();
						companyItem.setDateLastReview(tempDate);
					} catch (ParseException ex){}
				}
				
				companyItem.setReviewedBy(reviewed_by);
				companyItem.setModifiedBy(modified_by);
				companyItem.setCompanyUserId(userId);

				CompanyItemDAO.addCompanyItem(companyItem);

				int adressId = companyItem.getAdressId();
				AdressItem adressItem = null;
				if(adressId <= 0 )
				{
					adressItem = new AdressItem();
					adressItem.setCompanyId(companyItem.getId());
					adressItem.setStreet1(street1);
					adressItem.setStreet2(street2);
					adressItem.setCity(city);
					adressItem.setZip(zipcode);
					adressItem.setStateregionname(state_province);
					adressItem.setMail(mail);
					// countryId
					if (country != "")
					{
						CountryItem countryItemTemp = CountryItemDAO.getCountryItemByName(country);
						adressItem.setCountryId(countryItemTemp.getId());
					}
					AdressItemDAO.addAdressItem(adressItem);

					companyItem.setAdressId(adressItem.getId());

					if(telephone != "")
						AdressItemDAO.updatePhoneItem(adressItem, telephone, 1);
					if(telefax != "")
						AdressItemDAO.updatePhoneItem(adressItem, telefax, 2);
					AdressItemDAO.updateAdressItem(adressItem);
				}
				// Do update in main table
				CompanyItemDAO.updateCompanyItem(companyItem);

				//2 . SAP solution focus
	            CompanyUtil.updateCompanySAPSolutionList(companyItem, SAPitems);
	            // 3. Industry
	            CompanyUtil.updateCompanyIndustriesList(companyItem, industry);
	            //4. primary business type -- primary_business_type
	            if(primary_business_type != null)
	            	CompanyUtil.updateBusinessType(companyItem, primary_business_type, 1);
	            //5. secondary business type - secondary_business_type
	            if(secondary_business_type != null)
	            	CompanyUtil.updateBusinessType(companyItem, secondary_business_type, 2);
	            //6. country coverage

	            if(countryCoverage != null)
		        {
	            	for(int loopIndex = 0; loopIndex < countryCoverage.length; loopIndex++){
	            		System.out.println(countryCoverage[loopIndex]);
		            }
		        }
	            CompanyUtil.updateCompanyCountryCoverage(companyItem, countryCoverage);				
				
			} else if (command.equals("edit")) {
				//user
				CompanyItem companyItem = CompanyItemDAO.getCompanyItem(id);

				companyItem.setName(userCompanyName);
				companyItem.setDescription(partnerDescription);
				companyItem.setCompanyNo(partnerNumber);
				companyItem.setCompanyFriendlySite(micrositeAdress);
				companyItem.setCompanySite(company_website);
				if(noemployees != null && !noemployees.isEmpty())
					companyItem.setCompanyEmpNo(Integer.parseInt(noemployees));
				companyItem.setParentCompanyName(parent_company_name);
				if(channel_partner_since != null && !channel_partner_since.isEmpty())
					companyItem.setYear(Integer.parseInt(channel_partner_since));
				if (country_parent_company != "")
				{
					CountryItem countryItemTemp = CountryItemDAO.getCountryItemByName(country_parent_company);
					if(countryItemTemp != null)
						companyItem.setCountryRegistrationId(countryItemTemp.getId());
				}

				Date date = new Date();
				try {date = format.parse(last_review_Date);
				} catch(ParseException ex){
				}
				companyItem.setDateLastReview(date);
				/*try {date = df.parse(profile_added);
				}catch (ParseException ex){
				}
				companyItem.setDateCreated(date);*/
				companyItem.setDateUpdated(new Date());
				companyItem.setReviewedBy(reviewed_by);
				companyItem.setModifiedBy(modified_by);
	            
				// update childs
				//1 . adress + phone
				int adressId = companyItem.getAdressId();
				AdressItem adressItem = null;
				boolean bIsNew = false;  
				if(adressId > 0 )
				{
					adressItem = AdressItemDAO.getAdressItem(adressId);
				}
				else
				{
					adressItem = new AdressItem();
					bIsNew = true;
				}
				if(adressItem != null)
				{
					adressItem.setCompanyId(id);
					adressItem.setStreet1(street1);
					adressItem.setStreet2(street2);
					adressItem.setCity(city);
					adressItem.setZip(zipcode);
					adressItem.setStateregionname(state_province);
					adressItem.setMail(mail);
					// countryId
					if (country != "")
					{
						CountryItem countryItemTemp = CountryItemDAO.getCountryItemByName(country);
						adressItem.setCountryId(countryItemTemp.getId());
					}
						
					if(bIsNew)
					{
						AdressItemDAO.addAdressItem(adressItem);
						companyItem.setAdressId(adressItem.getId());
					}
					if(telephone != "")
						AdressItemDAO.updatePhoneItem(adressItem, telephone, 1);
					if(telefax != "")
						AdressItemDAO.updatePhoneItem(adressItem, telefax, 2);
					AdressItemDAO.updateAdressItem(adressItem);
				}
				// Do update in main table
				CompanyItemDAO.updateCompanyItem(companyItem);

				//2 . SAP solution focus
	            CompanyUtil.updateCompanySAPSolutionList(companyItem, SAPitems);
	            // 3. Industry
	            CompanyUtil.updateCompanyIndustriesList(companyItem, industry);
	            //4. primary business type -- primary_business_type
	            if(primary_business_type != null)
	            	CompanyUtil.updateBusinessType(companyItem, primary_business_type, 1);
	            //5. secondary business type - secondary_business_type
	            if(secondary_business_type != null)
	            	CompanyUtil.updateBusinessType(companyItem, secondary_business_type, 2);
	            //6. country coverage
	            CompanyUtil.updateCompanyCountryCoverage(companyItem, countryCoverage);
			} else if (command.equals("delete")) {
				CompanyItemDAO.deleteCompanyItem(id);
			}
			else if (command.equals("search")) {
				;
			}		
			else if (command.equals("viewall")) {
				;
			}
		} catch (SQLException sqle) {
			throw new PortletException(sqle);
		}

	}

	public void doView(RenderRequest req, RenderResponse res)
			throws IOException, PortletException {

		long userId = 0;
		userId = PortalUtil.getUserId(req); 
		System.out.println("userId in doView este " + String.valueOf(userId));
		String value = "/view.jsp";
		String command = req.getParameter("command");
		
		if(command == null)
			System.out.println("E nula comanda");
		
		if ((command != null) && (command.equals("add") || command.equals("edit"))) 
		{;} // do nothing --> comes from user commands ! (hope)
		else
		{
			if(userId > 0) // should be register!!
			{
				System.out.println("ce cauta aici?");
				List list = null;
				try {list = CompanyItemDAO.getCompanyItemsByUserId(userId);}
				catch (Exception e){}
				if(list.size()>1)
					; // do nothing, nore than one!!
				else {
					if(list.size() == 1)  // exactly one -> edit it
						;//value += "?command=edit" + "&id=" + String.valueOf(((CompanyItem)list.get(0)).getId());
					else
						value += "?command=add";
				}
			}
		}

		PortletRequestDispatcher prd = getPortletContext()
			.getRequestDispatcher(value);

		//PortletRequestDispatcher prd = getPortletContext()
			//.getRequestDispatcher("/view.jsp");

		if (prd == null) {
			_log.error("/view.jsp is not a valid include");
		}

		prd.include(req, res);
	}

	public void destroy() {
		_log.info("Destroying portlet");

		try {
			ConnectionPool.destroy();
		} catch (Exception e) {
			_log.error(e);
		}
	}

	private static Log _log = LogFactory.getLog(JSPPortlet.class);

}