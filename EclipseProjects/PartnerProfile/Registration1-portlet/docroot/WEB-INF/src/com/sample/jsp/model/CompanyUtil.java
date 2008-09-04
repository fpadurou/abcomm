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

import java.lang.reflect.Array;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.Statement;
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

	public static List getCompanyCountryCoverage(CompanyItem companyItem) throws SQLException {
		List list = new ArrayList();
		int companyId = 0;
		if(companyItem != null)
			companyId = companyItem.getId();
			
		Connection con = null;
		PreparedStatement ps = null;
		ResultSet rs = null;
		
		try {
			con = ConnectionPool.getConnection();

			ps = con.prepareStatement(_GET_COMPANY_COVERAGE);
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

	public static List updateCompanySAPSolutionList(CompanyItem companyItem, String[] selectedArray) throws SQLException {
		
		List sapSolutions = SAPSolutionItemDAO.getSAPSolutionItems();
		List list = new ArrayList();
		String companySapSolutions = "";
		int companyId = 0;
		if(companyItem != null)
			companyId = companyItem.getId();
			
		Connection con = null;
		Statement stmt = null;
		PreparedStatement ps = null;
		ResultSet rs = null;
		
		try {
			// first delete all the company previous sap solutions links
			con = ConnectionPool.getConnection();

			ps = con.prepareStatement(_DELETE_COMPANY_SAP_SOLUTIONS);
			ps.setInt(1, companyId);
			ps.executeUpdate();
			if(selectedArray != null)
			{
			// add new values
			String querry = "INSERT INTO tbl_companies_sapsolution (companyId, sapsolutionId) values ";
				
			boolean bFirst = true;
			for(int i = 0; i<selectedArray.length; i++ )
			{
				String value = (String)selectedArray[i];
				for(int j = 0; j<sapSolutions.size();j++)
				{
					if(value.equalsIgnoreCase(((SAPSolutionItem)sapSolutions.get(j)).getSAPSolutionName()))
					{
						if(!bFirst)
						{
							querry +=", ";
						}
						querry += "(" + companyId + ", "+ ((SAPSolutionItem)sapSolutions.get(j)).getId() +")";
						if(bFirst)
						{
							bFirst = false;
						}
					}
				}
			}
			System.out.println(querry);
			stmt = con.createStatement(java.sql.ResultSet.TYPE_FORWARD_ONLY,
                    java.sql.ResultSet.CONCUR_UPDATABLE);
			stmt.executeUpdate(querry, Statement.NO_GENERATED_KEYS);
			}
		}
		finally {
		    if (stmt != null) {
		        try {
		            stmt.close();
		        } catch (SQLException ex) {
		            // ignore
		        }
		    }
			ConnectionPool.cleanUp(con, ps, rs);
		}

		return list;
	}	

	public static List updateCompanyIndustriesList(CompanyItem companyItem, String[] selectedArray) throws SQLException {
		
		List industryItems = IndustryItemDAO.getIndustryItems();
		List list = new ArrayList();
		int companyId = 0;
		if(companyItem != null)
			companyId = companyItem.getId();
			
		Connection con = null;
		Statement stmt = null;
		PreparedStatement ps = null;
		ResultSet rs = null;
		
		try {
			// first delete all the company previous sap solutions links
			con = ConnectionPool.getConnection();

			ps = con.prepareStatement(_DELETE_COMPANY_INDUSTRIES);
			ps.setInt(1, companyId);
			ps.executeUpdate();
			if(selectedArray != null)
			{
			// add new values
			String querry = "INSERT INTO tbl_companies_industries (companyId, industryId) values ";
				
			boolean bFirst = true;
			for(int i = 0; i<selectedArray.length; i++ )
			{
				String value = (String)selectedArray[i];
				for(int j = 0; j<industryItems.size();j++)
				{
					if(value.equalsIgnoreCase(((IndustryItem)industryItems.get(j)).getIndustryName()))
					{
						if(!bFirst)
						{
							querry +=", ";
						}
						querry += "(" + companyId + ", "+ ((IndustryItem)industryItems.get(j)).getId() +")";
						if(bFirst)
						{
							bFirst = false;
						}
					}
				}
			}
			stmt = con.createStatement(java.sql.ResultSet.TYPE_FORWARD_ONLY,
                    java.sql.ResultSet.CONCUR_UPDATABLE);
			stmt.executeUpdate(querry, Statement.NO_GENERATED_KEYS);
			}
		}
		finally {
		    if (stmt != null) {
		        try {
		            stmt.close();
		        } catch (SQLException ex) {
		            // ignore
		        }
		    }
			ConnectionPool.cleanUp(con, ps, rs);
		}

		return list;
	}	
	
	public static List updateBusinessType(CompanyItem companyItem, String selected, int type ) throws SQLException {
		if(type != 1 && type != 2)
			return null;
		List businessItems = BusinesstypeItemDAO.getBusinessTypeItems();
		List list = new ArrayList();
		int companyId = 0;
		if(companyItem != null)
			companyId = companyItem.getId();
			
		Connection con = null;
		Statement stmt = null;
		PreparedStatement ps = null;
		ResultSet rs = null;
		
		try {
			// first delete all the company previous sap solutions links
			con = ConnectionPool.getConnection();

			ps = con.prepareStatement(_DELETE_COMPANY_BUSINESS_TYPE);
			ps.setInt(1, companyId);
			ps.setInt(2, type);
			ps.executeUpdate();

			// add new values
			String querry = "INSERT INTO tbl_companies_businesstype (companyId, businesstypeId, type_) values ";
				
			for(int j = 0; j<businessItems.size();j++)
			{
				if(selected.equalsIgnoreCase(((BusinesstypeItem)businessItems.get(j)).getBusinessName()))
				{
					querry += "(" + companyId + ", "+ ((BusinesstypeItem)businessItems.get(j)).getId() + ", "+ type + ")";
				}
			}
			System.out.println(querry);
			stmt = con.createStatement(java.sql.ResultSet.TYPE_FORWARD_ONLY,
                    java.sql.ResultSet.CONCUR_UPDATABLE);
			stmt.executeUpdate(querry, Statement.NO_GENERATED_KEYS);
		}
		finally {
		    if (stmt != null) {
		        try {
		            stmt.close();
		        } catch (SQLException ex) {
		            // ignore
		        }
		    }
			ConnectionPool.cleanUp(con, ps, rs);
		}

		return list;
	}	

	public static List updateCompanyCountryCoverage(CompanyItem companyItem, String[] selectedArray) throws SQLException {
		
		List countries = CountryItemDAO.getCountryItems();
		List list = new ArrayList();
		int companyId = 0;
		if(companyItem != null)
			companyId = companyItem.getId();
			
		Connection con = null;
		Statement stmt = null;
		PreparedStatement ps = null;
		ResultSet rs = null;
		
		try {
			// first delete all the company previous coverage links
			con = ConnectionPool.getConnection();

			ps = con.prepareStatement(_DELETE_COMPANY_COVERAGE);
			ps.setInt(1, companyId);
			ps.executeUpdate();
			if(selectedArray != null)
			{
				// add new values
				String querry = "INSERT INTO tbl_companies_coverage (companyId, countryId) values ";
					
				boolean bFirst = true;
				for(int i = 0; i<selectedArray.length; i++ )
				{
					String value = (String)selectedArray[i];
					for(int j = 0; j<countries.size();j++)
					{
						if(value.equalsIgnoreCase(((CountryItem)countries.get(j)).getCountryName()))
						{
							if(!bFirst)
							{
								querry +=", ";
							}
							querry += "(" + companyId + ", "+ ((CountryItem)countries.get(j)).getId() +")";
							if(bFirst)
							{
								bFirst = false;
							}
						}
					}
				}
				System.out.println(querry);
				stmt = con.createStatement(java.sql.ResultSet.TYPE_FORWARD_ONLY,
	                    java.sql.ResultSet.CONCUR_UPDATABLE);
				stmt.executeUpdate(querry, Statement.NO_GENERATED_KEYS);
			}
		}
		finally {
		    if (stmt != null) {
		        try {
		            stmt.close();
		        } catch (SQLException ex) {
		            // ignore
		        }
		    }
			ConnectionPool.cleanUp(con, ps, rs);
		}

		return list;
	}		

	public static List getCompaniesBySearch(int id) throws SQLException {
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

	int computePage()throws SQLException {

		int t = 0;
		List companyItems = CompanyItemDAO.getCompanyItems();
		int count = companyItems.size();
		for (int i = 0; i < companyItems.size(); i++) {
			CompanyItem companyItem = (CompanyItem)companyItems.get(i);	
			if((i%2) == 0)
			{
				t =  i/2;
			}
			String str;
			str = companyItem.getDescription();
		}
		return t;
		
	}
	
	private static final String _GET_COMPANY_INDUSTRIES =
		"SELECT industry_name FROM tbl_companies_industries t1 join tbl_industry_microvertical t2 WHERE (t1.industryId = t2.industryId) AND  t1.companyId = ?";

	private static final String _GET_COMPANY_SAP_SOLUTIONS =
		"SELECT SAPSolution_name FROM tbl_companies_sapsolution t1 join tbl_sapsolutions t2 WHERE (t1.sapsolutionId = t2.sapsolutionId) AND  t1.companyId = ?";

	private static final String _GET_COMPANY_BUSINESS_BY_TYPE =
		"SELECT business_name FROM tbl_companies_businesstype t1 join tbl_businesstype t2 WHERE (t1.businesstypeId = t2.businesstypeId) AND  t1.companyId = ? AND t1.type_= ?";

	private static final String _GET_COMPANY_COVERAGE =
		"SELECT country_name FROM tbl_companies_coverage t1 join tbl_countries t2 WHERE (t1.countryId = t2.countryId) AND  t1.companyId = ?";

	private static final String _DELETE_COMPANY_SAP_SOLUTIONS =	
		"DELETE FROM tbl_companies_sapsolution WHERE companyId = ?";

	private static final String _DELETE_COMPANY_INDUSTRIES =	
		"DELETE FROM tbl_companies_industries WHERE companyId = ?";

	private static final String _DELETE_COMPANY_BUSINESS_TYPE =	
		"DELETE FROM tbl_companies_businesstype WHERE companyId = ? AND type_ = ?";

	private static final String _DELETE_COMPANY_COVERAGE =	
		"DELETE FROM tbl_companies_coverage WHERE companyId = ?";
	
	
}