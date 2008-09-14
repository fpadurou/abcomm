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

package com.sample.viewallsolutions.model;

import com.sample.viewallsolutions.util.ConnectionPool;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import java.util.ArrayList;
import java.util.List;

/**
 * <a href="CountryItemDAO.java.html"><b><i>View Source</i></b></a>
 *
 * @author Florin Paduroiu
 *
 */
public class CountryItemDAO {

	public static CountryItem getCountryItem(int id) throws SQLException {
		CountryItem countryItem = null;

		Connection con = null;
		PreparedStatement ps = null;
		ResultSet rs = null;

		try {
			con = ConnectionPool.getConnection();

			ps = con.prepareStatement(_GET_COUNTRY_ITEM);

			ps.setInt(1, id);

			rs = ps.executeQuery();

			if (rs.next()) {
				countryItem = new CountryItem();

				countryItem.setId(id);
				countryItem.setCountryName(rs.getString(2));
				countryItem.setRegionId(rs.getInt(3));
			}
		}
		finally {
			ConnectionPool.cleanUp(con, ps, rs);
		}

		return countryItem;
	}

	public static List getCountryItems() throws SQLException {
		List list = new ArrayList();

		Connection con = null;
		PreparedStatement ps = null;
		ResultSet rs = null;

		try {
			con = ConnectionPool.getConnection();

			ps = con.prepareStatement(_GET_COUNTRY_ITEMS);
			
			rs = ps.executeQuery();

			while (rs.next()) {
				CountryItem countryItem = new CountryItem();

				countryItem.setId(rs.getInt(1));
				countryItem.setCountryName(rs.getString(2));
				countryItem.setRegionId(rs.getInt(3));
				list.add(countryItem);
			}
		}
		finally {
			ConnectionPool.cleanUp(con, ps, rs);
		}

		return list;
	}

	public static List getCountryByRegion(int id) throws SQLException {
		List list = new ArrayList();

		Connection con = null;
		PreparedStatement ps = null;
		ResultSet rs = null;

		try {
			con = ConnectionPool.getConnection();

			ps = con.prepareStatement(_GET_COUNTRY_BYREGION_ITEMS);
			ps.setInt(1, id);
			rs = ps.executeQuery();

			while (rs.next()) {
				CountryItem countryItem = new CountryItem();

				countryItem.setId(rs.getInt(1));
				countryItem.setCountryName(rs.getString(2));
				countryItem.setRegionId(rs.getInt(3));
				list.add(countryItem);
			}
		}
		finally {
			ConnectionPool.cleanUp(con, ps, rs);
		}

		return list;
	}
	
	public static CountryItem getCountryItemByName(String name) throws SQLException {
		CountryItem countryItem = null;

		Connection con = null;
		PreparedStatement ps = null;
		ResultSet rs = null;

		try {
			con = ConnectionPool.getConnection();

			ps = con.prepareStatement(_GET_COUNTRY_BY_NAME);

			ps.setString(1, name);

			rs = ps.executeQuery();

			if (rs.next()) {
				countryItem = new CountryItem();

				countryItem.setId(rs.getInt(1));
				countryItem.setCountryName(rs.getString(2));
				countryItem.setRegionId(rs.getInt(3));
			}
		}
		finally {
			ConnectionPool.cleanUp(con, ps, rs);
		}

		return countryItem;
	}

	private static final String _GET_COUNTRY_ITEM =
		"SELECT countryId, country_name, regionId FROM tbl_countries WHERE countryId = ?";

	private static final String _GET_COUNTRY_BY_NAME =
		"SELECT countryId, country_name, regionId FROM tbl_countries WHERE country_name = ?";

	private static final String _GET_COUNTRY_BYREGION_ITEMS =
		"SELECT countryId, country_name, regionId FROM tbl_countries WHERE regionId = ?";

	private static final String _GET_COUNTRY_ITEMS =
		"SELECT countryId, country_name, regionId FROM tbl_countries";

}