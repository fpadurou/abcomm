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

/**
 * <a href="BusinesstypeItemDAO.java.html"><b><i>View Source</i></b></a>
 *
 * @author  Florin Paduroiu
 *
 */
public class BusinesstypeItemDAO {

	public static void addBusinesstypeItem(BusinesstypeItem businesstypeItem) throws SQLException {
		Connection con = null;
		PreparedStatement ps = null;

		try {
			con = ConnectionPool.getConnection();

			ps = con.prepareStatement(_ADD_BUSINESSTYPE_ITEM);

			ps.setString(1, businesstypeItem.getBusinessName());
			ps.executeUpdate();
		}
		finally {
			ConnectionPool.cleanUp(con, ps);
		}
	}

	public static void deleteBusinesstypeItem(int id) throws SQLException {
		Connection con = null;
		PreparedStatement ps = null;

		try {
			con = ConnectionPool.getConnection();

			ps = con.prepareStatement(_DELETE_BUSINESSTYPE_ITEM);

			ps.setInt(1, id);

			ps.executeUpdate();
		}
		finally {
			ConnectionPool.cleanUp(con, ps);
		}
	}

	public static BusinesstypeItem getBusinesstypeItem(int id) throws SQLException {
		BusinesstypeItem businesstypeItem = null;

		Connection con = null;
		PreparedStatement ps = null;
		ResultSet rs = null;

		try {
			con = ConnectionPool.getConnection();

			ps = con.prepareStatement(_GET_BUSINESSTYPE_ITEM);

			ps.setInt(1, id);

			rs = ps.executeQuery();

			if (rs.next()) {
				businesstypeItem = new BusinesstypeItem();

				businesstypeItem.setId(id);
				businesstypeItem.setBusinessName(rs.getString(2));
			}
		}
		finally {
			ConnectionPool.cleanUp(con, ps, rs);
		}

		return businesstypeItem;
	}

	public static BusinesstypeItem getBusinesstypeItemByName(String name) throws SQLException {
		BusinesstypeItem businesstypeItem = null;

		Connection con = null;
		PreparedStatement ps = null;
		ResultSet rs = null;

		try {
			con = ConnectionPool.getConnection();

			ps = con.prepareStatement(_GET_BUSINESSTYPE_ITEM_BY_NAME);

			ps.setString(1, name);

			rs = ps.executeQuery();

			if (rs.next()) {
				businesstypeItem = new BusinesstypeItem();

				businesstypeItem.setId(rs.getInt(1));
				businesstypeItem.setBusinessName(rs.getString(2));
			}
		}
		finally {
			ConnectionPool.cleanUp(con, ps, rs);
		}

		return businesstypeItem;
	}

	public static List getBusinessTypeItems() throws SQLException {
		List list = new ArrayList();

		Connection con = null;
		PreparedStatement ps = null;
		ResultSet rs = null;

		try {
			con = ConnectionPool.getConnection();

			ps = con.prepareStatement(_GET_BUSINESSTYPE_ITEMS);

			rs = ps.executeQuery();

			while (rs.next()) {
				BusinesstypeItem businesstypeItem = new BusinesstypeItem();

				businesstypeItem.setId(rs.getInt(1));
				businesstypeItem.setBusinessName(rs.getString(2));
				
				list.add(businesstypeItem);
			}
		}
		finally {
			ConnectionPool.cleanUp(con, ps, rs);
		}

		return list;
	}

	public static void updateBusinesstypeItem(BusinesstypeItem businesstypeItem) throws SQLException {
		Connection con = null;
		PreparedStatement ps = null;

		try {
			con = ConnectionPool.getConnection();

			ps = con.prepareStatement(_UPDATE_BUSINESSTYPE_ITEM);

			ps.setString(1, businesstypeItem.getBusinessName());
			ps.setInt(2, businesstypeItem.getId());

			ps.executeUpdate();
		}
		finally {
			ConnectionPool.cleanUp(con, ps);
		}
	}

	private static final String _ADD_BUSINESSTYPE_ITEM =
		"INSERT INTO tbl_businesstype (business_name) VALUES (?)";

	private static final String _DELETE_BUSINESSTYPE_ITEM =
		"DELETE FROM tbl_businesstype WHERE businesstypeId = ?";

	private static final String _GET_BUSINESSTYPE_ITEM =
		"SELECT businesstypeId, business_name FROM tbl_businesstype WHERE businesstypeId = ?";
	
	private static final String _GET_BUSINESSTYPE_ITEM_BY_NAME = 
		"SELECT businesstypeId, business_name FROM tbl_businesstype WHERE business_name = ?";

	private static final String _GET_BUSINESSTYPE_ITEMS =
		"SELECT businesstypeId, business_name FROM tbl_businesstype";

	private static final String _UPDATE_BUSINESSTYPE_ITEM =
		"UPDATE tbl_businesstype SET business_name = ? WHERE businesstypeId = ?";

}