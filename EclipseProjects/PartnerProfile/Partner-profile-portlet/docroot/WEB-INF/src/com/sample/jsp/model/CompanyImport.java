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
import java.util.Date;
import java.sql.*;
/**
 * <a href="CompanyImport.java.html"><b><i>View Source</i></b></a>
 *
 * @author  Florin Paduroiu
 *
 */
public class CompanyImport {
	
	public static void ImportPartners()throws SQLException
	{
		ImportBussType(); 
		ImportSAPSolutions(); 
		ImportIndustries(); 
		ImportCountryCoverage(); 
	}
	
	public static void ImportBussType()throws SQLException 
	{
		
		List idList = new ArrayList();
		List listvalue1 = new ArrayList();
		List listvalue2 = new ArrayList();
		List idBssName = new ArrayList();
		List idBss = new ArrayList();
		System.out.println("ImportBussType");

		Connection con = null;
		PreparedStatement ps = null;
		ResultSet rs = null;

		try {
			con = ConnectionPool.getConnection();
			String _DELETE_ALL_BSS = "DELETE FROM tbl_companies_businesstype";
			ps = con.prepareStatement(_DELETE_ALL_BSS);

			ps.executeUpdate();
			System.out.println("ImportBussType - delete");
		}
		finally {
			ConnectionPool.cleanUp(con, ps);
		}
		
		
		try {
			con = ConnectionPool.getConnection();
			String selectBussTypeBulk = "SELECT _1, _35, _36 FROM partnerdirectorytaball";
			ps = con.prepareStatement(selectBussTypeBulk);

			rs = ps.executeQuery();

			while (rs.next()) {
			idList.add(rs.getInt(1));
			listvalue1.add(rs.getString(2));
			listvalue2.add(rs.getString(3));
			}
		}
		finally {
			ConnectionPool.cleanUp(con, ps, rs);
		}
		//get the predifined values
		try {
			con = ConnectionPool.getConnection();
			String selectBussType = "SELECT businesstypeId, business_name FROM tbl_businesstype";
			ps = con.prepareStatement(selectBussType);

			rs = ps.executeQuery();

			while (rs.next()) {
				idBss.add(rs.getInt(1));
				idBssName.add(rs.getString(2));
			}
		}
		finally {
			ConnectionPool.cleanUp(con, ps, rs);
		}
		
		for (int i = 0; i < idList.size(); i++) {
			String value1 = (String)listvalue1.get(i);
			int ndx = idBssName.indexOf(value1);
			if(ndx != -1)
			{
				int realndx = (Integer)idBss.get(ndx);
				
				//	add it to data base
				//get the predifined values
				try {
					con = ConnectionPool.getConnection();

					ps = con.prepareStatement(_ADD_COMPANYTOBUSINESSTYPE_ITEM);

					ps.setInt(1, (Integer)idList.get(i));
					ps.setInt(2, realndx);
					ps.setInt(3, 1);
					ps.executeUpdate();
					System.out.println("Add BussType type 1 with ");
				}
				finally {
					ConnectionPool.cleanUp(con, ps);
				}			
				
			}
			String value2 = (String)listvalue2.get(i);
			ndx = idBssName.indexOf(value2);
			if(ndx != -1)
			{
				int realndx = (Integer)idBss.get(ndx);
				
				//	add it to data base
				//get the predifined values
				try {
					con = ConnectionPool.getConnection();

					ps = con.prepareStatement(_ADD_COMPANYTOBUSINESSTYPE_ITEM);

					ps.setInt(1, (Integer)idList.get(i));
					ps.setInt(2, realndx);
					ps.setInt(3, 2);
					ps.executeUpdate();
					
					System.out.println("Add BussType type 2 with ");
				}
				finally {
					ConnectionPool.cleanUp(con, ps);
				}			
				
			}
		}


		//return list;		
	}

	
	public static void ImportSAPSolutions()throws SQLException 
	{
		
		List idList = new ArrayList();
		List listvalue1 = new ArrayList();
		List idSapSolName = new ArrayList();
		List idSapSol = new ArrayList();
		System.out.println("ImportSAPSOL");

		Connection con = null;
		PreparedStatement ps = null;
		ResultSet rs = null;

		try {
			con = ConnectionPool.getConnection();
			String _DELETE_ALL_SAPSOL = "DELETE FROM tbl_companies_sapsolution";
			ps = con.prepareStatement(_DELETE_ALL_SAPSOL);

			ps.executeUpdate();
			System.out.println("ImportSAPSolutions - delete");
		}
		finally {
			ConnectionPool.cleanUp(con, ps);
		}
		
		
		try {
			con = ConnectionPool.getConnection();
			String selectBussTypeBulk = "SELECT _1, _37 FROM partnerdirectorytaball";
			ps = con.prepareStatement(selectBussTypeBulk);

			rs = ps.executeQuery();

			while (rs.next()) {
			idList.add(rs.getInt(1));
			listvalue1.add(rs.getString(2));
			}
		}
		finally {
			ConnectionPool.cleanUp(con, ps, rs);
		}

		//get the predifined values
		try {
			con = ConnectionPool.getConnection();
			String selectSAPSolType = "SELECT sapsolutionId, SAPSolution_name FROM tbl_sapsolutions";
			ps = con.prepareStatement(selectSAPSolType);

			rs = ps.executeQuery();

			while (rs.next()) {
				idSapSol.add(rs.getInt(1));
				idSapSolName.add(rs.getString(2));
			}
		}
		finally {
			ConnectionPool.cleanUp(con, ps, rs);
		}
		System.out.println("SELECT sapsolutionId cu " + String.valueOf(idSapSolName.size()));
		
		for (int i = 0; i < idList.size(); i++) {
			String value1 = (String)listvalue1.get(i);
			for (int j = 0; j < idSapSolName.size(); j++) {
				String value2 = (String)idSapSolName.get(j);
				System.out.println("Compare values " + value1 + " with  " +value2);
				if((value1 != null) &&  value1.indexOf(value2) >=0 )
				{
					int realndx = (Integer)idSapSol.get(j);
					
					//	add it to data base
					//get the predifined values
					try {
						con = ConnectionPool.getConnection();
	
						ps = con.prepareStatement(_ADD_COMPANYTOSAPSOL_ITEM);
	
						ps.setInt(1, (Integer)idList.get(i));
						ps.setInt(2, realndx);
						ps.executeUpdate();
						System.out.println("Add SAPSOL type");
					}
					finally {
						ConnectionPool.cleanUp(con, ps);
					}			
					
				}
			}
		}
	}

	 
	public static void ImportIndustries()throws SQLException 
	{
		List idList = new ArrayList();
		List listvalue1 = new ArrayList();
		List idIndName = new ArrayList();
		List idInd = new ArrayList();
		System.out.println("ImportIndus");

		Connection con = null;
		PreparedStatement ps = null;
		ResultSet rs = null;

		try {
			con = ConnectionPool.getConnection();
			String _DELETE_ALL_IND = "DELETE FROM tbl_companies_industries";
			ps = con.prepareStatement(_DELETE_ALL_IND);

			ps.executeUpdate();
		}
		finally {
			ConnectionPool.cleanUp(con, ps);
		}
		
		
		try {
			con = ConnectionPool.getConnection();
			String selectIndTypeBulk = "SELECT _1, _38 FROM partnerdirectorytaball";
			ps = con.prepareStatement(selectIndTypeBulk);

			rs = ps.executeQuery();

			while (rs.next()) {
			idList.add(rs.getInt(1));
			listvalue1.add(rs.getString(2));
			}
		}
		finally {
			ConnectionPool.cleanUp(con, ps, rs);
		}

		//get the predifined values
		try {
			con = ConnectionPool.getConnection();
			String selectInd = "SELECT DISTINCT industryId, industry_name FROM tbl_industry_microvertical WHERE microvertical_name = ''";
			ps = con.prepareStatement(selectInd);

			rs = ps.executeQuery();

			while (rs.next()) {
				idInd.add(rs.getInt(1));
				idIndName.add(rs.getString(2));
			}
		}
		finally {
			ConnectionPool.cleanUp(con, ps, rs);
		}
		
		for (int i = 0; i < idList.size(); i++) {
			String value1 = (String)listvalue1.get(i);
			for (int j = 0; j < idIndName.size(); j++) {
				String value2 = (String)idIndName.get(j);
				System.out.println("Compare values " + value1 + " with  " +value2);
				if((value1 != null) &&  value1.indexOf(value2) >=0 )
				{
					int realndx = (Integer)idInd.get(j);
					
					//	add it to data base
					//get the predifined values
					try {
						con = ConnectionPool.getConnection();
	
						ps = con.prepareStatement(_ADD_COMPANYTOIND_ITEM);
	
						ps.setInt(1, (Integer)idList.get(i));
						ps.setInt(2, realndx);
						ps.executeUpdate();
					}
					finally {
						ConnectionPool.cleanUp(con, ps);
					}			
					
				}
			}
		}
	}

