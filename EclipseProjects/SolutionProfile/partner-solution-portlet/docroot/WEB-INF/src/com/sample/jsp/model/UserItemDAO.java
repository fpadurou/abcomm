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

/**
 * <a href="UserItemDAO.java.html"><b><i>View Source</i></b></a>
 *
 * @author  Brian Wing Shun Chan
 *
 */
public class UserItemDAO {

	public static void addUserItem(UserItem userItem) throws SQLException {
		Connection con = null;
		PreparedStatement ps = null;

		try {
			con = ConnectionPool.getConnection();

			ps = con.prepareStatement(_ADD_USER_ITEM);

			ps.setString(1, userItem.getName());
			ps.setString(2, userItem.getUserLastName());
			ps.setString(3, userItem.getUserCompanyName());
			ps.setString(4, userItem.getUserPosition());
			ps.setString(5, userItem.getUserMobilePhone());
			ps.setString(6, userItem.getUserWorkPhone());
			ps.setInt(7, userItem.getCompanyId());
			ps.setInt(8, userItem.getAdressId());

			ps.executeUpdate();
		}
		finally {
			ConnectionPool.cleanUp(con, ps);
		}
	}

	public static void deleteUserItem(int id) throws SQLException {
		Connection con = null;
		PreparedStatement ps = null;

		try {
			con = ConnectionPool.getConnection();

			ps = con.prepareStatement(_DELETE_USER_ITEM);

			ps.setInt(1, id);

			ps.executeUpdate();
		}
		finally {
			ConnectionPool.cleanUp(con, ps);
		}
	}

	public static UserItem getUserItem(int id) throws SQLException {
		UserItem userItem = null;

		Connection con = null;
		PreparedStatement ps = null;
		ResultSet rs = null;

		try {
			con = ConnectionPool.getConnection();

			ps = con.prepareStatement(_GET_USER_ITEM);

			ps.setInt(1, id);

			rs = ps.executeQuery();

			if (rs.next()) {
				userItem = new UserItem();

				userItem.setId(id);
				userItem.setName(rs.getString(2));
				userItem.setUserLastName(rs.getString(3));
				userItem.setUserCompanyName(rs.getString(4));
				userItem.setUserPosition(rs.getString(5));
				userItem.setUserMobilePhone(rs.getString(6));
				userItem.setUserWorkPhone(rs.getString(7));
				userItem.setCompanyId(rs.getInt(8));
				userItem.setAdressId(rs.getInt(9));
			}
		}
		finally {
			ConnectionPool.cleanUp(con, ps, rs);
		}

		return userItem;
	}

	public static UserItem getUserItemByCompanyId(int id) throws SQLException {
		UserItem userItem = null;

		Connection con = null;
		PreparedStatement ps = null;
		ResultSet rs = null;

		try {
			con = ConnectionPool.getConnection();

			ps = con.prepareStatement(_GET_USER_ITEM_BY_COMPANY_ID);

			ps.setInt(1, id);

			rs = ps.executeQuery();

			if (rs.next()) {
				userItem = new UserItem();

				userItem.setId(id);
				userItem.setName(rs.getString(2));
				userItem.setUserLastName(rs.getString(3));
				userItem.setUserCompanyName(rs.getString(4));
				userItem.setUserPosition(rs.getString(5));
				userItem.setUserMobilePhone(rs.getString(6));
				userItem.setUserWorkPhone(rs.getString(7));
				userItem.setCompanyId(rs.getInt(8));
				userItem.setAdressId(rs.getInt(9));				
			}
		}
		finally {
			ConnectionPool.cleanUp(con, ps, rs);
		}

		return userItem;
	}	
	
	public static List getUserItems() throws SQLException {
		List list = new ArrayList();

		Connection con = null;
		PreparedStatement ps = null;
		ResultSet rs = null;

		try {
			con = ConnectionPool.getConnection();

			ps = con.prepareStatement(_GET_USER_ITEMS);

			rs = ps.executeQuery();

			while (rs.next()) {
				UserItem userItem = new UserItem();

				userItem.setId(rs.getInt(1));
				userItem.setName(rs.getString(2));
				userItem.setUserLastName(rs.getString(3));
				userItem.setUserCompanyName(rs.getString(4));
				userItem.setUserPosition(rs.getString(5));
				userItem.setUserMobilePhone(rs.getString(6));
				userItem.setUserWorkPhone(rs.getString(7));
				userItem.setCompanyId(rs.getInt(8));
				userItem.setAdressId(rs.getInt(9));
				
				list.add(userItem);
			}
		}
		finally {
			ConnectionPool.cleanUp(con, ps, rs);
		}

		return list;
	}

	public static void updateUserItem(UserItem userItem) throws SQLException {
		Connection con = null;
		PreparedStatement ps = null;

		try {
			con = ConnectionPool.getConnection();

			ps = con.prepareStatement(_UPDATE_USER_ITEM);

			ps.setString(1, userItem.getName());
			ps.setString(2, userItem.getUserLastName());
			ps.setString(3, userItem.getUserCompanyName());
			ps.setString(4, userItem.getUserPosition());
			ps.setString(5, userItem.getUserMobilePhone());
			ps.setString(6, userItem.getUserWorkPhone());
			ps.setInt(7, userItem.getCompanyId());
			ps.setInt(8, userItem.getAdressId());
			
			ps.setInt(9, userItem.getId());

			ps.executeUpdate();
		}
		finally {
			ConnectionPool.cleanUp(con, ps);
		}
	}

	private static final String _ADD_USER_ITEM =
		"INSERT INTO Registration (userFirstName, userLastName, " +
		"userCompanyName, userPositionCompany, userMobilePhone, userWorkPhone, companyId, adressId ) " +
		"VALUES (?, ?, ?, ?, ?, ?, ?, ?)";

	private static final String _DELETE_USER_ITEM =
		"DELETE FROM Registration WHERE userId = ?";

	private static final String _GET_USER_ITEM =
		"SELECT userId, userFirstName, userLastName, userCompanyName, userPositionCompany, userMobilePhone, userWorkPhone, companyId, adressId FROM Registration WHERE userId = ?";

	private static final String _GET_USER_ITEM_BY_COMPANY_ID = 
		"SELECT userId, userFirstName, userLastName, userCompanyName, userPositionCompany, userMobilePhone, userWorkPhone, companyId, adressId FROM Registration WHERE companyId = ?";
		
	private static final String _GET_USER_ITEMS =
		"SELECT userId, userFirstName, userLastName, userCompanyName, userPositionCompany, userMobilePhone, userWorkPhone, companyId, adressId FROM Registration";

	private static final String _UPDATE_USER_ITEM =
		"UPDATE Registration SET userFirstName = ?, userLastName = ?, userCompanyName = ?, userPositionCompany = ?, userMobilePhone = ?, userWorkPhone = ?, companyId = ?, adressId = ? WHERE userId = ?";

}