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
import com.sample.solutionprofile.model.SolutionUtil;
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
import java.util.List;
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
		long userId = 0;
		userId = PortalUtil.getUserId(req);
		List companyIds = null;
		int companyId = 0;
		try {
			companyIds = SolutionItemDAO.getCompanyIdsByUserId(userId) ;
			companyId = (Integer)companyIds.get(0); 
		} catch (Exception e) {
			System.out.println("SolutionItemDAO.getCompanyIdsByUserId throws exception for userId = " + String.valueOf(userId));
		}
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

		String sapCertSince	= req.getParameter("sapCertSince");
		String lastReviewBySAP = req.getParameter("lastReviewBySAP");
		int averTrainEndUser = 0;
		if(req.getParameter("averTrainEndUser") != null && !req.getParameter("averTrainEndUser").isEmpty())
			averTrainEndUser = Integer.parseInt(req.getParameter("averTrainEndUser"));
		int averImplTrainingDays  = 0;
		if(req.getParameter("averImplTrainingDays") != null && !req.getParameter("averImplTrainingDays").isEmpty())
			averImplTrainingDays = Integer.parseInt(req.getParameter("averImplTrainingDays"));

		int averImplEffort = 0;
		if(req.getParameter("averImplEffort") != null && !req.getParameter("averImplEffort").isEmpty())
			averImplEffort = Integer.parseInt(req.getParameter("averImplEffort"));
		int averImplDuration = 0;
		if(req.getParameter("averImplDuration") != null && !req.getParameter("averImplDuration").isEmpty())
			averImplDuration = Integer.parseInt(req.getParameter("averImplDuration"));
		
		int averSizeImplTeam = 0;
		if(req.getParameter("averSizeImplTeam") != null && !req.getParameter("averSizeImplTeam").isEmpty())
			averSizeImplTeam = Integer.parseInt(req.getParameter("averSizeImplTeam"));

		int averSaleCycle = 0;
		if(req.getParameter("averSaleCycle") != null && !req.getParameter("averSaleCycle").isEmpty())
			averSaleCycle = Integer.parseInt(req.getParameter("averSaleCycle"));
		
		int noCustomers = 0;
		if(req.getParameter("noCustomers") != null && !req.getParameter("noCustomers").isEmpty())
			noCustomers = Integer.parseInt(req.getParameter("noCustomers"));
		
		int smallImpl = 0;
		if(req.getParameter("smallImpl") != null && !req.getParameter("smallImpl").isEmpty())
			smallImpl = Integer.parseInt(req.getParameter("smallImpl"));

		int largeImpl = 0;
		if(req.getParameter("largeImpl") != null && !req.getParameter("largeImpl").isEmpty())
			largeImpl = Integer.parseInt(req.getParameter("largeImpl"));
		
		int smallImplTime = 0;
		if(req.getParameter("smallImplTime") != null && !req.getParameter("smallImplTime").isEmpty())	
			smallImplTime = Integer.parseInt(req.getParameter("smallImplTime"));
		
		int largeImplTime = 0;
		if(req.getParameter("largeImplTime") != null && !req.getParameter("largeImplTime").isEmpty())
			largeImplTime = Integer.parseInt(req.getParameter("largeImplTime"));
		
		int smallImplTeamNo = 0;
		if(req.getParameter("smallImplTeamNo") != null && !req.getParameter("smallImplTeamNo").isEmpty())
			smallImplTeamNo = Integer.parseInt(req.getParameter("smallImplTeamNo"));
		int largeImplTeamNo = 0;
		if(req.getParameter("largeImplTeamNo") != null &&  !req.getParameter("largeImplTeamNo").isEmpty())
			largeImplTeamNo = Integer.parseInt(req.getParameter("largeImplTeamNo"));
		
		String solSite = req.getParameter("solSite");
		
		//int countryPriceEuro = Integer.parseInt(req.getParameter("countryPriceEuro"));
		
		String refCustAvailForUse = req.getParameter("refCustAvailForUse");
		if(refCustAvailForUse == null) //?WHY
			refCustAvailForUse ="No";
			
		int totalAppBaseLinePrice = 0;
		if(req.getParameter("totalAppBaseLinePrice") != null && !req.getParameter("totalAppBaseLinePrice").isEmpty())
			totalAppBaseLinePrice = Integer.parseInt(req.getParameter("totalAppBaseLinePrice"));
		
		int appPriceEur	 = 0;//Integer.parseInt(req.getParameter("appPriceEur"));
		int hardwareCost = 0;
		if(req.getParameter("hardwareCost") != null && !req.getParameter("hardwareCost").isEmpty())
			hardwareCost = Integer.parseInt(req.getParameter("hardwareCost"));
		
		int hardwareCostEur = 0;//Integer.parseInt(req.getParameter("hardwareCostEur"));
		int averLicensePrice = 0;
		if(req.getParameter("averLicensePrice") != null && !req.getParameter("averLicensePrice").isEmpty())
			averLicensePrice = Integer.parseInt(req.getParameter("averLicensePrice"));
		
		int averLicensePriceEur = 0;//Integer.parseInt(req.getParameter("averLicensePriceEur"));
		int addServiceCost = 0; 
		if(req.getParameter("addServiceCost") != null && !req.getParameter("addServiceCost").isEmpty())
			addServiceCost = Integer.parseInt(req.getParameter("addServiceCost"));
		
		int addServicePriceEur = 0;//Integer.parseInt(req.getParameter("addServicePriceEur"));
		int implCost = 0;
		if(req.getParameter("implCost") != null && !req.getParameter("implCost").isEmpty())
			implCost = Integer.parseInt(req.getParameter("implCost"));
		
		int implCostEur = 0;//Integer.parseInt(req.getParameter("implCostEur"));	

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
		String sol_solFocusStr = req.getParameter("solFocus");
		String[] sol_geographic_coverage = req.getParameterValues("geographic_coverage");
		String[] sol_industry = req.getParameterValues("industry");
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
				solutionItem.companyId = companyId; // get the first 
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
						System.out.println("date since = " + value);
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
				SolutionUtil.updateSolutionSolFocus(solutionItem, sol_solFocusStr);
				SolutionUtil.updateSolutionCountryPriceEuro(solutionItem, sol_countryPriceEuro);
				SolutionUtil.updateSolutionGeographicCoverage(solutionItem, sol_geographic_coverage);
				SolutionUtil.updateSolutionIndustry(solutionItem, sol_industry);
				SolutionUtil.updateMySAPAllInOneVers(solutionItem, sol_mySAPAllInOneVers);
				SolutionUtil.updateMySAPOneProductVers(solutionItem, sol_mySAPOneProductVers);
				SolutionUtil.updateMaturity(solutionItem, sol_maturity);
				SolutionUtil.updateSolStatusByProvider(solutionItem, sol_statusByProvider);
				SolutionUtil.updateSolStatusBySAP(solutionItem, sol_statusBySAP);
				SolutionUtil.updateSolTargetCompSize(solutionItem, sol_targetCompSize);
				SolutionUtil.updateSolCategTarget(solutionItem, sol_categTarget);
				SolutionUtil.updateSolUserType(solutionItem, sol_userType);
				SolutionUtil.updateSolProgLang(solutionItem, sol_progLang);
				SolutionUtil.updateSolOS(solutionItem, sol_os);
				SolutionUtil.updateSolAioBased(solutionItem, sol_aioBased);
				//perform extra update
				SolutionItemDAO.updateSolutionItem(solutionItem);
				
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
						System.out.println("date since = " + value);
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
				SolutionUtil.updateSolutionSolFocus(solutionItem, sol_solFocusStr);
				SolutionUtil.updateSolutionCountryPriceEuro(solutionItem, sol_countryPriceEuro);
				SolutionUtil.updateSolutionGeographicCoverage(solutionItem, sol_geographic_coverage);
				SolutionUtil.updateSolutionIndustry(solutionItem, sol_industry);
				SolutionUtil.updateMySAPAllInOneVers(solutionItem, sol_mySAPAllInOneVers);
				SolutionUtil.updateMySAPOneProductVers(solutionItem, sol_mySAPOneProductVers);
				SolutionUtil.updateMaturity(solutionItem, sol_maturity);
				SolutionUtil.updateSolStatusByProvider(solutionItem, sol_statusByProvider);
				SolutionUtil.updateSolStatusBySAP(solutionItem, sol_statusBySAP);
				SolutionUtil.updateSolTargetCompSize(solutionItem, sol_targetCompSize);
				SolutionUtil.updateSolCategTarget(solutionItem, sol_categTarget);
				SolutionUtil.updateSolUserType(solutionItem, sol_userType);
				SolutionUtil.updateSolProgLang(solutionItem, sol_progLang);
				SolutionUtil.updateSolOS(solutionItem, sol_os);
				SolutionUtil.updateSolAioBased(solutionItem, sol_aioBased);

				SolutionItemDAO.updateSolutionItem(solutionItem);

			} else if (command.equals("delete")) {
				System.out.println("a facut delete ");
	            System.out.println("a facut delete cu " + String.valueOf(id));
				
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