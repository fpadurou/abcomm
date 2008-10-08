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

import com.sample.partnerprofile.util.ConnectionPool;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import java.util.ArrayList;
import java.util.List;
import java.util.Date;
import java.sql.*;
/**
 * <a href="CompanyImport.java.html"><b><i>View Source</i></b></a>
 *
 * @author  Florin Paduroiu
 *
 */
public class CompanyImport {
	
	
	public static void ImportBussType()throws SQLException 
	{
		
		List idList = new ArrayList();
		List listvalue1 = new ArrayList();
		List listvalue2 = new ArrayList();
		List idBssName = new ArrayList();
		List idBss = new ArrayList();

		Connection con = null;
		PreparedStatement ps = null;
		ResultSet rs = null;

		try {
			con = ConnectionPool.getConnection();
			String _DELETE_ALL_BSS = "DELETE * FROM tbl_companies_businesstype";
			ps = con.prepareStatement(_DELETE_ALL_BSS);

			ps.executeUpdate();
		}
		finally {
			ConnectionPool.cleanUp(con, ps);
		}
		
		
		try {
			con = ConnectionPool.getConnection();
			String selectBussTypeBulk = "SELECT _1, _35, _36 FROM partnerdirectorytaball";
			ps = con.prepareStatement(selectBussTypeBulk);

			rs = ps.executeQuery();

			while (rs.next()) {
			idList.add(rs.getInt(1));
			listvalue1.add(rs.getString(2));
			listvalue2.add(rs.getString(3));
			}
		}
		finally {
			ConnectionPool.cleanUp(con, ps, rs);
		}
		//get the predifined values
		try {
			con = ConnectionPool.getConnection();
			String selectBussType = "SELECT businesstypeId, business_name FROM tbl_businesstype";
			ps = con.prepareStatement(selectBussType);

			rs = ps.executeQuery();

			while (rs.next()) {
				idBss.add(rs.getInt(1));
				idBssName.add(rs.getString(2));
			}
		}
		finally {
			ConnectionPool.cleanUp(con, ps, rs);
		}
		
		for (int i = 0; i < idList.size(); i++) {
			String value1 = (String)listvalue1.get(i);
			int ndx = idBssName.indexOf(value1);
			if(ndx != -1)
			{
				int realndx = (Integer)idBss.get(ndx);
				
				//	add it to data base
				//get the predifined values
				try {
					con = ConnectionPool.getConnection();

					ps = con.prepareStatement(_ADD_COMPANYTOBUSINESSTYPE_ITEM);

					ps.setInt(1, (Integer)idList.get(i));
					ps.setInt(2, realndx);
					ps.setInt(3, 1);
					ps.executeUpdate();
				}
				finally {
					ConnectionPool.cleanUp(con, ps);
				}			
				
			}
			String value2 = (String)listvalue2.get(i);
			ndx = idBssName.indexOf(value2);
			if(ndx != -1)
			{
				int realndx = (Integer)idBss.get(ndx);
				
				//	add it to data base
				//get the predifined values
				try {
					con = ConnectionPool.getConnection();

					ps = con.prepareStatement(_ADD_COMPANYTOBUSINESSTYPE_ITEM);

					ps.setInt(1, (Integer)idList.get(i));
					ps.setInt(2, realndx);
					ps.setInt(3, 2);
					ps.executeUpdate();
				}
				finally {
					ConnectionPool.cleanUp(con, ps);
				}			
				
			}
		}


		//return list;		
	}

	public static void addCompanyItem(CompanyItem companyItem) throws SQLException {
		Connection con = null;
		PreparedStatement ps = null;

		try {
			con = ConnectionPool.getConnection();

			ps = con.prepareStatement(_ADD_COMPANY_ITEM, Statement.RETURN_GENERATED_KEYS);

			ps.setString(1, companyItem.getName());
			ps.setString(2, companyItem.getDescription());
			ps.setString(3, companyItem.getParentCompanyName());
			if(companyItem.getCompanyEmpNo() > 0)
				ps.setInt(4, companyItem.getCompanyEmpNo());
			else
				ps.setInt(4, -1);
			if(companyItem.getCompanyNo() >0)
				ps.setInt(5, companyItem.getCompanyNo());
			else				
				ps.setInt(5, -1);
			ps.setString(6, companyItem.getCompanyFriendlySite());
			if(companyItem.getAdressId() >0)
				ps.setInt(7, companyItem.getAdressId());
			else 
				ps.setInt(7, -1);
			if(companyItem.getCountryRegistrationId() >0)
				ps.setInt(8, companyItem.getCountryRegistrationId());
			else
				ps.setInt(8, -1);
			if(companyItem.getYear() > 0)
				ps.setInt(9, companyItem.getYear());
			else 
				ps.setInt(9, -1);

			java.util.Date date = new java.util.Date();
			java.sql.Date sqlDate = null ;
			if(companyItem.getDateCreated() != null)
			{
				sqlDate =
					   new java.sql.Date(companyItem.getDateCreated().getTime());
			}
			else 
			{
				sqlDate =
					   new java.sql.Date(date.getTime());
			}
			ps.setDate(10, sqlDate);

			if(companyItem.getDateUpdated() != null)
			{
				sqlDate = new java.sql.Date(companyItem.getDateUpdated().getTime());
			}
			else 
				sqlDate =
					   new java.sql.Date(date.getTime());

			ps.setDate(11, sqlDate);
			if(companyItem.getDateLastReview() != null)
				sqlDate = new java.sql.Date(companyItem.getDateLastReview().getTime());
			else
				sqlDate = new java.sql.Date(date.getTime());
			
			ps.setDate(12, sqlDate);
			ps.setString(13, companyItem.getReviewedBy());
			ps.setString(14, companyItem.getModifiedBy());
			ps.setString(15, companyItem.getCompanySite());
			ps.setLong(16, companyItem.getCompanyUserId());
			ps.executeUpdate();
			
			// get the primary key;
			int autoIncKeyFromApi = -1;
			ResultSet rs = null;
			rs = ps.getGeneratedKeys();
		
			if (rs.next()) {
			autoIncKeyFromApi = rs.getInt(1);
			} else {
			// throw an exception from here
				}
			if(autoIncKeyFromApi > 0)
				companyItem.setId(autoIncKeyFromApi);
			rs.close();
			rs = null;			
		}
		finally {
			ConnectionPool.cleanUp(con, ps);
		}
	}

