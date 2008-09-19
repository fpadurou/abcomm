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

package com.sample.solutionprofile.portlet;

import com.sample.solutionprofile.model.SolutionItem;
import com.sample.solutionprofile.model.SolutionItemDAO;
import com.sample.solutionprofile.model.UserItem;
import com.sample.solutionprofile.model.UserItemDAO;
import com.sample.solutionprofile.model.CompanyItem;
import com.sample.solutionprofile.model.CompanyItemDAO;
import com.sample.solutionprofile.model.CompanyUtil;
import com.sample.solutionprofile.model.CountryItem;
import com.sample.solutionprofile.model.CountryItemDAO;
import com.sample.solutionprofile.model.AdressItem;
import com.sample.solutionprofile.model.AdressItemDAO;
import com.sample.solutionprofile.util.ConnectionPool;

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
import java.text.SimpleDateFormat;
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
		try {
			id = Integer.parseInt(req.getParameter("id"));
		} catch (Exception e) {
			System.out.println("Bzz");
		}
		//int companyId = 0;
		String partNumberStr  = req.getParameter("partNumber");
		long partNumber = 0; 
		/*try {
			partNumber  = Integer.parseInt(partNumberStr);
		}catch (Exception e) {
			System.out.println("Bzz2");
			// TODO: handle exception
		}*/
		
		String solName = req.getParameter("solName");	
		String solDesc = req.getParameter("solDesc");	
		String partComSite	= req.getParameter("partComSite");
		//int solFocus  = Integer.parseInt(req.getParameter("solFocus"));
		//int solStatusPartner = Integer.parseInt(req.getParameter("solStatusPartner"));;
		//int solStatusSAP = Integer.parseInt(req.getParameter("solStatusSAP"));
		System.out.println("Bzz3");

		String sapCertSince	= req.getParameter("sapCertSince");
		String lastReviewBySAP = req.getParameter("lastReviewBySAP");	
		int averTrainEndUser = Integer.parseInt(req.getParameter("averTrainEndUser"));
		int averImplTrainingDays = Integer.parseInt(req.getParameter("averImplTrainingDays"));
		System.out.println("Bzz4");

		int averImplEffort = Integer.parseInt(req.getParameter("averImplEffort"));
		int averImplDuration = Integer.parseInt(req.getParameter("averImplDuration"));
		int averSizeImplTeam = Integer.parseInt(req.getParameter("averSizeImplTeam"));
		int averSaleCycle = Integer.parseInt(req.getParameter("averSaleCycle"));
		int noCustomers = Integer.parseInt(req.getParameter("noCustomers"));
		int smallImpl = Integer.parseInt(req.getParameter("smallImpl"));
		int largeImpl = Integer.parseInt(req.getParameter("largeImpl"));	
		int smallImplTime = Integer.parseInt(req.getParameter("smallImplTime"));	
		System.out.println("Bzz5");

		int largeImplTime = Integer.parseInt(req.getParameter("largeImplTime"));
		int smallImplTeamNo = Integer.parseInt(req.getParameter("smallImplTeamNo"));	
		int largeImplTeamNo = Integer.parseInt(req.getParameter("largeImplTeamNo"));
		String solSite = req.getParameter("solSite");
		
		//int countryPriceEuro = Integer.parseInt(req.getParameter("countryPriceEuro"));
		
		String refCustAvailForUse = req.getParameter("refCustAvailForUse");
		if(refCustAvailForUse == null) //?WHY
			refCustAvailForUse ="No";
			
		int totalAppBaseLinePrice = Integer.parseInt(req.getParameter("totalAppBaseLinePrice"));	
		int appPriceEur	 = 0;//Integer.parseInt(req.getParameter("appPriceEur"));
		int hardwareCost = Integer.parseInt(req.getParameter("hardwareCost"));
		int hardwareCostEur = 0;//Integer.parseInt(req.getParameter("hardwareCostEur"));
		int averLicensePrice = Integer.parseInt(req.getParameter("averLicensePrice"));
		int averLicensePriceEur = 0;//Integer.parseInt(req.getParameter("averLicensePriceEur"));
		int addServiceCost = Integer.parseInt(req.getParameter("addServiceCost"));
		int addServicePriceEur = 0;//Integer.parseInt(req.getParameter("addServicePriceEur"));
		int implCost	 = Integer.parseInt(req.getParameter("implCost"));
		int implCostEur = 0;//Integer.parseInt(req.getParameter("implCostEur"));	
		System.out.println("Bzz5");
		String  sapDiscount	 = req.getParameter("sapDiscount");
		String dbUsed = req.getParameter("dbUsed");	
		String SAPBusUsed = req.getParameter("SAPBusUsed");	
		String SAPGUIUsed = req.getParameter("SAPGUIUsed");	
		String compA1B1Used = req.getParameter("compA1B1Used");	
		String thirdPartyUsed = req.getParameter("thirdPartyUsed");	
		String thirdPartyName  = req.getParameter("thirdPartyName");	
		String otherIT = req.getParameter("otherIT");	
		String addRemarks = req.getParameter("addRemarks");	
		String solSAPMicroSite = req.getParameter("solSAPMicroSite");	
		
		String lastPartRevieDate = req.getParameter("solSAPMicroSite");	
		String reviewedBy	 = req.getParameter("reviewedBy");
		if(reviewedBy == null) // WHY?
			reviewedBy = "";
		String profileAdded	 = req.getParameter("profileAdded");
		if(profileAdded == null) // WHY?
			profileAdded = "";
		String dateCreated	 = req.getParameter("dateCreated");
		String modifiedBy = req.getParameter("modifiedBy");	
		if(modifiedBy == null) // WHY?
			modifiedBy = "";
		String dateUpdated = req.getParameter("dateUpdated");	
		String notificationProc = req.getParameter("notificationProc");
		if(notificationProc == null) // WHY?
			notificationProc = "";
		String notificationText = req.getParameter("notificationText");
		if(notificationText == null) // WHY?
			notificationText = "";
		
		// childs
		String sol_countryPriceEuro = req.getParameter("country");
		String sol_solFocusStr = req.getParameter("solFocusStr");
		String[] sol_geographic_coverage = req.getParameterValues("country");
		String[] sol_industry = req.getParameterValues("industry");
		String[] sol_sapSolFocusItems = req.getParameterValues("sapSolFocusItems");
		String[] sol_mySAPAllInOneVers = req.getParameterValues("mySAPAllInOneVers");
		String[] sol_mySAPOneProductVers = req.getParameterValues("mySAPOneProductVers");
		
		String sol_maturity = req.getParameter("maturity");
		String sol_statusByProvider = req.getParameter("statusByProvider"); 
		String sol_statusBySAP = req.getParameter("statusBySAP"); 

		String[] sol_targetCompSize = req.getParameterValues("targetCompSize");
		String[] sol_categTarget = req.getParameterValues("categTarget");
		String[] sol_langAvailable = req.getParameterValues("langAvailable");
		
		String sol_userType = req.getParameter("userType"); 

		String[] sol_progLang = req.getParameterValues("progLang");
		String[] sol_os = req.getParameterValues("os");
		String[] sol_aioBased = req.getParameterValues("aioBased");

