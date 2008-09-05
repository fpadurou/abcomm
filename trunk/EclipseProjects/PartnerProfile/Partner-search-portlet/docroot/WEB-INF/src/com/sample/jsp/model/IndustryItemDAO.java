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
 * <a href="IndustryItemDAO.java.html"><b><i>View Source</i></b></a>
 *
 * @author  Florin Paduroiu
 *
 */
public class IndustryItemDAO {

	public static IndustryItem getIndustryItem(int id) throws SQLException {
		IndustryItem industryItem = null;

		Connection con = null;
		PreparedStatement ps = null;
		ResultSet rs = null;

		try {
			con = ConnectionPool.getConnection();

			ps = con.prepareStatement(_GET_INDUSTRY_ITEM);

			ps.setInt(1, id);

			rs = ps.executeQuery();

			if (rs.next()) {
				industryItem = new IndustryItem();

				industryItem.setId(id);
				industryItem.setIndustryName(rs.getString(2));
			}
		}
		finally {
			ConnectionPool.cleanUp(con, ps, rs);
		}

		return industryItem;
	}

	public static IndustryItem getIndustryItemByName(String name) throws SQLException {
		IndustryItem industryItem = null;

		if(name == null)
			return null;
		Connection con = null;
		PreparedStatement ps = null;
		ResultSet rs = null;

		try {
			con = ConnectionPool.getConnection();

			ps = con.prepareStatement(_GET_INDUSTRY_ITEM_BY_NAME);

			ps.setString(1, name);

			rs = ps.executeQuery();

			if (rs.next()) {
				industryItem = new IndustryItem();

				industryItem.setId(rs.getInt(1));
				industryItem.setIndustryName(rs.getString(2));
			}
		}
		finally {
			ConnectionPool.cleanUp(con, ps, rs);
		}

		return industryItem;
	}
	
	public static List getIndustryItems() throws SQLException {
		List list = new ArrayList();

		Connection con = null;
		PreparedStatement ps = null;
		ResultSet rs = null;

		try {
			con = ConnectionPool.getConnection();

			ps = con.prepareStatement(_GET_INDUSTRY_ITEMS);

			rs = ps.executeQuery();

			while (rs.next()) {
				IndustryItem industryItem = new IndustryItem();

				industryItem.setId(rs.getInt(1));
				industryItem.setIndustryName(rs.getString(2));
				
				list.add(industryItem);
			}
		}
		finally {
			ConnectionPool.cleanUp(con, ps, rs);
		}

		return list;
	}



	private static final String _GET_INDUSTRY_ITEM =
		"SELECT industryId, industry_name FROM tbl_industry_microvertical WHERE industryId = ?";

	private static final String _GET_INDUSTRY_ITEMS =
		"SELECT industryId, industry_name FROM tbl_industry_microvertical GROUP BY industry_name";

	private static final String _GET_INDUSTRY_ITEM_BY_NAME =
		"SELECT industryId, industry_name FROM tbl_industry_microvertical WHERE industry_name = ?";
	
}