	public static void deleteCompanyItem(int id) throws SQLException {
		Connection con = null;
		PreparedStatement ps = null;

		try {
			con = ConnectionPool.getConnection();

			ps = con.prepareStatement(_DELETE_COMPANY_ITEM);

			ps.setInt(1, id);

			ps.executeUpdate();
		}
		finally {
			ConnectionPool.cleanUp(con, ps);
		}
	}

	public static CompanyItem getCompanyItem(int id) throws SQLException {
		CompanyItem companyItem = null;

		Connection con = null;
		PreparedStatement ps = null;
		ResultSet rs = null;

		try {
			con = ConnectionPool.getConnection();

			ps = con.prepareStatement(_GET_COMPANY_ITEM);

			ps.setInt(1, id);

			rs = ps.executeQuery();

			if (rs.next()) {
				companyItem = new CompanyItem();

				companyItem.setId(id);
				companyItem.setName(rs.getString(2));
				companyItem.setDescription(rs.getString(3));
				companyItem.setParentCompanyName(rs.getString(4));
				companyItem.setCompanyNo(rs.getInt(5));
				companyItem.setCompanyFriendlySite(rs.getString(6));
				companyItem.setAdressId(rs.getInt(7));
				companyItem.setCompanyEmpNo(rs.getInt(8));
				companyItem.setCountryRegistrationId(rs.getInt(9));
				companyItem.setYear(rs.getInt(10));
				companyItem.setDateLastReview(rs.getDate(11));
				companyItem.setReviewedBy(rs.getString(12));
				companyItem.setDateCreated(rs.getDate(13));
				companyItem.setDateUpdated(rs.getDate(14));
				companyItem.setModifiedBy(rs.getString(15));				
				companyItem.setCompanySite(rs.getString(16));				
			}
		}
		finally {
			ConnectionPool.cleanUp(con, ps, rs);
		}

		return companyItem;
	}

	public static List getCompanyItems() throws SQLException {
		List list = new ArrayList();

		Connection con = null;
		PreparedStatement ps = null;
		ResultSet rs = null;

		try {
			con = ConnectionPool.getConnection();

			ps = con.prepareStatement(_GET_COMPANY_ITEMS);

			rs = ps.executeQuery();

			while (rs.next()) {
				CompanyItem companyItem = new CompanyItem();

				companyItem.setId(rs.getInt(1));
				companyItem.setName(rs.getString(2));
				companyItem.setDescription(rs.getString(3));
				companyItem.setParentCompanyName(rs.getString(4));
				companyItem.setCompanyNo(rs.getInt(5));
				companyItem.setCompanyFriendlySite(rs.getString(5));
				companyItem.setAdressId(rs.getInt(7));
				companyItem.setCompanyEmpNo(rs.getInt(8));
				companyItem.setCountryRegistrationId(rs.getInt(9));
				companyItem.setYear(rs.getInt(10));
				companyItem.setDateLastReview(rs.getDate(11));
				companyItem.setReviewedBy(rs.getString(12));
				companyItem.setDateCreated(rs.getDate(13));
				companyItem.setDateUpdated(rs.getDate(14));
				companyItem.setModifiedBy(rs.getString(15));				
				companyItem.setCompanySite(rs.getString(16));				
				
				list.add(companyItem);
			}
		}
		finally {
			ConnectionPool.cleanUp(con, ps, rs);
		}

		return list;
	}

