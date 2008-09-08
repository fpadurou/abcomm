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

/**
 * <a href="AdressItem.java.html"><b><i>View Source</i></b></a>
 *
 * @author Florin Paduroiu
 *
 */
public class AdressItem {
	
	public AdressItem() {
	}

	public int getId() {
		return _addressId;
	}

	protected void setId(int id) {
		_addressId = id;
	}
	
	public int getCompanyId() {
		return _companyId;
	}

	public void setCompanyId(int id) {
		_companyId = id;
	}

	public int getUserId() {
		return _userId;
	}

	public void setUserId(int id) {
		_userId = id;
	}
	
	public String getStreet1() {
		return _street1;
	}

	public void setStreet1(String id) {
		_street1 = id;
	}

	public String getStreet2() {
		return _street2;
	}

	public void setStreet2(String id) {
		_street2 = id;
	}

	public String getCity() {
		return _city;
	}

	public void setCity(String id) {
		_city = id;
	}
	
	public String getZip() {
		return _zip;
	}

	public void setZip(String id) {
		_zip = id;
	}	
	
	public String getStateregionname() {
		return _stateregionname;
	}

	public void setStateregionname(String id) {
		_stateregionname = id;
	}	
	
	public int getCountryId() {
		return _countryId;
	}

	public void setCountryId(int id) {
		_countryId = id;
	}	

	public int getPhoneId() {
		return _phoneId;
	}

	public void setPhoneId(int id) {
		_phoneId = id;
	}	

	public int getFaxId() {
		return _faxId;
	}

	public void setFaxId(int id) {
		_faxId = id;
	}	
	
	public String getMail() {
		return _mail;
	}

	public void setMail(String id) {
		_mail = id;
	}	
	
	private int _addressId;
	private int _companyId;
	private int _userId;
	private String  _street1;
	private String  _street2;
	private String  _city;
	private String _zip;
	private String _stateregionname;
	private int _countryId;
	private int _phoneId;
	private int _faxId;
	private String _mail;
}