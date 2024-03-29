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

package com.sample.registration.model;

/**
 * <a href="UserItem.java.html"><b><i>View Source</i></b></a>
 *
 * @author  Brian Wing Shun Chan
 *
 */
public class UserItem {

	public UserItem() {
	}

	public int getId() {
		return _id;
	}

	public String getName() {
		return _name;
	}

	public void setName(String name) {
		_name = name;
	}

	protected void setId(int id) {
		_id = id;
	}

	public String getUserLastName() {
		return _userLastName;
	}

	public void setUserLastName(String name) {
		_userLastName = name;
	}

	public String getUserCompanyName() {
		return _userCompany;
	}

	public void setUserCompanyName(String name) {
		_userCompany = name;
	}
	
	public String getUserPosition() {
		return _userPosition;
	}

	public void setUserPosition(String name) {
		_userPosition = name;
	}

	public String getUserMobilePhone() {
		return _userMobilePhone;
	}

	public void setUserMobilePhone(String name) {
		_userMobilePhone = name;
	}
	
	public String getUserWorkPhone() {
		return _userWorkPhone;
	}

	public void setUserWorkPhone(String name) {
		_userWorkPhone = name;
	}
	
	private int _id;
	private String _name;
	private String _userLastName;
	private String _userCompany;
	private String _userPosition;
	private String _userMobilePhone;
	private String _userWorkPhone;

}