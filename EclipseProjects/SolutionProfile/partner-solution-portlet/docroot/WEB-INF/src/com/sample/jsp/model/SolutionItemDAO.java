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
			java.util.Date date = new java.util.Date();
			java.sql.Date sqlDate = null ;
			if(solutionItem.sapCertSince != null)
			{
				sqlDate =
					   new java.sql.Date(solutionItem.sapCertSince.getTime());
			}
			else 
			{
				sqlDate =
					   new java.sql.Date(date.getTime());
			}
			ps = con.prepareStatement(_ADD_SOLUTION_ITEM, Statement.RETURN_GENERATED_KEYS);

			ps.setLong(1, solutionItem.companyId) ;
			ps.setString(2, solutionItem.solName) ; 
			ps.setString(3,solutionItem.solDesc );
			ps.setString(4,solutionItem.partComSite); 
			ps.setInt(5,solutionItem.solFocus);
			ps.setDate(6,sqlDate);
			ps.setDate(7,sqlDate/*solutionItem.lastReviewBySAP*/);
			ps.setInt(8,solutionItem.averTrainEndUser);
			ps.setInt(9,solutionItem.averImplTrainingDays);
			ps.setInt(10,solutionItem.averImplEffort);
			ps.setInt(11,solutionItem.averImplDuration );
			ps.setInt(12,solutionItem.averSizeImplTeam );
			ps.setInt(13,solutionItem.averSaleCycle );
			ps.setInt(14,solutionItem.noCustomers );
			ps.setInt(15,solutionItem.smallImpl );
			ps.setInt(16,solutionItem.largeImpl );
			ps.setInt(17,solutionItem.smallImplTime );
			ps.setInt(18,solutionItem.largeImplTime );
			ps.setInt(19,solutionItem.smallImplTeamNo );
			ps.setInt(20,solutionItem.largeImplTeamNo );
			ps.setString(21,solutionItem.solSite );
			ps.setString(22,solutionItem.refCustAvailForUse);
			ps.setInt(23,solutionItem.totalAppBaseLinePrice);
			ps.setInt(24,solutionItem.appPriceEur );
			ps.setInt(25,solutionItem.hardwareCost );
			ps.setInt(26,solutionItem.hardwareCostEur );
			ps.setInt(27,solutionItem.averLicensePrice );
			ps.setInt(28,solutionItem.averLicensePriceEur );
			ps.setInt(29,solutionItem.addServiceCost );
			ps.setInt(30,solutionItem.addServicePriceEur );
			ps.setInt(31,solutionItem.implCost );
			ps.setInt(32,solutionItem.implCostEur );
			ps.setString(33,solutionItem.sapDiscount );
			ps.setString(34,solutionItem.dbUsed );
			ps.setString(35,solutionItem.SAPBusUsed);
			ps.setString(36,solutionItem.SAPGUIUsed);
			ps.setString(37,solutionItem.compA1B1Used);
			ps.setString(38,solutionItem.thirdPartyUsed);
			ps.setString(39,solutionItem.thirdPartyName);
			ps.setString(40,solutionItem.otherIT);
			ps.setString(41,solutionItem.addRemarks );
			ps.setString(42,solutionItem.solSAPMicroSite);
			ps.setDate(43,sqlDate/*solutionItem.lastPartRevieDate*/);
			ps.setString(44,solutionItem.reviewedBy );
			ps.setString(45,solutionItem.profileAdded );
			ps.setDate(46,sqlDate/*solutionItem.dateCreated */);
			ps.setString(47,solutionItem.modifiedBy);
			ps.setDate(48,sqlDate/*solutionItem.dateUpdated */);
			ps.setString(49,solutionItem.notificationProc);

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
				solutionItem.setId(autoIncKeyFromApi);
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
				solutionItem.companyId = rs.getInt(2) ;
				solutionItem.solName = rs.getString(3) ; 
				solutionItem.solDesc = rs.getString(4);
				solutionItem.partComSite= rs.getString(5); 
				solutionItem.solFocus = rs.getInt(6);
				solutionItem.sapCertSince = rs.getDate(7);
				solutionItem.lastReviewBySAP = rs.getDate(8);
				solutionItem.averTrainEndUser= rs.getInt(9);
				solutionItem.averImplTrainingDays=rs.getInt(10);
				solutionItem.averImplEffort =rs.getInt(11);
				solutionItem.averImplDuration = rs.getInt(12);
				solutionItem.averSizeImplTeam = rs.getInt(13);
				solutionItem.averSaleCycle = rs.getInt(14);
				solutionItem.noCustomers = rs.getInt(15);
				solutionItem.smallImpl = rs.getInt(16);
				solutionItem.largeImpl = rs.getInt(17);
				solutionItem.smallImplTime = rs.getInt(18);
				solutionItem.largeImplTime = rs.getInt(19);
				solutionItem.smallImplTeamNo = rs.getInt(20);
				solutionItem.largeImplTeamNo = rs.getInt(21);
				solutionItem.solSite = rs.getString(22);
				solutionItem.refCustAvailForUse = rs.getString(23);
				solutionItem.totalAppBaseLinePrice = rs.getInt(24);
				solutionItem.appPriceEur = rs.getInt(25);
				solutionItem.hardwareCost = rs.getInt(26);
				solutionItem.hardwareCostEur = rs.getInt(27);
				solutionItem.averLicensePrice = rs.getInt(28);
				solutionItem.averLicensePriceEur = rs.getInt(29);
				solutionItem.addServiceCost = rs.getInt(30);
				solutionItem.addServicePriceEur = rs.getInt(31);
				solutionItem.implCost = rs.getInt(32);
				solutionItem.implCostEur = rs.getInt(33);
				solutionItem.sapDiscount = rs.getString(34);
				solutionItem.dbUsed = rs.getString(35);
				solutionItem.SAPBusUsed = rs.getString(36);
				solutionItem.SAPGUIUsed = rs.getString(37);
				solutionItem.compA1B1Used = rs.getString(38);
				solutionItem.thirdPartyUsed = rs.getString(39);
				solutionItem.thirdPartyName = rs.getString(40);
				solutionItem.otherIT = rs.getString(41);
				solutionItem.addRemarks = rs.getString(42);
				solutionItem.solSAPMicroSite = rs.getString(43);
				solutionItem.lastPartRevieDate = rs.getDate(44);
				solutionItem.reviewedBy = rs.getString(45);
				solutionItem.profileAdded = rs.getString(46);
				solutionItem.dateCreated = rs.getDate(47);
				solutionItem.modifiedBy = rs.getString(48);
				solutionItem.dateUpdated  = rs.getDate(49);
				solutionItem.notificationProc = rs.getString(50);
				
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

				solutionItem.setId(rs.getLong(1));
				solutionItem.companyId = rs.getInt(2) ;
				solutionItem.solName = rs.getString(3) ; 
				solutionItem.solDesc = rs.getString(4);
				solutionItem.partComSite= rs.getString(5); 
				solutionItem.solFocus = rs.getInt(6);
				solutionItem.sapCertSince = rs.getDate(7);
				solutionItem.lastReviewBySAP = rs.getDate(8);
				solutionItem.averTrainEndUser= rs.getInt(9);
				solutionItem.averImplTrainingDays=rs.getInt(10);
				solutionItem.averImplEffort =rs.getInt(11);
				solutionItem.averImplDuration = rs.getInt(12);
				solutionItem.averSizeImplTeam = rs.getInt(13);
				solutionItem.averSaleCycle = rs.getInt(14);
				solutionItem.noCustomers = rs.getInt(15);
				solutionItem.smallImpl = rs.getInt(16);
				solutionItem.largeImpl = rs.getInt(17);
				solutionItem.smallImplTime = rs.getInt(18);
				solutionItem.largeImplTime = rs.getInt(19);
				solutionItem.smallImplTeamNo = rs.getInt(20);
				solutionItem.largeImplTeamNo = rs.getInt(21);
				solutionItem.solSite = rs.getString(22);
				solutionItem.refCustAvailForUse = rs.getString(23);
				solutionItem.totalAppBaseLinePrice = rs.getInt(24);
				solutionItem.appPriceEur = rs.getInt(25);
				solutionItem.hardwareCost = rs.getInt(26);
				solutionItem.hardwareCostEur = rs.getInt(27);
				solutionItem.averLicensePrice = rs.getInt(28);
				solutionItem.averLicensePriceEur = rs.getInt(29);
				solutionItem.addServiceCost = rs.getInt(30);
				solutionItem.addServicePriceEur = rs.getInt(31);
				solutionItem.implCost = rs.getInt(32);
				solutionItem.implCostEur = rs.getInt(33);
				solutionItem.sapDiscount = rs.getString(34);
				solutionItem.dbUsed = rs.getString(35);
				solutionItem.SAPBusUsed = rs.getString(36);
				solutionItem.SAPGUIUsed = rs.getString(37);
				solutionItem.compA1B1Used = rs.getString(38);
				solutionItem.thirdPartyUsed = rs.getString(39);
				solutionItem.thirdPartyName = rs.getString(40);
				solutionItem.otherIT = rs.getString(41);
				solutionItem.addRemarks = rs.getString(42);
				solutionItem.solSAPMicroSite = rs.getString(43);
				solutionItem.lastPartRevieDate = rs.getDate(44);
				solutionItem.reviewedBy = rs.getString(45);
				solutionItem.profileAdded = rs.getString(46);
				solutionItem.dateCreated = rs.getDate(47);
				solutionItem.modifiedBy = rs.getString(48);
				solutionItem.dateUpdated  = rs.getDate(49);
				solutionItem.notificationProc = rs.getString(50);
				
				
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

			java.util.Date date = new java.util.Date();
			java.sql.Date sqlDate = null;
			if(solutionItem.sapCertSince != null)
				sqlDate = new java.sql.Date(solutionItem.sapCertSince.getTime());
			else
				sqlDate = new java.sql.Date(date.getTime());

			ps.setLong(1, solutionItem.companyId) ;
			ps.setString(2, solutionItem.solName) ; 
			ps.setString(3,solutionItem.solDesc );
			ps.setString(4,solutionItem.partComSite); 
			ps.setInt(5,solutionItem.solFocus);
			ps.setDate(6,sqlDate);
			ps.setDate(7,sqlDate/*solutionItem.lastReviewBySAP*/);
			ps.setInt(8,solutionItem.averTrainEndUser);
			ps.setInt(9,solutionItem.averImplTrainingDays);
			ps.setInt(10,solutionItem.averImplEffort);
			ps.setInt(11,solutionItem.averImplDuration );
			ps.setInt(12,solutionItem.averSizeImplTeam );
			ps.setInt(13,solutionItem.averSaleCycle );
			ps.setInt(14,solutionItem.noCustomers );
			ps.setInt(15,solutionItem.smallImpl );
			ps.setInt(16,solutionItem.largeImpl );
			ps.setInt(17,solutionItem.smallImplTime );
			ps.setInt(18,solutionItem.largeImplTime );
			ps.setInt(19,solutionItem.smallImplTeamNo );
			ps.setInt(20,solutionItem.largeImplTeamNo );
			ps.setString(21,solutionItem.solSite );
			ps.setString(22,solutionItem.refCustAvailForUse);
			ps.setInt(23,solutionItem.totalAppBaseLinePrice);
			ps.setInt(24,solutionItem.appPriceEur );
			ps.setInt(25,solutionItem.hardwareCost );
			ps.setInt(26,solutionItem.hardwareCostEur );
			ps.setInt(27,solutionItem.averLicensePrice );
			ps.setInt(28,solutionItem.averLicensePriceEur );
			ps.setInt(29,solutionItem.addServiceCost );
			ps.setInt(30,solutionItem.addServicePriceEur );
			ps.setInt(31,solutionItem.implCost );
			ps.setInt(32,solutionItem.implCostEur );
			ps.setString(33,solutionItem.sapDiscount );
			ps.setString(34,solutionItem.dbUsed );
			ps.setString(35,solutionItem.SAPBusUsed);
			ps.setString(36,solutionItem.SAPGUIUsed);
			ps.setString(37,solutionItem.compA1B1Used);
			ps.setString(38,solutionItem.thirdPartyUsed);
			ps.setString(39,solutionItem.thirdPartyName);
			ps.setString(40,solutionItem.otherIT);
			ps.setString(41,solutionItem.addRemarks );
			ps.setString(42,solutionItem.solSAPMicroSite);
			ps.setDate(43,sqlDate/*solutionItem.lastPartRevieDate*/);
			ps.setString(44,solutionItem.reviewedBy );
			ps.setString(45,solutionItem.profileAdded );
			ps.setDate(46,sqlDate/*solutionItem.dateCreated */);
			ps.setString(47,solutionItem.modifiedBy);
			ps.setDate(48,sqlDate/*solutionItem.dateUpdated */);
			ps.setString(49,solutionItem.notificationProc);
			
			ps.setLong(50, solutionItem.getId());

			ps.executeUpdate();
		}
		finally {
			ConnectionPool.cleanUp(con, ps);
		}
	}


	
	private static final String _ADD_SOLUTION_ITEM =
	"INSERT INTO tbl_sol_directory " +
	"(companyId, solName, solDesc, partComSite, solFocus, " +
	"sapCertSince, lastReviewBySAP, averTrainEndUser, averImplTrainingDays, " +
	"averImplEffort, averImplDuration, averSizeImplTeam, " +
	"averSaleCycle, noCustomers, smallImpl, largeImpl, smallImplTime, largeImplTime, " +
	"smallImplTeamNo, largeImplTeamNo, solSite, refCustAvailForUse, totalAppBaseLinePrice, " +
	"appPriceEur, hardwareCost, hardwareCostEur, averLicensePrice, averLicensePriceEur, " +
	"addServiceCost, addServicePriceEur, implCost, implCostEur, sapDiscount, dbUsed, " +
	"SAPBusUsed, SAPGUIUsed, compA1B1Used, thirdPartyUsed, thirdPartyName, otherIT, " +
	"addRemarks, solSAPMicroSite, lastPartRevieDate, reviewedBy, profileAdded, " +
	"dateCreated, modifiedBy, dateUpdated, notificationProc) " +
	"VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, " +
	"?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, " +
	"?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ? )";

	private static final String _DELETE_SOLUTION_ITEM =
		"DELETE FROM tbl_sol_directory WHERE solId = ?";

	private static final String _GET_SOLUTION_ITEM =
	"SELECT solId, companyId, solName, solDesc, partComSite, solFocus, sapCertSince, lastReviewBySAP, averTrainEndUser, averImplTrainingDays, " +
	"averImplEffort, averImplDuration, averSizeImplTeam, " +
	"averSaleCycle, noCustomers, smallImpl, largeImpl, smallImplTime, largeImplTime, " +
	"smallImplTeamNo, largeImplTeamNo, solSite, refCustAvailForUse, totalAppBaseLinePrice, " +
	"appPriceEur, hardwareCost, hardwareCostEur, averLicensePrice, averLicensePriceEur, " +
	"addServiceCost, addServicePriceEur, implCost, implCostEur, sapDiscount, dbUsed, " +
	"SAPBusUsed, SAPGUIUsed, compA1B1Used, thirdPartyUsed, thirdPartyName, otherIT, " +
	"addRemarks, solSAPMicroSite, lastPartRevieDate, reviewedBy, profileAdded, " +
	"dateCreated, modifiedBy, dateUpdated, notificationProc " +
	"FROM tbl_sol_directory WHERE solId = ?";

	private static final String _GET_SOLUTION_ITEMS =
		"SELECT solId, companyId, solName, solDesc, partComSite, solFocus, sapCertSince, lastReviewBySAP, averTrainEndUser, averImplTrainingDays, " +
		"averImplEffort, averImplDuration, averSizeImplTeam, " +
		"averSaleCycle, noCustomers, smallImpl, largeImpl, smallImplTime, largeImplTime, " +
		"smallImplTeamNo, largeImplTeamNo, solSite, refCustAvailForUse, totalAppBaseLinePrice, " +
		"appPriceEur, hardwareCost, hardwareCostEur, averLicensePrice, averLicensePriceEur, " +
		"addServiceCost, addServicePriceEur, implCost, implCostEur, sapDiscount, dbUsed, " +
		"SAPBusUsed, SAPGUIUsed, compA1B1Used, thirdPartyUsed, thirdPartyName, otherIT, " +
		"addRemarks, solSAPMicroSite, lastPartRevieDate, reviewedBy, profileAdded, " +
		"dateCreated, modifiedBy, dateUpdated, notificationProc " +
		"FROM tbl_sol_directory";

	private static final String _GET_SOLUTION_ITEMS_BY_COMP_ID =
		"SELECT solId, companyId, solName, solDesc, partComSite, solFocus, sapCertSince, lastReviewBySAP, averTrainEndUser, averImplTrainingDays, " +
		"averImplEffort, averImplDuration, averSizeImplTeam, " +
		"averSaleCycle, noCustomers, smallImpl, largeImpl, smallImplTime, largeImplTime, " +
		"smallImplTeamNo, largeImplTeamNo, solSite, refCustAvailForUse, totalAppBaseLinePrice, " +
		"appPriceEur, hardwareCost, hardwareCostEur, averLicensePrice, averLicensePriceEur, " +
		"addServiceCost, addServicePriceEur, implCost, implCostEur, sapDiscount, dbUsed, " +
		"SAPBusUsed, SAPGUIUsed, compA1B1Used, thirdPartyUsed, thirdPartyName, otherIT, " +
		"addRemarks, solSAPMicroSite, lastPartRevieDate, reviewedBy, profileAdded, " +
		"dateCreated, modifiedBy, dateUpdated, notificationProc " +
		"FROM tbl_sol_directory WHERE companyId = ?";

	
	private static final String _UPDATE_SOLUTION_ITEM =
		"UPDATE tbl_sol_directory SET companyId = ?, solName = ?, solDesc = ?, partComSite = ?, solFocus = ?, " +
		"sapCertSince = ?, lastReviewBySAP = ?, averTrainEndUser = ?, averImplTrainingDays = ?, " +
		"averImplEffort = ?, averImplDuration = ?, averSizeImplTeam = ?, " +
		"averSaleCycle = ?, noCustomers = ?, smallImpl = ?, largeImpl = ?, smallImplTime = ?, largeImplTime = ?, " +
		"smallImplTeamNo = ?, largeImplTeamNo = ?, solSite = ?, refCustAvailForUse = ?, totalAppBaseLinePrice = ?, " +
		"appPriceEur = ?, hardwareCost = ?, hardwareCostEur = ?, averLicensePrice = ?, averLicensePriceEur = ?, " +
		"addServiceCost = ?, addServicePriceEur = ?, implCost = ?, implCostEur = ?, sapDiscount = ?, dbUsed = ?, " +
		"SAPBusUsed = ?, SAPGUIUsed = ?, compA1B1Used = ?, thirdPartyUsed = ?, thirdPartyName = ?, otherIT = ?, " +
		"addRemarks = ?, solSAPMicroSite = ?, lastPartRevieDate = ?, reviewedBy = ?, profileAdded = ?, " +
		"dateCreated = ?, modifiedBy = ?, dateUpdated = ?, notificationProc = ?) " +
		"WHERE solId = ?";
	
}