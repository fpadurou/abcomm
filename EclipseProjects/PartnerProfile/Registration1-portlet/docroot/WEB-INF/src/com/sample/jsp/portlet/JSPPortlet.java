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

package com.sample.registration.portlet;

import com.sample.registration.model.UserItem;
import com.sample.registration.model.UserItemDAO;
import com.sample.registration.model.CompanyItem;
import com.sample.registration.model.CompanyItemDAO;
import com.sample.registration.util.ConnectionPool;

import java.io.IOException;

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
import java.text.DateFormat;
import java.text.ParseException;
import javax.portlet.PortletConfig;

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
		int userId = 0;

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
		int partnerNumber = Integer.parseInt(req.getParameter("partnerNumber"));
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
		String country_parent_company = req
				.getParameter("country_parent_company");
		String channel_partner_since = req
				.getParameter("channel_partner_since");
		String primary_business_type = req
				.getParameter("primary_business_type");
		String secondary_business_type = req
				.getParameter("secondary_business_type");
		String sap_solution_focus = req.getParameter("sap_solution_focus");
		String industry = req.getParameter("industry");
		String industry_micro_vertical_focus = req
				.getParameter("industry_micro_vertical_focus");

		String last_review_Date = req.getParameter("last_review_Date");
		String reviewed_by = req.getParameter("reviewed_by");
		String profile_added = req.getParameter("profile_added");
		String date_updated = req.getParameter("date_updated");
		String modified_by = req.getParameter("modified_by");

		try {
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
				companyItem.setCompanyEmpNo(Integer.parseInt(noemployees));
				companyItem.setParentCompanyName(parent_company_name);
				companyItem.setYear(Integer.parseInt(channel_partner_since));

				DateFormat df = DateFormat.getDateInstance();

				Date date = new Date();
				try{date = df.parse(last_review_Date);
				} catch (ParseException ex){
				}
				
				companyItem.setDateLastReview(date);
				companyItem.setReviewedBy(reviewed_by);
				try{date = df.parse(profile_added);
				} catch (ParseException ex){}
				companyItem.setDateCreated(date);
				try{date = df.parse(date_updated);
				} catch (ParseException ex){}
				companyItem.setDateUpdated(date);
				companyItem.setModifiedBy(modified_by);

				CompanyItemDAO.addCompanyItem(companyItem);

				/*
				 * String country_parent_company =
				 * req.getParameter("country_parent_company"); String
				 * geographic_coverage =
				 * req.getParameter("geographic_coverage"); String
				 * primary_business_type =
				 * req.getParameter("primary_business_type"); String
				 * secondary_business_type =
				 * req.getParameter("secondary_business_type"); String
				 * sap_solution_focus = req.getParameter("sap_solution_focus");
				 * String industry = req.getParameter("industry"); String
				 * industry_micro_vertical_focus =
				 * req.getParameter("industry_micro_vertical_focus");
				 * 
				 * // company adress String telephone =
				 * req.getParameter("telephone"); String telefax =
				 * req.getParameter("telefax"); String mail =
				 * req.getParameter("mail"); String street1 =
				 * req.getParameter("street1"); String street2 =
				 * req.getParameter("street2"); String zipcode =
				 * req.getParameter("zipcode"); String city =
				 * req.getParameter("city"); String state_province =
				 * req.getParameter("state_province"); String country =
				 * req.getParameter("country");
				 */
			} else if (command.equals("edit")) {
				//user
				CompanyItem companyItem = CompanyItemDAO.getCompanyItem(id);
				if(userId >0)
				{
					UserItem userItem = UserItemDAO.getUserItem(userId);
		
					userItem.setName(name);
					userItem.setUserLastName(userLastName);
					userItem.setUserCompanyName(userCompanyName);
					userItem.setUserPosition(userPositionCompany);
					userItem.setUserMobilePhone(userMobilePhone);
					userItem.setUserWorkPhone(userWorkPhone);
					UserItemDAO.updateUserItem(userItem);
				}

				companyItem.setName(userCompanyName);
				companyItem.setDescription(partnerDescription);
				companyItem.setCompanyNo(partnerNumber);
				companyItem.setCompanyFriendlySite(micrositeAdress);
				companyItem.setCompanySite(company_website);
				companyItem.setCompanyEmpNo(Integer.parseInt(noemployees));
				companyItem.setParentCompanyName(parent_company_name);
				companyItem.setYear(Integer.parseInt(channel_partner_since));

				DateFormat df = DateFormat.getDateInstance();

				Date date = new Date();
				try {date = df.parse(last_review_Date);
				} catch(ParseException ex){
				}
				companyItem.setDateLastReview(date);
				companyItem.setReviewedBy(reviewed_by);
				try {date = df.parse(profile_added);
				}catch (ParseException ex){
				}
				companyItem.setDateCreated(date);
				try {date = df.parse(date_updated);
				}catch(ParseException ex){
				}
				companyItem.setDateUpdated(date);
				companyItem.setModifiedBy(modified_by);
				CompanyItemDAO.updateCompanyItem(companyItem);
			} else if (command.equals("delete")) {
				CompanyItemDAO.deleteCompanyItem(id);
			}
		} catch (SQLException sqle) {
			throw new PortletException(sqle);
		}

	}

	public void doView(RenderRequest req, RenderResponse res)
			throws IOException, PortletException {

		PortletRequestDispatcher prd = getPortletContext()
				.getRequestDispatcher("/view.jsp");

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