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

import com.sample.registration.util.ConnectionPool;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import java.util.ArrayList;
import java.util.List;
import java.util.Date;

/**
 * <a href="CompanyUtil.java.html"><b><i>View Source</i></b></a>
 *
 * @author  Florin Paduroiu
 *
 */
public class CompanyUtil {

	public static List getCompanyIndustries(int id) throws SQLException {
		List list = new ArrayList();
		if(id<=0)
			return null;
		Connection con = null;
		PreparedStatement ps = null;
		ResultSet rs = null;

		try {
			con = ConnectionPool.getConnection();

			ps = con.prepareStatement(_GET_COMPANY_INDUSTRIES);
			ps.setInt(1, id);
			rs = ps.executeQuery();

			while (rs.next()) {
				list.add(rs.getString(1));
			}
		}
		finally {
			ConnectionPool.cleanUp(con, ps, rs);
		}

		return list;
	}
	
	public static String getCompanySAPSolution(CompanyItem companyItem) throws SQLException {
		List list = new ArrayList();
		String companySapSolutions = "";
		int companyId = 0;
		if(companyItem != null)
			companyId = companyItem.getId();
			
		Connection con = null;
		PreparedStatement ps = null;
		ResultSet rs = null;
		
		try {
			con = ConnectionPool.getConnection();

			ps = con.prepareStatement(_GET_COMPANY_SAP_SOLUTIONS);
			ps.setInt(1, companyId);
			rs = ps.executeQuery();

			while (rs.next()) {
				companySapSolutions = companySapSolutions + rs.getString(1) + ", ";
			}
		}
		finally {
			ConnectionPool.cleanUp(con, ps, rs);
		}

		return companySapSolutions;
	}	

	public static List getCompanySAPSolutionList(CompanyItem companyItem) throws SQLException {
		List list = new ArrayList();
		String companySapSolutions = "";
		int companyId = 0;
		if(companyItem != null)
			companyId = companyItem.getId();
			
		Connection con = null;
		PreparedStatement ps = null;
		ResultSet rs = null;
		
		try {
			con = ConnectionPool.getConnection();

			ps = con.prepareStatement(_GET_COMPANY_SAP_SOLUTIONS);
			ps.setInt(1, companyId);
			rs = ps.executeQuery();

			while (rs.next()) {
				list.add(rs.getString(1));
			}
		}
		finally {
			ConnectionPool.cleanUp(con, ps, rs);
		}

		return list;
	}	
	
	public static String getCompanyCountryName(CompanyItem companyItem) throws SQLException {
		String countryName = "";
		int id = companyItem.getId();
		int idAdress = companyItem.getAdressId();

		if(idAdress > 0)
		{
			AdressItem itemAdress = AdressItemDAO.getAdressItem(idAdress);
			if(itemAdress != null)
			{
				if(itemAdress.getCountryId() > 0)
				{
					CountryItem itemCountry = CountryItemDAO.getCountryItem(itemAdress.getCountryId());
					if(itemCountry != null)
						countryName = itemCountry.getCountryName();
				}
			}
		}
		return countryName ;
	}	

	public static String getCompanyRegionName(CompanyItem companyItem) throws SQLException {
		String regionName = "";
		int id = companyItem.getId();
		int idAdress = companyItem.getAdressId();

		if(idAdress > 0)
		{
			AdressItem itemAdress = AdressItemDAO.getAdressItem(idAdress);
			if(itemAdress != null)
			{
				regionName = itemAdress.getStateregionname();
			}
		}
		return regionName ;
	}	
	
	public static String getCompanyIndustries(CompanyItem companyItem) throws SQLException {
		String industriesName = "";
		int companyId = 0;
		List list = new ArrayList();
		if(companyItem != null)
			companyId = companyItem.getId();
			
		Connection con = null;
		PreparedStatement ps = null;
		ResultSet rs = null;

		try {
			con = ConnectionPool.getConnection();
			ps = con.prepareStatement(_GET_COMPANY_INDUSTRIES);
			ps.setInt(1, companyId);

			rs = ps.executeQuery();

			while (rs.next()) {
				industriesName = industriesName + rs.getString(1) + ", ";
			}
		}
		finally {
			ConnectionPool.cleanUp(con, ps, rs);
		}

		return industriesName;
	}	

	public static String getCompanyBusinessSolution(int id, int type) throws SQLException {
		String companyBusiness = "";
		if(id <=0 )
			return companyBusiness;

		Connection con = null;
		PreparedStatement ps = null;
		ResultSet rs = null;
		
		try {
			con = ConnectionPool.getConnection();

			ps = con.prepareStatement(_GET_COMPANY_BUSINESS_BY_TYPE);
			ps.setInt(1, id);
			ps.setInt(2, type);
			rs = ps.executeQuery();

			if (rs.next()) {
				companyBusiness = rs.getString(1);
			}
		}
		finally {
			ConnectionPool.cleanUp(con, ps, rs);
		}

		return companyBusiness;
	}		

	private static final String _GET_COMPANY_INDUSTRIES =
		"SELECT industry_name FROM tbl_companies_industries t1 join tbl_industry_microvertical t2 WHERE (t1.industryId = t2.industryId) AND  t1.companyId = ?";

	private static final String _GET_COMPANY_SAP_SOLUTIONS =
		"SELECT SAPSolution_name FROM tbl_companies_sapsolution t1 join tbl_sapsolutions t2 WHERE (t1.sapsolutionId = t2.sapsolutionId) AND  t1.companyId = ?";

	private static final String _GET_COMPANY_BUSINESS_BY_TYPE =
		"SELECT business_name FROM tbl_companies_businesstype t1 join tbl_businesstype t2 WHERE (t1.businesstypeId = t2.businesstypeId) AND  t1.companyId = ? AND t1.type_= ?";

	private static final String _GET_COMPANY_COVERAGE =
		"SELECT country_name FROM tbl_countries WHERE t1.companyId = ?";
	
}