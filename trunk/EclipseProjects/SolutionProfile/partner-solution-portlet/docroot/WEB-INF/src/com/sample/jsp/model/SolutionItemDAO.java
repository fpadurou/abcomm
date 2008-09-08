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

import com.sample.solutionprofile.util.ConnectionPool;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import java.util.ArrayList;
import java.util.List;
import java.util.Date;
import java.sql.Types;
import java.sql.*;
/**
 * <a href="SolutionItemDAO.java.html"><b><i>View Source</i></b></a>
 *
 * @author  Florin Paduroiu
 *
 */
public class SolutionItemDAO {

	public static void addSolutionItem(SolutionItem solutionItem) throws SQLException {
		Connection con = null;
		PreparedStatement ps = null;

		try {
			con = ConnectionPool.getConnection();

			ps = con.prepareStatement(_ADD_SOLUTION_ITEM, Statement.RETURN_GENERATED_KEYS);

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

	public static void deleteSolutionItem(int id) throws SQLException {
		Connection con = null;
		PreparedStatement ps = null;

		try {
			con = ConnectionPool.getConnection();

			ps = con.prepareStatement(_DELETE_SOLUTION_ITEM);

			ps.setInt(1, id);

			ps.executeUpdate();
		}
		finally {
			ConnectionPool.cleanUp(con, ps);
		}
	}

	public static SolutionItem getSolutionItem(int id) throws SQLException {
		SolutionItem solutionItem = null;

		Connection con = null;
		PreparedStatement ps = null;
		ResultSet rs = null;

		try {
			con = ConnectionPool.getConnection();

			ps = con.prepareStatement(_GET_SOLUTION_ITEM);

			ps.setInt(1, id);

			rs = ps.executeQuery();

			if (rs.next()) {
				solutionItem = new SolutionItem();

				solutionItem.setId(id);
				solutionItem.setName(rs.getString(2));
				solutionItem.setDescription(rs.getString(3));
				solutionItem.setParentCompanyName(rs.getString(4));
				solutionItem.setCompanyNo(rs.getInt(5));
				solutionItem.setCompanyFriendlySite(rs.getString(6));
				solutionItem.setCompanyEmpNo(rs.getInt(8));
				solutionItem.setCountryRegistrationId(rs.getInt(9));
				solutionItem.setYear(rs.getInt(10));
				solutionItem.setDateLastReview(rs.getDate(11));
				solutionItem.setReviewedBy(rs.getString(12));
				solutionItem.setDateCreated(rs.getDate(13));
				solutionItem.setDateUpdated(rs.getDate(14));
				solutionItem.setModifiedBy(rs.getString(15));				
				solutionItem.setCompanySite(rs.getString(16));				
			}
		}
		finally {
			ConnectionPool.cleanUp(con, ps, rs);
		}

		return solutionItem;
	}

	public static List getSolutionItems() throws SQLException {
		List list = new ArrayList();

		Connection con = null;
		PreparedStatement ps = null;
		ResultSet rs = null;

		try {
			con = ConnectionPool.getConnection();

			ps = con.prepareStatement(_GET_SOLUTION_ITEMS);

			rs = ps.executeQuery();

			while (rs.next()) {
				SolutionItem solutionItem = new SolutionItem();

				solutionItem.setId(rs.getInt(1));
				solutionItem.setName(rs.getString(2));
				solutionItem.setDescription(rs.getString(3));
				solutionItem.setParentCompanyName(rs.getString(4));
				solutionItem.setCompanyNo(rs.getInt(5));
				solutionItem.setCompanyFriendlySite(rs.getString(5));
				solutionItem.setAdressId(rs.getInt(7));
				solutionItem.setCompanyEmpNo(rs.getInt(8));
				solutionItem.setCountryRegistrationId(rs.getInt(9));
				solutionItem.setYear(rs.getInt(10));
				solutionItem.setDateLastReview(rs.getDate(11));
				solutionItem.setReviewedBy(rs.getString(12));
				solutionItem.setDateCreated(rs.getDate(13));
				solutionItem.setDateUpdated(rs.getDate(14));
				solutionItem.setModifiedBy(rs.getString(15));				
				solutionItem.setCompanySite(rs.getString(16));				
				
				list.add(solutionItem);
			}
		}
		finally {
			ConnectionPool.cleanUp(con, ps, rs);
		}

		return list;
	}

	public static void updateSolutionItem(SolutionItem solutionItem) throws SQLException {
		Connection con = null;
		PreparedStatement ps = null;

		try {
			con = ConnectionPool.getConnection();

			ps = con.prepareStatement(_UPDATE_SOLUTION_ITEM);

			ps.setString(1, solutionItem.getName());
			ps.setString(2, solutionItem.getDescription());
			ps.setString(3, solutionItem.getParentCompanyName());
			ps.setInt(4, solutionItem.getCompanyEmpNo());
			ps.setInt(5, solutionItem.getCompanyNo());
			ps.setString(6, solutionItem.getCompanyFriendlySite());
			ps.setInt(7, solutionItem.getAdressId());
			ps.setInt(8, solutionItem.getCountryRegistrationId());
			ps.setInt(9, solutionItem.getYear());
			java.util.Date date = new java.util.Date();
			if(solutionItem.getDateCreated() != null)
				ps.setDate(10, new java.sql.Date(solutionItem.getDateCreated().getTime()));
			else
				ps.setDate(10, new java.sql.Date(date.getTime()));

			if(solutionItem.getDateUpdated() != null)
				ps.setDate(11, new java.sql.Date(solutionItem.getDateUpdated().getTime()));
			else
				ps.setDate(11, new java.sql.Date(date.getTime()));
					
			if(solutionItem.getDateLastReview() != null)
				ps.setDate(12, new java.sql.Date(solutionItem.getDateLastReview().getTime()));
			else
				ps.setDate(12, new java.sql.Date(date.getTime()));

			ps.setString(13, solutionItem.getReviewedBy());
			ps.setString(14, solutionItem.getModifiedBy());
			ps.setString(15, solutionItem.getCompanySite());				
			ps.setInt(16, solutionItem.getId());

			ps.executeUpdate();
		}
		finally {
			ConnectionPool.cleanUp(con, ps);
		}
	}


	
	private static final String _ADD_SOLUTION_ITEM =
	"INSERT INTO tbl_sol_directory (companyName, description, parent_companyname, noEmployees, partnerNumber, friendlySAP_site, adressId, countryRegistrationId ,partner_since, date_created, date_updated, last_review_date, reviewed_By, modified_by, web_site) " +
		"VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ? )";

	private static final String _DELETE_SOLUTION_ITEM =
		"DELETE FROM tbl_sol_directory WHERE solId = ?";

	private static final String _GET_SOLUTION_ITEM =
		"SELECT solId, companyName, description, parent_companyname, partnerNumber, friendlySAP_site, adressId, noEmployees, countryRegistrationId ,partner_since, last_review_date, reviewed_By, date_created, date_updated, modified_by, web_site FROM tbl_sol_directory WHERE solId = ?";

	private static final String _GET_SOLUTION_ITEMS =
		"SELECT solId, companyName, description, parent_companyname, partnerNumber, friendlySAP_site, adressId, noEmployees, countryRegistrationId ,partner_since, last_review_date, reviewed_By, date_created, date_updated, modified_by, web_site FROM tbl_sol_directory";

	private static final String _UPDATE_SOLUTION_ITEM =
		"UPDATE tbl_sol_directory SET companyName = ?, description = ?, parent_companyname = ?, noEmployees = ?, partnerNumber = ?, friendlySAP_site = ?, adressId = ?, countryRegistrationId = ?, partner_since = ?, date_created = ?, date_updated = ?, last_review_date = ?, reviewed_By = ?, modified_by = ?, web_site = ? WHERE solId = ?";
	
}