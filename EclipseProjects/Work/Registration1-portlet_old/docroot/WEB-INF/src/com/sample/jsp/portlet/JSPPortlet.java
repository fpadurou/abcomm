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
		}
		catch (Exception e) {
		}

		String name = req.getParameter("first_name");
		String userLastName = req.getParameter("last_name");
		String userCompanyName = req.getParameter("userCompanyName");
		String userPositionCompany = req.getParameter("userPositionCompany");
		String userMobilePhone = req.getParameter("telephone_user");
		String userWorkPhone = req.getParameter("telefax_user");

		int points = 0;


		try {
			if (command.equals("add")) {
				UserItem userItem = new UserItem();

				userItem.setName(name);
				userItem.setUserLastName(userLastName);
				userItem.setUserCompanyName(userCompanyName);
				userItem.setUserPosition(userPositionCompany); 
				userItem.setUserMobilePhone(userMobilePhone);
				userItem.setUserWorkPhone(userWorkPhone);

				UserItemDAO.addUserItem(userItem);
			}
			else if (command.equals("edit")) {
				UserItem userItem = UserItemDAO.getUserItem(id);

				userItem.setName(name);
				userItem.setUserLastName(userLastName);
				userItem.setUserCompanyName(userCompanyName);
				userItem.setUserPosition(userPositionCompany); 
				userItem.setUserMobilePhone(userMobilePhone);
				userItem.setUserWorkPhone(userWorkPhone);
				UserItemDAO.updateUserItem(userItem);
			}
			else if (command.equals("delete")) {
				UserItemDAO.deleteUserItem(id);
			}
		}
		catch (SQLException sqle) {
			throw new PortletException(sqle);
		}		
		
	}
	
	public void doView(RenderRequest req, RenderResponse res)
	throws IOException, PortletException {

	PortletRequestDispatcher prd =
		getPortletContext().getRequestDispatcher("/view.jsp");

	if (prd == null) {
		_log.error("/view.jsp is not a valid include");
	}

	prd.include(req, res);
}

public void destroy() {
	_log.info("Destroying portlet");

	try {
		ConnectionPool.destroy();
	}
	catch (Exception e) {
		_log.error(e);
	}
}

	private static Log _log = LogFactory.getLog(JSPPortlet.class);

}