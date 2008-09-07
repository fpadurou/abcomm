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

package com.sample.viewallpartners.model;

import com.sample.viewallpartners.util.ConnectionPool;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import java.util.ArrayList;
import java.util.List;

/**
 * <a href="UserItemDAO.java.html"><b><i>View Source</i></b></a>
 *
 * @author  Brian Wing Shun Chan
 *
 */
public class CompanyToBusinesstypeItemDAO {

	public static void addCompanyToBusinesstypeItem(CompanyToBusinesstypeItem companyTobusinesstypeItem) throws SQLException {
		Connection con = null;
		PreparedStatement ps = null;

		try {
			con = ConnectionPool.getConnection();

			ps = con.prepareStatement(_ADD_COMPANYTOBUSINESSTYPE_ITEM);

			ps.setInt(1, companyTobusinesstypeItem.getCompanyId());
			ps.setInt(2, companyTobusinesstypeItem.getBusinesstypeId());
			ps.setInt(3, companyTobusinesstypeItem.getType());
			ps.executeUpdate();
		}
		finally {
			ConnectionPool.cleanUp(con, ps);
		}
	}

	public static void deleteCompanyToBusinesstypeItem(int id) throws SQLException {
		Connection con = null;
		PreparedStatement ps = null;

		try {
			con = ConnectionPool.getConnection();

			ps = con.prepareStatement(_DELETE_COMPANYTOBUSINESSTYPE_ITEM);

			ps.setInt(1, id);

			ps.executeUpdate();
		}
		finally {
			ConnectionPool.cleanUp(con, ps);
		}
	}

	public static CompanyToBusinesstypeItem getCompanyToBusinesstypeItem(int id) throws SQLException {
		CompanyToBusinesstypeItem companyTobusinesstypeItem = null;

		Connection con = null;
		PreparedStatement ps = null;
		ResultSet rs = null;

		try {
			con = ConnectionPool.getConnection();

			ps = con.prepareStatement(_GET_COMPANYTOBUSINESSTYPE_ITEM);

			ps.setInt(1, id);

			rs = ps.executeQuery();

			if (rs.next()) {
				companyTobusinesstypeItem = new CompanyToBusinesstypeItem();

				companyTobusinesstypeItem.setCompanyId(id);
				companyTobusinesstypeItem.setBusinesstypeId(rs.getInt(2));
				companyTobusinesstypeItem.setType(rs.getInt(3));
			}
		}
		finally {
			ConnectionPool.cleanUp(con, ps, rs);
		}

		return companyTobusinesstypeItem;
	}

	public static List getCompanyToBusinessTypeItems() throws SQLException {
		List list = new ArrayList();

		Connection con = null;
		PreparedStatement ps = null;
		ResultSet rs = null;

		try {
			con = ConnectionPool.getConnection();

			ps = con.prepareStatement(_GET_COMPANYTOBUSINESSTYPE_ITEMS);

			rs = ps.executeQuery();

			while (rs.next()) {
				CompanyToBusinesstypeItem companyTobusinesstypeItem = new CompanyToBusinesstypeItem();

				companyTobusinesstypeItem.setCompanyId(rs.getInt(1));
				companyTobusinesstypeItem.setBusinesstypeId(rs.getInt(2));
				companyTobusinesstypeItem.setType(rs.getInt(3));
				
				list.add(companyTobusinesstypeItem);
			}
		}
		finally {
			ConnectionPool.cleanUp(con, ps, rs);
		}

		return list;
	}

	public static void updateCompanyToBusinesstypeItem(CompanyToBusinesstypeItem companyTobusinesstypeItem) throws SQLException {
		Connection con = null;
		PreparedStatement ps = null;

		try {
			con = ConnectionPool.getConnection();

			ps = con.prepareStatement(_UPDATE_COMPANYTOBUSINESSTYPE_ITEM);

			ps.setInt(1, companyTobusinesstypeItem.getBusinesstypeId());
			ps.setInt(2, companyTobusinesstypeItem.getType());
			ps.setInt(3, companyTobusinesstypeItem.getCompanyId());

			ps.executeUpdate();
		}
		finally {
			ConnectionPool.cleanUp(con, ps);
		}
	}

	private static final String _ADD_COMPANYTOBUSINESSTYPE_ITEM =
		"INSERT INTO tbl_companies_businesstype (companyId, businesstypeId, type_) VALUES (?, ?, ?)";

	private static final String _DELETE_COMPANYTOBUSINESSTYPE_ITEM =
		"DELETE FROM tbl_companies_businesstype WHERE companyId = ?";

	private static final String _GET_COMPANYTOBUSINESSTYPE_ITEM =
		"SELECT companyId, businesstypeId, type_ FROM tbl_companies_businesstype WHERE companyId = ?";

	private static final String _GET_COMPANYTOBUSINESSTYPE_ITEMS =
		"SELECT companyId, businesstypeId, type_ FROM tbl_companies_businesstype";

	private static final String _UPDATE_COMPANYTOBUSINESSTYPE_ITEM =
		"UPDATE tbl_companies_businesstype SET businesstypeId = ?, type_ = ? WHERE companyId = ?";

}