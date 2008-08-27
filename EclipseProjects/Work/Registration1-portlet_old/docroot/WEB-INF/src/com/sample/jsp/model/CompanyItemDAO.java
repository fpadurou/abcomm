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
 * <a href="CompanyItemDAO.java.html"><b><i>View Source</i></b></a>
 *
 * @author  Florin Paduroiu
 *
 */
public class CompanyItemDAO {

	public static void addCompanyItem(CompanyItem companyItem) throws SQLException {
		Connection con = null;
		PreparedStatement ps = null;

		try {
			con = ConnectionPool.getConnection();

			ps = con.prepareStatement(_ADD_COMPANY_ITEM);

			ps.setString(1, companyItem.getName());
			ps.setString(2, companyItem.getDescription());
			ps.setString(3, companyItem.getParentCompanyName());
			ps.setInt(4, companyItem.getCompanyEmpNo());
			ps.setInt(5, companyItem.getCompanyNo());
			ps.setString(6, companyItem.getCompanyFriendlySite());
			ps.setInt(7, companyItem.getAdressId());
			ps.setInt(8, companyItem.getCountryRegistrationId());
			ps.setInt(9, companyItem.getYear());
			
			java.sql.Date sqlDate =
				   new java.sql.Date(companyItem.getDateCreated().getTime());
			ps.setDate(10, sqlDate);
			sqlDate = new java.sql.Date(companyItem.getDateUpdated().getTime());
			ps.setDate(11, sqlDate);
			sqlDate = new java.sql.Date(companyItem.getDateLastReview().getTime());
			ps.setDate(12, sqlDate);
			ps.setString(13, companyItem.getReviewedBy());
			ps.setString(14, companyItem.getModifiedBy());

			ps.executeUpdate();
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
				companyItem.setCompanyNo(rs.getInt(6));
				companyItem.setCompanyFriendlySite(rs.getString(7));
				companyItem.setAdressId(rs.getInt(8));
				companyItem.setCompanyEmpNo(rs.getInt(5));
				companyItem.setCountryRegistrationId(rs.getInt(9));
				companyItem.setYear(rs.getInt(10));
				companyItem.setDateLastReview(rs.getDate(11));
				companyItem.setReviewedBy(rs.getString(12));
				companyItem.setDateCreated(rs.getDate(13));
				companyItem.setDateUpdated(rs.getDate(14));
				companyItem.setModifiedBy(rs.getString(15));				
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
			java.sql.Date sqlDate = new java.sql.Date(companyItem.getDateCreated().getTime());
			ps.setDate(10, sqlDate);
			sqlDate = new java.sql.Date(companyItem.getDateUpdated().getTime());
			ps.setDate(11, sqlDate);
			sqlDate = new java.sql.Date(companyItem.getDateLastReview().getTime());
			ps.setDate(12, sqlDate);
			ps.setString(13, companyItem.getReviewedBy());
			ps.setString(14, companyItem.getModifiedBy());
			ps.setInt(15, companyItem.getId());

			ps.executeUpdate();
		}
		finally {
			ConnectionPool.cleanUp(con, ps);
		}
	}
	
	private static final String _ADD_COMPANY_ITEM =
	"INSERT INTO tbl_company (companyName, description, partnerNumber, friendlySAP_site, adressId, noEmployees, parent_companyname, countryRegistrationId ,partner_since, last_review_date, reviewed_By, date_created, date_updated, modified_by) " +
		"VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ? )";

	private static final String _DELETE_COMPANY_ITEM =
		"DELETE FROM tbl_company WHERE companyId = ?";

	private static final String _GET_COMPANY_ITEM =
		"SELECT companyId, companyName, description, parent_companyname, partnerNumber, friendlySAP_site, adressId, noEmployees, countryRegistrationId ,partner_since, last_review_date, reviewed_By, date_created, date_updated, modified_by FROM tbl_company WHERE companyId = ?";

	private static final String _GET_COMPANY_ITEMS =
		"SELECT companyId, companyName, description, parent_companyname, partnerNumber, friendlySAP_site, adressId, noEmployees, countryRegistrationId ,partner_since, last_review_date, reviewed_By, date_created, date_updated, modified_by FROM tbl_company";

	private static final String _UPDATE_COMPANY_ITEM =
		"UPDATE tbl_company SET companyName = ?, description = ?, partnerNumber = ?, friendlySAP_site = ?, adressId = ?, noEmployees = ?, parent_companyname = ?, countryRegistrationId = ?, partner_since = ?, last_review_date = ?, reviewed_By = ?, date_created = ?, date_updated = ?, modified_by = ? WHERE userId = ?";

}