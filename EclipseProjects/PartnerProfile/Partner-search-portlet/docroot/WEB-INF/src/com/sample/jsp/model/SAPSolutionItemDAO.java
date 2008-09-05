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

package com.sample.searchprofile.model;

import com.sample.searchprofile.util.ConnectionPool;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import java.util.ArrayList;
import java.util.List;

/**
 * <a href="SAPSolutionItemDAO.java.html"><b><i>View Source</i></b></a>
 *
 * @author  Brian Wing Shun Chan
 *
 */
public class SAPSolutionItemDAO {

	public static void addSAPSolutionItem(SAPSolutionItem sapsolutionItem) throws SQLException {
		Connection con = null;
		PreparedStatement ps = null;

		try {
			con = ConnectionPool.getConnection();

			ps = con.prepareStatement(_ADD_SAPSOLUTION_ITEM);

			ps.setString(1, sapsolutionItem.getSAPSolutionName());
			ps.executeUpdate();
		}
		finally {
			ConnectionPool.cleanUp(con, ps);
		}
	}

	public static void deleteSAPSolutionItem(int id) throws SQLException {
		Connection con = null;
		PreparedStatement ps = null;

		try {
			con = ConnectionPool.getConnection();

			ps = con.prepareStatement(_DELETE_SAPSOLUTION_ITEM);

			ps.setInt(1, id);

			ps.executeUpdate();
		}
		finally {
			ConnectionPool.cleanUp(con, ps);
		}
	}

	public static SAPSolutionItem getSAPSolutionItem(int id) throws SQLException {
		SAPSolutionItem sapsolutionItem = null;

		Connection con = null;
		PreparedStatement ps = null;
		ResultSet rs = null;

		try {
			con = ConnectionPool.getConnection();

			ps = con.prepareStatement(_GET_SAPSOLUTION_ITEM);

			ps.setInt(1, id);

			rs = ps.executeQuery();

			if (rs.next()) {
				sapsolutionItem = new SAPSolutionItem();

				sapsolutionItem.setId(id);
				sapsolutionItem.setSAPSolutionName(rs.getString(2));
			}
		}
		finally {
			ConnectionPool.cleanUp(con, ps, rs);
		}

		return sapsolutionItem;
	}

	public static SAPSolutionItem getSAPSolutionItemByName(String name) throws SQLException {
		SAPSolutionItem sapsolutionItem = null;

		Connection con = null;
		PreparedStatement ps = null;
		ResultSet rs = null;

		try {
			con = ConnectionPool.getConnection();

			ps = con.prepareStatement(_GET_SAPSOLUTION_ITEM_BY_NAME);

			ps.setString(1, name);

			rs = ps.executeQuery();

			if (rs.next()) {
				sapsolutionItem = new SAPSolutionItem();

				sapsolutionItem.setId(rs.getInt(1));
				sapsolutionItem.setSAPSolutionName(rs.getString(2));
			}
		}
		finally {
			ConnectionPool.cleanUp(con, ps, rs);
		}

		return sapsolutionItem;
	}	
	
	public static List getSAPSolutionItems() throws SQLException {
		List list = new ArrayList();

		Connection con = null;
		PreparedStatement ps = null;
		ResultSet rs = null;

		try {
			con = ConnectionPool.getConnection();

			ps = con.prepareStatement(_GET_SAPSOLUTION_ITEMS);

			rs = ps.executeQuery();

			while (rs.next()) {
				SAPSolutionItem sapsolutionItem = new SAPSolutionItem();

				sapsolutionItem.setId(rs.getInt(1));
				sapsolutionItem.setSAPSolutionName(rs.getString(2));
				
				list.add(sapsolutionItem);
			}
		}
		finally {
			ConnectionPool.cleanUp(con, ps, rs);
		}

		return list;
	}

	public static void updateSAPSolutionItem(SAPSolutionItem sapsolutionItem) throws SQLException {
		Connection con = null;
		PreparedStatement ps = null;

		try {
			con = ConnectionPool.getConnection();

			ps = con.prepareStatement(_UPDATE_SAPSOLUTION_ITEM);

			ps.setString(1, sapsolutionItem.getSAPSolutionName());
			ps.setInt(2, sapsolutionItem.getId());

			ps.executeUpdate();
		}
		finally {
			ConnectionPool.cleanUp(con, ps);
		}
	}

	private static final String _ADD_SAPSOLUTION_ITEM =
		"INSERT INTO tbl_sapsolutions (SAPSolution_name) VALUES (?)";

	private static final String _DELETE_SAPSOLUTION_ITEM =
		"DELETE FROM tbl_sapsolutions WHERE sapsolutionId = ?";

	private static final String _GET_SAPSOLUTION_ITEM =
		"SELECT sapsolutionId, SAPSolution_name FROM tbl_sapsolutions WHERE sapsolutionId = ?";

	private static final String _GET_SAPSOLUTION_ITEM_BY_NAME =
		"SELECT sapsolutionId, SAPSolution_name FROM tbl_sapsolutions WHERE SAPSolution_name = ?";

	private static final String _GET_SAPSOLUTION_ITEMS =
		"SELECT sapsolutionId, SAPSolution_name FROM tbl_sapsolutions";

	private static final String _UPDATE_SAPSOLUTION_ITEM =
		"UPDATE tbl_sapsolutions SET SAPSolution_name = ? WHERE sapsolutionId = ?";

}