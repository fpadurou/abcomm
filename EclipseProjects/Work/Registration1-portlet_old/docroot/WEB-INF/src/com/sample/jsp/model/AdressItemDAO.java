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

/**
 * <a href="AdressItemDAO.java.html"><b><i>View Source</i></b></a>
 *
 * @author  Florin Paduroiu
 *
 */

public class AdressItemDAO {
	
	public static void addAdressItem(AdressItem adressItem) throws SQLException {
		Connection con = null;
		PreparedStatement ps = null;

		try {
			con = ConnectionPool.getConnection();

			ps = con.prepareStatement(_ADD_ADRESS_ITEM);

			ps.setInt(1, adressItem.getCompanyId());
			ps.setInt(2, adressItem.getUserId());
			ps.setString(3, adressItem.getStreet1());
			ps.setString(4, adressItem.getStreet2());
			ps.setString(5, adressItem.getCity());
			ps.setString(6, adressItem.getZip());
			ps.setString(7, adressItem.getStateregionname());
			ps.setInt(8, adressItem.getCountryId());
			ps.setInt(9, adressItem.getPhoneId());
			ps.setInt(10, adressItem.getFaxId());

			ps.executeUpdate();
		}
		finally {
			ConnectionPool.cleanUp(con, ps);
		}
	}

	public static void deleteAdressItem(int id) throws SQLException {
		Connection con = null;
		PreparedStatement ps = null;

		try {
			con = ConnectionPool.getConnection();

			ps = con.prepareStatement(_DELETE_ADRESS_ITEM);

			ps.setInt(1, id);

			ps.executeUpdate();
		}
		finally {
			ConnectionPool.cleanUp(con, ps);
		}
	}

	public static AdressItem getAdressItem(int id) throws SQLException {
		AdressItem adressItem = null;

		Connection con = null;
		PreparedStatement ps = null;
		ResultSet rs = null;

		try {
			con = ConnectionPool.getConnection();

			ps = con.prepareStatement(_GET_ADRESS_ITEM);

			ps.setInt(1, id);

			rs = ps.executeQuery();

			if (rs.next()) {
				adressItem = new AdressItem();

				adressItem.setId(id);
				adressItem.setCompanyId(rs.getInt(2));
				adressItem.setUserId(rs.getInt(3));
				adressItem.setStreet1(rs.getString(4));
				adressItem.setStreet2(rs.getString(5));
				adressItem.setCity(rs.getString(6));
				adressItem.setZip(rs.getString(7));
				adressItem.setStateregionname(rs.getString(8));
				adressItem.setCountryId(rs.getInt(9));
				adressItem.setPhoneId(rs.getInt(10));
				adressItem.setFaxId(rs.getInt(11));
			}
		}
		finally {
			ConnectionPool.cleanUp(con, ps, rs);
		}

		return adressItem;
	}

	public static List getAdressItems() throws SQLException {
		List list = new ArrayList();

		Connection con = null;
		PreparedStatement ps = null;
		ResultSet rs = null;

		try {
			con = ConnectionPool.getConnection();

			ps = con.prepareStatement(_GET_ADRESS_ITEMS);

			rs = ps.executeQuery();

			while (rs.next()) {
				AdressItem adressItem = new AdressItem();

				adressItem.setId(rs.getInt(1));
				adressItem.setCompanyId(rs.getInt(2));
				adressItem.setUserId(rs.getInt(3));
				adressItem.setStreet1(rs.getString(4));
				adressItem.setStreet2(rs.getString(5));
				adressItem.setCity(rs.getString(6));
				adressItem.setZip(rs.getString(7));
				adressItem.setStateregionname(rs.getString(8));
				adressItem.setCountryId(rs.getInt(9));
				adressItem.setPhoneId(rs.getInt(10));
				adressItem.setFaxId(rs.getInt(11));
				
				list.add(adressItem);
			}
		}
		finally {
			ConnectionPool.cleanUp(con, ps, rs);
		}

		return list;
	}

	public static void updateAdressItem(AdressItem adressItem) throws SQLException {
		Connection con = null;
		PreparedStatement ps = null;

		try {
			con = ConnectionPool.getConnection();

			ps = con.prepareStatement(_UPDATE_ADRESS_ITEM);

			ps.setInt(1, adressItem.getCompanyId());
			ps.setInt(2, adressItem.getUserId());
			ps.setString(3, adressItem.getStreet1());
			ps.setString(4, adressItem.getStreet2());
			ps.setString(5, adressItem.getCity());
			ps.setString(6, adressItem.getZip());
			ps.setString(7, adressItem.getStateregionname());
			ps.setInt(8, adressItem.getCountryId());
			ps.setInt(9, adressItem.getPhoneId());
			ps.setInt(10, adressItem.getFaxId());
			ps.setInt(11, adressItem.getId());

			ps.executeUpdate();
		}
		finally {
			ConnectionPool.cleanUp(con, ps);
		}
	}

	private static final String _ADD_ADRESS_ITEM =
		"INSERT INTO tbl_adress (companyId, userId, street1, street2, city, zip, stateregionname, countryId, phoneId, faxId ) " +
		"VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?, ?)";

	private static final String _DELETE_ADRESS_ITEM =
		"DELETE FROM tbl_adress WHERE adressId = ?";

	private static final String _GET_ADRESS_ITEM =
		"SELECT companyId, userId, street1, street2, city, zip, stateregionname, countryId, phoneId, faxId FROM tbl_adress WHERE adressId = ?";

	private static final String _GET_ADRESS_ITEMS =
		"SELECT adressId, companyId, userId, street1, street2, city, zip, stateregionname, countryId, phoneId, faxId FROM tbl_adress";

	private static final String _UPDATE_ADRESS_ITEM =
		"UPDATE tbl_adress SET companyId = ?, userId = ?, street1 = ?, street2 = ?, city = ?, zip = ?, stateregionname = ?, countryId = ?, phoneId = ?, faxId = ? WHERE adressId = ?";

}