//search related
		try {
			SimpleDateFormat format =
	            new SimpleDateFormat("MM/dd/yyyy");
			DateFormat df = DateFormat.getDateInstance(DateFormat.SHORT);
			Date tempDate = new Date();
			if (command.equals("add")) {
				// user
				// user adress + phone

				// solution
				SolutionItem solutionItem = new SolutionItem();

				//public int companyId;
				//solutionItem.partNumber;	
				solutionItem.solName = solName  ;	
				solutionItem.solDesc = solDesc ;	
				solutionItem.partComSite = partComSite	;
				//solutionItem.solFocus = 	;
				//solutionItem.solStatusPartner;
				//solutionItem.solStatusSAP;
				//solutionItem.solMaturity;
				//solutionItem.statusByProvider;
				//solutionItem.statusBySAP;
				//solutionItem.solUserType;

				//date
				if(sapCertSince != null && !sapCertSince.isEmpty())
				{
					try{
						tempDate = format.parse(sapCertSince);
						String value = tempDate.toString();
						solutionItem.sapCertSince = tempDate;
					} catch (ParseException ex){}
				}				

				if(lastReviewBySAP != null && !lastReviewBySAP.isEmpty())
				{
					try{
						tempDate = format.parse(lastReviewBySAP);
						String value = tempDate.toString();
						solutionItem.lastReviewBySAP = tempDate;
					} catch (ParseException ex){}
				}				
				
				solutionItem.averTrainEndUser = averTrainEndUser  ;
				solutionItem.averImplTrainingDays = averImplTrainingDays;	
				solutionItem.averImplEffort = averImplEffort;	
				solutionItem.averImplDuration = averImplDuration;	
				solutionItem.averSizeImplTeam = averSizeImplTeam;	
				solutionItem.averSaleCycle = averSaleCycle;	
				solutionItem.noCustomers = noCustomers;	
				solutionItem.smallImpl = smallImpl;
				solutionItem.largeImpl = largeImpl;	
				solutionItem.smallImplTime = smallImplTime;	
				solutionItem.largeImplTime = largeImplTime;	
				solutionItem.smallImplTeamNo = smallImplTeamNo;	
				solutionItem.largeImplTeamNo = largeImplTeamNo;
				
				solutionItem.solSite = solSite;
				
				//solutionItem.countryPriceEuro;
				
				solutionItem.refCustAvailForUse = refCustAvailForUse;	
				solutionItem.totalAppBaseLinePrice = totalAppBaseLinePrice ;	
				solutionItem.appPriceEur = appPriceEur;
				solutionItem.hardwareCost = hardwareCost;
				solutionItem.hardwareCostEur = hardwareCostEur;	
				solutionItem.averLicensePrice = averLicensePrice;	
				solutionItem.averLicensePriceEur = averLicensePriceEur;	
				solutionItem.addServiceCost = addServiceCost	;
				solutionItem.addServicePriceEur = addServicePriceEur;	
				solutionItem.implCost = implCost ;
				solutionItem.implCostEur = implCostEur;	
				solutionItem.sapDiscount = sapDiscount	;
				solutionItem.dbUsed = dbUsed;	
				solutionItem.SAPBusUsed = SAPBusUsed;	
				solutionItem.SAPGUIUsed = SAPGUIUsed;	
				solutionItem.compA1B1Used = compA1B1Used;	
				solutionItem.thirdPartyUsed = thirdPartyUsed;	
				solutionItem.thirdPartyName = thirdPartyName ;	
				solutionItem.otherIT = otherIT ;	
				solutionItem.addRemarks = addRemarks ;	
				solutionItem.solSAPMicroSite = solSAPMicroSite;	
				
				// date
				if(lastPartRevieDate != null && !lastPartRevieDate.isEmpty())
				{
					try{
						tempDate = format.parse(lastPartRevieDate);
						String value = tempDate.toString();
						solutionItem.lastPartRevieDate = tempDate;
					} catch (ParseException ex){}
				}	
				
				solutionItem.reviewedBy	= reviewedBy ;
				solutionItem.profileAdded = profileAdded;
				//date
				solutionItem.dateCreated = new Date();
				
				solutionItem.modifiedBy = modifiedBy;
				
				//date
				solutionItem.dateUpdated = new Date();	
				solutionItem.notificationProc = notificationProc;
				solutionItem.notificationText = notificationText;
				
				SolutionItemDAO.addSolutionItem(solutionItem);
				// childs
				/*
				
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

				SolutionItemDAO.addSolutionItem(solutionItem);

				//2 . SAP solution focus
				/*if(SAPitems != null)
		        {
					for(int loopIndex = 0; loopIndex < SAPitems.length; loopIndex++){
		            System.out.println(SAPitems[loopIndex]);
		            }
		        }
	            CompanyUtil.updateCompanySAPSolutionList(companyItem, SAPitems);
	            // 3. Industry
	            if(industry != null)
		        {
	            	for(int loopIndex = 0; loopIndex < industry.length; loopIndex++){
		            System.out.println(industry[loopIndex]);
		            }
		        }
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
	            CompanyUtil.updateCompanyCountryCoverage(companyItem, countryCoverage);	*/			
				
			} else if (command.equals("edit")) {
				//user
				SolutionItem solutionItem = SolutionItemDAO.getSolutionItem(id);
				//public int companyId;
				//solutionItem.partNumber;	
				solutionItem.solName = solName  ;	
				solutionItem.solDesc = solDesc ;	
				solutionItem.partComSite = partComSite	;
				//solutionItem.solFocus = 	;
				//solutionItem.solStatusPartner;
				//solutionItem.solStatusSAP;
				//solutionItem.solMaturity;
				//solutionItem.statusByProvider;
				//solutionItem.statusBySAP;
				//solutionItem.solUserType;

				//date
				if(sapCertSince != null && !sapCertSince.isEmpty())
				{
					try{
						tempDate = format.parse(sapCertSince);
						String value = tempDate.toString();
						solutionItem.sapCertSince = tempDate;
					} catch (ParseException ex){}
				}				

				if(lastReviewBySAP != null && !lastReviewBySAP.isEmpty())
				{
					try{
						tempDate = format.parse(lastReviewBySAP);
						String value = tempDate.toString();
						solutionItem.lastReviewBySAP = tempDate;
					} catch (ParseException ex){}
				}				
				
				solutionItem.averTrainEndUser = averTrainEndUser  ;
				solutionItem.averImplTrainingDays = averImplTrainingDays;	
				solutionItem.averImplEffort = averImplEffort;	
				solutionItem.averImplDuration = averImplDuration;	
				solutionItem.averSizeImplTeam = averSizeImplTeam;	
				solutionItem.averSaleCycle = averSaleCycle;	
				solutionItem.noCustomers = noCustomers;	
				solutionItem.smallImpl = smallImpl;
				solutionItem.largeImpl = largeImpl;	
				solutionItem.smallImplTime = smallImplTime;	
				solutionItem.largeImplTime = largeImplTime;	
				solutionItem.smallImplTeamNo = smallImplTeamNo;	
				solutionItem.largeImplTeamNo = largeImplTeamNo;
				
				solutionItem.solSite = solSite;
				
				//solutionItem.countryPriceEuro;
				
				solutionItem.refCustAvailForUse = refCustAvailForUse;	
				solutionItem.totalAppBaseLinePrice = totalAppBaseLinePrice ;	
				solutionItem.appPriceEur = appPriceEur;
				solutionItem.hardwareCost = hardwareCost;
				solutionItem.hardwareCostEur = hardwareCostEur;	
				solutionItem.averLicensePrice = averLicensePrice;	
				solutionItem.averLicensePriceEur = averLicensePriceEur;	
				solutionItem.addServiceCost = addServiceCost	;
				solutionItem.addServicePriceEur = addServicePriceEur;	
				solutionItem.implCost = implCost ;
				solutionItem.implCostEur = implCostEur;	
				solutionItem.sapDiscount = sapDiscount	;
				solutionItem.dbUsed = dbUsed;	
				solutionItem.SAPBusUsed = SAPBusUsed;	
				solutionItem.SAPGUIUsed = SAPGUIUsed;	
				solutionItem.compA1B1Used = compA1B1Used;	
				solutionItem.thirdPartyUsed = thirdPartyUsed;	
				solutionItem.thirdPartyName = thirdPartyName ;	
				solutionItem.otherIT = otherIT ;	
				solutionItem.addRemarks = addRemarks ;	
				solutionItem.solSAPMicroSite = solSAPMicroSite;	
				
				// date
				if(lastPartRevieDate != null && !lastPartRevieDate.isEmpty())
				{
					try{
						tempDate = format.parse(lastPartRevieDate);
						String value = tempDate.toString();
						solutionItem.lastPartRevieDate = tempDate;
					} catch (ParseException ex){}
				}	
				
				solutionItem.reviewedBy	= reviewedBy ;
				solutionItem.profileAdded = profileAdded;
				//date
				solutionItem.dateCreated = new Date();
				
				solutionItem.modifiedBy = modifiedBy;
				
				//date
				solutionItem.dateUpdated = new Date();	
				solutionItem.notificationProc = notificationProc;
				solutionItem.notificationText = notificationText;
				// Do update in main table
				SolutionItemDAO.updateSolutionItem(solutionItem);
/*
				//2 . SAP solution focus
				if(SAPitems != null)
		        {
					for(int loopIndex = 0; loopIndex < SAPitems.length; loopIndex++){
		            System.out.println(SAPitems[loopIndex]);
		            }
		        }
	            CompanyUtil.updateCompanySAPSolutionList(companyItem, SAPitems);
	            // 3. Industry
	            if(industry != null)
		        {
	            	for(int loopIndex = 0; loopIndex < industry.length; loopIndex++){
		            System.out.println(industry[loopIndex]);
		            }
		        }
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
	            System.out.println("a facut edit");*/
			} else if (command.equals("delete")) {
				SolutionItemDAO.deleteSolutionItem(id);
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