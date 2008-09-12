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

package com.sample.partnerprofile.model;
import java.util.Date;

/**
 * <a href="CompanyItem.java.html"><b><i>View Source</i></b></a>
 *
 * @author  Florin Paduroiu
 *
 */
public class CompanyItem {

	public CompanyItem() {
		_date_created = null;
		_date_updated = null;
		_date_lastreviewdate = null;
	}

	public int getId() {
		return _id;
	}

	protected void setId(int id) {
		_id = id;
	}

	public String getName() {
		return _name;
	}

	public void setName(String name) {
		_name = name;
	}

	public String getDescription() {
		return _description;
	}

	public void setDescription(String name) {
		_description = name;
	}

	public String getParentCompanyName() {
		return _parentCompany;
	}

	public void setParentCompanyName(String name) {
		_parentCompany = name;
	}

	public int getCompanyEmpNo() {
		return _companyEmpNo;
	}

	public void setCompanyEmpNo(int id) {
		_companyEmpNo = id;
	}

	public int getCompanyNo() {
		return _companyNo;
	}

	public void setCompanyNo(int id) {
		_companyNo = id;
	}

	public String getCompanyFriendlySite() {
		return _friendlySAP_site;
	}

	public void setCompanyFriendlySite(String name) {
		_friendlySAP_site = name;
	}

	public String getCompanySite() {
		return _web_site;
	}

	public void setCompanySite(String name) {
		_web_site = name;
	}
	
	public void setAdressId(int id) {
		_adressId = id;
	}

	public int getAdressId() {
		return _adressId ;
	}
	
	public void setCountryRegistrationId(int id) {
		_countryRegistrationId = id;
	}

	public int getCountryRegistrationId() {
		return _countryRegistrationId ;
	}
	
	public void setYear(int id) {
		_year = id;
	}

	public int getYear() {
		return _year ;
	}

	public void setDateCreated(Date  dateCreated) {
		_date_created = dateCreated;
	}
	
	public Date getDateCreated() {
		return _date_created ;
	}

	public void setDateUpdated(Date  dateUpdated) {
		_date_updated = dateUpdated;
	}
	
	public Date getDateUpdated() {
		return _date_updated ;
	}

	public void setDateLastReview(Date  date) {
		_date_lastreviewdate = date;
	}
	
	public Date getDateLastReview() {
		return _date_lastreviewdate ;
	}

	public void setReviewedBy(String  name) {
		_reviewedBy = name;
	}
	
	public String getReviewedBy() {
		return _reviewedBy ;
	}

	public void setModifiedBy(String  name) {
		_modifiedBy = name;
	}
	
	public String getModifiedBy() {
		return _modifiedBy ;
	}
	
	public long getCompanyUserId(){
		return _userId;
	}

	public void setCompanyUserId(long id){
		_userId = id;
	}

	
	private int _id;
	private String _name;
	private String _description;
	private int _companyNo;
	private String _friendlySAP_site;
	private int _adressId;
	private int _companyEmpNo;
	private String _parentCompany;
	private int _countryRegistrationId;
	private int _year;
	private Date _date_created;
	private Date _date_updated;
	private Date _date_lastreviewdate;
	private String _reviewedBy;
	private String _modifiedBy;
	private String _web_site;
	private long  _userId;
}