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

package com.sample.solutionprofile.model;
import java.util.Date;

/**
 * <a href="CompanyItem.java.html"><b><i>View Source</i></b></a>
 *
 * @author  Florin Paduroiu
 *
 */
public class SolutionItem {

	public SolutionItem() {
		lastPartRevieDate = null;	
		dateCreated	= null;
		dateUpdated = null;	
	}

	public long getId() {
		return _id;
	}

	protected void setId(long id) {
		_id = id;
	}

	public long _id;	
	public int companyId;
	public long partNumber;	
	public String solName;	
	public String solDesc;	
	public String partComSite	;
	public int solFocus	;
	public int solStatusPartner;
	public int solStatusSAP;
	public Date sapCertSince	;
	public Date lastReviewBySAP;	
	public int averTrainEndUser;
	public int averImplTrainingDays;	
	public int averImplEffort;	
	public int averImplDuration;	
	public int averSizeImplTeam;	
	public int averSaleCycle;	
	public int noCustomers;	
	public int smallImpl;
	public int largeImpl;	
	public int smallImplTime;	
	public int largeImplTime;	
	public int smallImplTeamNo;	
	public int largeImplTeamNo;	
	public String solSite;
	
	public int countryPriceEuro;
	
	public String refCustAvailForUse;	
	public int totalAppBaseLinePrice;	
	public int appPriceEur	;
	public int hardwareCost	;
	public int hardwareCostEur;	
	public int averLicensePrice;	
	public int averLicensePriceEur;	
	public int addServiceCost	;
	public int addServicePriceEur;	
	public int implCost	;
	public int implCostEur;	
	public String  sapDiscount	;
	public String dbUsed;	
	public String SAPBusUsed;	
	public String SAPGUIUsed;	
	public String compA1B1Used;	
	public String thirdPartyUsed;	
	public String thirdPartyName ;	
	public String otherIT;	
	public String addRemarks;	
	public String solSAPMicroSite;	
	
	public Date lastPartRevieDate;	
	public String reviewedBy	;
	public String profileAdded	;
	public Date dateCreated	;
	public String modifiedBy;	
	public Date dateUpdated;	
	public String notificationProc;
	public String notificationText;
}