	public static void ImportCountryCoverage()throws SQLException 
	{
		List idList = new ArrayList();
		List listvalue1 = new ArrayList();
		List idCountryName = new ArrayList();
		List idCountry = new ArrayList();
		System.out.println("ImportCountryCov");

		Connection con = null;
		PreparedStatement ps = null;
		ResultSet rs = null;

		try {
			con = ConnectionPool.getConnection();
			String _DELETE_ALL_COV = "DELETE FROM tbl_companies_coverage";
			ps = con.prepareStatement(_DELETE_ALL_COV);

			ps.executeUpdate();
		}
		finally {
			ConnectionPool.cleanUp(con, ps);
		}
		
		
		try {
			con = ConnectionPool.getConnection();
			String selectCountryBulk = "SELECT _1, _30 FROM partnerdirectorytaball";
			ps = con.prepareStatement(selectCountryBulk);

			rs = ps.executeQuery();

			while (rs.next()) {
			idList.add(rs.getInt(1));
			listvalue1.add(rs.getString(2));
			}
		}
		finally {
			ConnectionPool.cleanUp(con, ps, rs);
		}

		//get the predifined values
		try {
			con = ConnectionPool.getConnection();
			String selectInd = "SELECT countryId, country_name FROM tbl_countries";
			ps = con.prepareStatement(selectInd);

			rs = ps.executeQuery();

			while (rs.next()) {
				idCountry.add(rs.getInt(1));
				idCountryName.add(rs.getString(2));
			}
		}
		finally {
			ConnectionPool.cleanUp(con, ps, rs);
		}
		
		for (int i = 0; i < idList.size(); i++) {
			String value1 = (String)listvalue1.get(i);
			for (int j = 0; j < idCountryName.size(); j++) {
				String value2 = (String)idCountryName.get(j);
				System.out.println("Compare values " + value1 + " with  " +value2);
				if((value1 != null) &&  value1.indexOf(value2) >=0 )
				{
					int realndx = (Integer)idCountry.get(j);
					
					//	add it to data base
					//get the predifined values
					try {
						con = ConnectionPool.getConnection();
	
						ps = con.prepareStatement(_ADD_COMPANYTOCOV_ITEM);
	
						ps.setInt(1, (Integer)idList.get(i));
						ps.setInt(2, realndx);
						ps.executeUpdate();
					}
					finally {
						ConnectionPool.cleanUp(con, ps);
					}			
					
				}
			}
		}
	}
	
		
	private static final String _ADD_COMPANYTOCOV_ITEM =
		"INSERT INTO tbl_companies_coverage (companyId, countryId) VALUES (?, ?)";
	private static final String _ADD_COMPANYTOIND_ITEM =
		"INSERT INTO tbl_companies_industries (companyId, industryId) VALUES (?, ?)";
	private static final String _ADD_COMPANYTOBUSINESSTYPE_ITEM =
		"INSERT INTO tbl_companies_businesstype (companyId, businesstypeId, type_) VALUES (?, ?, ?)";
	private static final String _ADD_COMPANYTOSAPSOL_ITEM =
		"INSERT INTO tbl_companies_sapsolution (companyId, sapsolutionId) VALUES (?, ?)";
	
}