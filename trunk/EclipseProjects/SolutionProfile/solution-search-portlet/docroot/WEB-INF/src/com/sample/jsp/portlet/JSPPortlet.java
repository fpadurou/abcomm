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

package com.sample.searchsolution.portlet;

import java.io.IOException;
import java.sql.SQLException;
import java.text.DateFormat;
import java.text.ParseException;
import java.util.Date;

import javax.portlet.ActionRequest;
import javax.portlet.ActionResponse;
import javax.portlet.GenericPortlet;
import javax.portlet.PortletException;
import javax.portlet.PortletRequestDispatcher;
import javax.portlet.RenderRequest;
import javax.portlet.RenderResponse;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;

import com.sample.searchsolution.model.UserItem;
import com.sample.searchsolution.model.UserItemDAO;
import com.sample.searchsolution.model.CompanyItem;
import com.sample.searchsolution.model.CompanyItemDAO;
import com.sample.searchsolution.model.CompanyUtil;
import com.sample.searchsolution.model.CountryItem;
import com.sample.searchsolution.model.CountryItemDAO;
import com.sample.searchsolution.model.AdressItem;
import com.sample.searchsolution.model.AdressItemDAO;
import com.sample.searchsolution.util.ConnectionPool;

/**
 * <a href="JSPPortlet.java.html"><b><i>View Source</i></b></a>
 *
 * @author Brian Wing Shun Chan
 *
 */
public class JSPPortlet extends GenericPortlet {

	public void init() throws PortletException {
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
	
	//search related
	    String[] SAPitems_search = req.getParameterValues("sap_solution_focus_search");
		String industrySearch = req.getParameter("industry_search");
		String[] countryCoverage_search = req.getParameterValues("country_coverage_search");
		String country_search = req.getParameter("country_search");
		String primary_business_type_search = req.getParameter("primary_business_type_search");
	}

	public void doView(RenderRequest req, RenderResponse res)
			throws IOException, PortletException {

		String command = req.getParameter("command");
		String value = "/view.jsp";
		if(command != null)
		{
			System.out.println("command param in doview  =" + command);
		}
		else
		{
			String industry_search = req.getParameter("industry_search");
			String sapsol_search = req.getParameter("sap_solution_focus_search");
			String country_search = req.getParameter("country_search");
			String countrycov_search = req.getParameter("country_coverage_search");
			String bustype_search = req.getParameter("primary_business_type_search");
			command = "search";			
			System.out.println("search param hidden in doview  =" + industry_search);
			value += "?ind=" + industry_search + "&sap=" + sapsol_search + "&cty=" + country_search + "&ctv=" + countrycov_search + "&bss=" + bustype_search + "&cmd=" + command;
		}
		
		//PortletRequestDispatcher prd = getPortletContext()
			//.getRequestDispatcher("/view.jsp");
		PortletRequestDispatcher prd = getPortletContext()
				.getRequestDispatcher(value);


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