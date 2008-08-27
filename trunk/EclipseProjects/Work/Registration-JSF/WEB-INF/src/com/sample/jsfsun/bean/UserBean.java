/**
 * Copyright (c) 2000-2008 Liferay, Inc. All rights reserved.
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

package com.sample.jsfsun.bean;
import java.lang.*;

import java.util.ArrayList;
import java.util.List;

import javax.faces.application.FacesMessage;
import javax.faces.context.FacesContext;
import javax.faces.event.ActionEvent;
import com.ext.portlet.Registration.service.persistence.RegistrationUtil;

/**
 * <a href="UserBean.java.html"><b><i>View Source</i></b></a>
 *
 * @author Brian Myunghun Kim
 *
 */
public class UserBean {

	UserBean()
	{
		_userFirstName = "Gabi";
	}
	
	
	
	public int getUserId() {
		return _userId;
	}

	public void setUserId(int userId) {
		_userId = userId;
	}

	private int _userId;
	
	public String getUserFirstName() {
		return _userFirstName;
	}

	public void setUserFirstName(String name) {
		_userFirstName = name;
	}

	private String _userFirstName;

	
	public String getUserLastName() {
		return _userLastName;
	}

	public void setUserLastName(String name) {
		_userLastName = name;
	}

	private String _userLastName;

	
	public String getUserCompanyName() {
		return _userCompanyName;
	}

	public void setUserCompanyName(String name) {
		_userCompanyName = name;
	}

	private String _userCompanyName;

	
	public String getUserPositionCompany() {
		return _userPositionCompany;
	}

	public void setUserPositionCompany(String name) {
		_userPositionCompany = name;
	}

	private String _userPositionCompany;

	
	public String getUserMobilePhone() {
		return _userMobilePhone;
	}

	public void setUserMobilePhone(String name) {
		_userMobilePhone = name;
	}

	private String _userMobilePhone;

	
	public String getUserWorkPhome() {
		return _userWorkPhone;
	}

	public void setUserWorkPhone(String name) {
		_userWorkPhone = name;
	}
	
	public void Gigi(){
	       System.out.println("--> Size of Training table in training database: ");
	}
	
	/*public void addBook(ActionEvent actionEvent) {
		FacesContext facesContext = FacesContext.getCurrentInstance();
		
		FacesMessage message = new FacesMessage(getUserFirstName() + " was added successfully.");
		
		// null signifies that this message is not intended for any ui component
		facesContext.addMessage(null, message);

		// clear the title
	}*/
	public void addRegistration(ActionEvent actionEvent) {
		// clear the title
		FacesContext facesContext = FacesContext.getCurrentInstance();
		
		try {
			RegistrationUtil.addRegistration(getFirstName(), getLastName());
		} 
		catch (Exception e) {
			FacesMessage message = new FacesMessage(FacesMessage.SEVERITY_ERROR, "Error adding user.", e.toString());	
			facesContext.addMessage(null, message);
			
			e.printStackTrace();
			
			return;
		}
                
		FacesMessage message = new FacesMessage(getFirstName() + " was added successfully.");
		
		// null signifies that this message is not intended for any ui component
		facesContext.addMessage(null, message);
		
		// clear the title
		setTitle("");
	}

	public String displayUsers() {
		return "success";
	}


	private String _userWorkPhone;
	
	public String Submit() {
		
       System.out.println("--> Size of Training table in training database: ");
       
       return "failure";
    }

}