	public static List getCompanyItemsByUserId(long userId) throws SQLException {
		List list = new ArrayList();

		Connection con = null;
		PreparedStatement ps = null;
		ResultSet rs = null;

		try {
			con = ConnectionPool.getConnection();

			ps = con.prepareStatement(_GET_COMPANY_ITEMS_BY_USER_ID);
			ps.setLong(1, userId);

			rs = ps.executeQuery();

			while (rs.next()) {
				CompanyItem companyItem = new CompanyItem();

				companyItem.setId(rs.getInt(1));
				companyItem.setName(rs.getString(2));
				companyItem.setDescription(rs.getString(3));
				companyItem.setParentCompanyName(rs.getString(4));
				companyItem.setCompanyNo(rs.getInt(5));
				companyItem.setCompanyFriendlySite(rs.getString(5));
				companyItem.setAdressId(rs.getInt(7));
				companyItem.setCompanyEmpNo(rs.getInt(8));
				companyItem.setCountryRegistrationId(rs.getInt(9));
				companyItem.setYear(rs.getInt(10));
				companyItem.setDateLastReview(rs.getDate(11));
				companyItem.setReviewedBy(rs.getString(12));
				companyItem.setDateCreated(rs.getDate(13));
				companyItem.setDateUpdated(rs.getDate(14));
				companyItem.setModifiedBy(rs.getString(15));				
				companyItem.setCompanySite(rs.getString(16));				
				
				list.add(companyItem);
			}
		}
		finally {
			ConnectionPool.cleanUp(con, ps, rs);
		}

		return list;
	}	
	
	public static void updateCompanyItem(CompanyItem companyItem) throws SQLException {
		Connection con = null;
		PreparedStatement ps = null;

		try {
			con = ConnectionPool.getConnection();

			ps = con.prepareStatement(_UPDATE_COMPANY_ITEM);

			ps.setString(1, companyItem.getName());
			ps.setString(2, companyItem.getDescription());
			ps.setString(3, companyItem.getParentCompanyName());
			ps.setInt(4, companyItem.getCompanyEmpNo());
			ps.setInt(5, companyItem.getCompanyNo());
			ps.setString(6, companyItem.getCompanyFriendlySite());
			ps.setInt(7, companyItem.getAdressId());
			ps.setInt(8, companyItem.getCountryRegistrationId());
			ps.setInt(9, companyItem.getYear());
			java.util.Date date = new java.util.Date();
			if(companyItem.getDateCreated() != null)
				ps.setDate(10, new java.sql.Date(companyItem.getDateCreated().getTime()));
			else
				ps.setDate(10, new java.sql.Date(date.getTime()));

			if(companyItem.getDateUpdated() != null)
				ps.setDate(11, new java.sql.Date(companyItem.getDateUpdated().getTime()));
			else
				ps.setDate(11, new java.sql.Date(date.getTime()));
					
			if(companyItem.getDateLastReview() != null)
				ps.setDate(12, new java.sql.Date(companyItem.getDateLastReview().getTime()));
			else
				ps.setDate(12, new java.sql.Date(date.getTime()));

			ps.setString(13, companyItem.getReviewedBy());
			ps.setString(14, companyItem.getModifiedBy());
			ps.setString(15, companyItem.getCompanySite());				
			ps.setInt(16, companyItem.getId());

			ps.executeUpdate();
		}
		finally {
			ConnectionPool.cleanUp(con, ps);
		}
	}

	private static final String _ADD_COMPANYTOBUSINESSTYPE_ITEM =
		"INSERT INTO tbl_companies_businesstype (companyId, businesstypeId, type_) VALUES (?, ?, ?)";
	
	private static final String _ADD_COMPANY_ITEM =
	"INSERT INTO tbl_company (companyName, description, parent_companyname, noEmployees, partnerNumber, friendlySAP_site, adressId, countryRegistrationId ,partner_since, date_created, date_updated, last_review_date, reviewed_By, modified_by, web_site, userId) " +
		"VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ? )";

	private static final String _DELETE_COMPANY_ITEM =
		"DELETE FROM tbl_company WHERE companyId = ?";

	private static final String _GET_COMPANY_ITEM =
		"SELECT companyId, companyName, description, parent_companyname, partnerNumber, friendlySAP_site, adressId, noEmployees, countryRegistrationId ,partner_since, last_review_date, reviewed_By, date_created, date_updated, modified_by, web_site FROM tbl_company WHERE companyId = ?";

	private static final String _GET_COMPANY_ITEMS_BY_USER_ID =
		"SELECT companyId, companyName, description, parent_companyname, partnerNumber, friendlySAP_site, adressId, noEmployees, countryRegistrationId ,partner_since, last_review_date, reviewed_By, date_created, date_updated, modified_by, web_site FROM tbl_company WHERE userId = ?";

	private static final String _GET_COMPANY_ITEMS =
		"SELECT companyId, companyName, description, parent_companyname, partnerNumber, friendlySAP_site, adressId, noEmployees, countryRegistrationId ,partner_since, last_review_date, reviewed_By, date_created, date_updated, modified_by, web_site FROM tbl_company";

	private static final String _UPDATE_COMPANY_ITEM =
		"UPDATE tbl_company SET companyName = ?, description = ?, parent_companyname = ?, noEmployees = ?, partnerNumber = ?, friendlySAP_site = ?, adressId = ?, countryRegistrationId = ?, partner_since = ?, date_created = ?, date_updated = ?, last_review_date = ?, reviewed_By = ?, modified_by = ?, web_site = ? WHERE companyId = ?";
	
}