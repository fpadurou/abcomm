/**
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

import java.lang.reflect.Array;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.Statement;
import java.sql.ResultSet;
import java.sql.SQLException;

import java.util.ArrayList;
import java.util.List;
import java.util.Date;

/**
 * <a href="SolutionImport.java.html"><b><i>View Source</i></b></a>
 *
 * @author  Florin Paduroiu
 *
 */
public class SolutionImport {

	public static void ImportSolutions()throws SQLException
	{
		if(false)
		{
			//ImportSolFocus(); //6 
			//ImportSolSAPAIO(); //7 
			//ImportSolSAPBOP(); //8 
			//ImportSolMaturity(); //9 
			//ImportSolIndustry(); //10 
			//ImportSolIndustryMV(); //11 
			ImportSolStatusByPartner(); //12 
			ImportSolStatusBySAP(); //13 
			//ImportSolCoverage(); //16 
			//ImportSolTargetSize(); //17 
			//ImportSolCategTarget(); //18 
			//ImportSolLangAvailable(); //19 
			//ImportSolMainCountryEur(); //35 
			//ImportSolUserType(); //46 
			//ImportSolProgLang(); //48 
			//ImportSolOS(); //49 
			//ImportSolAIOBased(); //54 
		}
	}
	
	public static void ImportSolFocus()throws SQLException{
		// 6
		String IMPORT_SOL_FOCUS = "update tbl_sol_directory, tbl_sol_solfocus, soldirectorytaball set tbl_sol_directory.solFocus = tbl_sol_solfocus.id where (soldirectorytaball.record_id = tbl_sol_directory.solId AND soldirectorytaball.sol_focus = tbl_sol_solfocus.solSolFocus )";

		Connection con = null;
		PreparedStatement ps = null;
		ResultSet rs = null;

		try {
			con = ConnectionPool.getConnection();
			ps = con.prepareStatement(IMPORT_SOL_FOCUS);

			ps.executeUpdate();
		}
		finally {
			ConnectionPool.cleanUp(con, ps);
		}

	}
	
	public static void ImportSolSAPAIO()throws SQLException{
		// 7
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
			String _DELETE_ALL_COV = "DELETE FROM tbl_sol_to_solsapallinone";
			ps = con.prepareStatement(_DELETE_ALL_COV);

			ps.executeUpdate();
		}
		finally {
			ConnectionPool.cleanUp(con, ps);
		}
		
		
		try {
			con = ConnectionPool.getConnection();
			String selectCountryBulk = "SELECT record_id, AIOVers FROM soldirectorytaball";
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
			String selectInd = "SELECT id, name FROM tbl_sol_sapallinone";
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
	
						ps = con.prepareStatement(_ADD_SOLTOAIO_ITEM);
	
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
	
	public static void ImportSolSAPBOP()throws SQLException{
		// 8
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
			String _DELETE_ALL_COV = "DELETE FROM tbl_sol_to_solsaponeproduct";
			ps = con.prepareStatement(_DELETE_ALL_COV);

			ps.executeUpdate();
		}
		finally {
			ConnectionPool.cleanUp(con, ps);
		}
		
		
		try {
			con = ConnectionPool.getConnection();
			String selectCountryBulk = "SELECT record_id, BOPVers FROM soldirectorytaball";
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
			String selectInd = "SELECT id, name FROM tbl_sol_saponeproduct";
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
	
						ps = con.prepareStatement(_ADD_SOLTOBOP_ITEM);
	
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
	
	public static void ImportSolMaturity()throws SQLException{
		// 9
		String IMPORT_SOL_MATURITY = "update tbl_sol_directory, tbl_sol_maturity, soldirectorytaball set tbl_sol_directory.solMaturity = tbl_sol_maturity.id where (soldirectorytaball.record_id = tbl_sol_directory.solId AND soldirectorytaball._9 = tbl_sol_maturity.name )";

		Connection con = null;
		PreparedStatement ps = null;
		ResultSet rs = null;

		try {
			con = ConnectionPool.getConnection();
			ps = con.prepareStatement(IMPORT_SOL_MATURITY);

			ps.executeUpdate();
		}
		finally {
			ConnectionPool.cleanUp(con, ps);
		}
	}
	
	public static void ImportSolIndustry()throws SQLException{
		// 10
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
			String _DELETE_ALL_COV = "DELETE FROM tbl_solution_industries";
			ps = con.prepareStatement(_DELETE_ALL_COV);

			ps.executeUpdate();
		}
		finally {
			ConnectionPool.cleanUp(con, ps);
		}
		
		
		try {
			con = ConnectionPool.getConnection();
			String selectCountryBulk = "SELECT record_id, ind FROM soldirectorytaball";
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
			String selectInd = "SELECT DISTINCT industryId, industry_name FROM tbl_industry_microvertical WHERE microvertical_name = ''";
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
	
						ps = con.prepareStatement(_ADD_SOLTOIND_ITEM);
	
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
	
	public static void ImportSolIndustryMV()throws SQLException{
		// 11
	}
	
	public static void ImportSolStatusByPartner()throws SQLException{
		// 12
		String IMPORT_SOL_STATUS_BY_PARTNER = "update tbl_sol_directory, tbl_sol_status_by_partner, soldirectorytaball set tbl_sol_directory.statusByProvider = tbl_sol_status_by_partner.id where (soldirectorytaball.record_id = tbl_sol_directory.solId AND soldirectorytaball._12 = tbl_sol_status_by_partner.name )";

		Connection con = null;
		PreparedStatement ps = null;
		ResultSet rs = null;

		try {
			con = ConnectionPool.getConnection();
			ps = con.prepareStatement(IMPORT_SOL_STATUS_BY_PARTNER);

			ps.executeUpdate();
		}
		finally {
			ConnectionPool.cleanUp(con, ps);
		}
	}
	
	public static void ImportSolStatusBySAP()throws SQLException{
		// 13
		String IMPORT_SOL_STATUS_BY_SAP = "update tbl_sol_directory, tbl_sol_status_by_sap, soldirectorytaball set tbl_sol_directory.statusBySAP = tbl_sol_status_by_sap.id where (soldirectorytaball.record_id = tbl_sol_directory.solId AND soldirectorytaball._13 = tbl_sol_status_by_sap.name )";

		Connection con = null;
		PreparedStatement ps = null;
		ResultSet rs = null;

		try {
			con = ConnectionPool.getConnection();
			ps = con.prepareStatement(IMPORT_SOL_STATUS_BY_SAP);

			ps.executeUpdate();
		}
		finally {
			ConnectionPool.cleanUp(con, ps);
		}
		
	}
	
	public static void ImportSolCoverage()throws SQLException{
		// 16
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
			String _DELETE_ALL_COV = "DELETE FROM tbl_solution_coverage";
			ps = con.prepareStatement(_DELETE_ALL_COV);

			ps.executeUpdate();
		}
		finally {
			ConnectionPool.cleanUp(con, ps);
		}
		
		
		try {
			con = ConnectionPool.getConnection();
			String selectCountryBulk = "SELECT record_id, coverage FROM soldirectorytaball";
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
	
						ps = con.prepareStatement(_ADD_SOLTOCOV_ITEM);
	
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
	
	
	public static void ImportSolTargetSize()throws SQLException{
		// 17
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
			String _DELETE_ALL_COV = "DELETE FROM tbl_sol_to_targetcompsize";
			ps = con.prepareStatement(_DELETE_ALL_COV);

			ps.executeUpdate();
		}
		finally {
			ConnectionPool.cleanUp(con, ps);
		}
		
		
		try {
			con = ConnectionPool.getConnection();
			String selectCountryBulk = "SELECT record_id, _17 FROM soldirectorytaball";
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
			String selectInd = "SELECT id, name FROM tbl_target_comp_size";
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
	
						ps = con.prepareStatement(_ADD_SOLTOTARGETCOMPSIZE_ITEM);
	
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
	
	public static void ImportSolCategTarget()throws SQLException{
		// 18
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
			String _DELETE_ALL_COV = "DELETE FROM tbl_sol_to_solcategtarget";
			ps = con.prepareStatement(_DELETE_ALL_COV);

			ps.executeUpdate();
		}
		finally {
			ConnectionPool.cleanUp(con, ps);
		}
		
		
		try {
			con = ConnectionPool.getConnection();
			String selectCountryBulk = "SELECT record_id, _18 FROM soldirectorytaball";
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
			String selectInd = "SELECT id, name FROM tbl_sol_categ_target";
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
	
						ps = con.prepareStatement(_ADD_SOLTOSOLCATEGTARGET_ITEM);
	
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
	
	public static void ImportSolLangAvailable()throws SQLException{
		// 19
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
			String _DELETE_ALL_COV = "DELETE FROM tbl_sol_to_langavailable";
			ps = con.prepareStatement(_DELETE_ALL_COV);

			ps.executeUpdate();
		}
		finally {
			ConnectionPool.cleanUp(con, ps);
		}
		
		
		try {
			con = ConnectionPool.getConnection();
			String selectCountryBulk = "SELECT record_id, lang FROM soldirectorytaball";
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
			String selectInd = "SELECT id, name FROM tbl_lang_available";
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
	
						ps = con.prepareStatement(_ADD_SOLTOLANGAVAILABLE_ITEM);
	
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
	
	public static void ImportSolMainCountryEur()throws SQLException{
		// 35
		String IMPORT_SOL_COUNTRY_EURO = "update tbl_sol_directory, tbl_countries, soldirectorytaball set tbl_sol_directory.countryPriceEuro = tbl_countries.countryId where (soldirectorytaball.record_id = tbl_sol_directory.solId AND soldirectorytaball._35 = tbl_countries.country_name )";

		Connection con = null;
		PreparedStatement ps = null;
		ResultSet rs = null;

		try {
			con = ConnectionPool.getConnection();
			ps = con.prepareStatement(IMPORT_SOL_COUNTRY_EURO);

			ps.executeUpdate();
		}
		finally {
			ConnectionPool.cleanUp(con, ps);
		}

	}
	
	public static void ImportSolUserType()throws SQLException{
		//46 
		String IMPORT_SOL_USER_TYPE = "update tbl_sol_directory, tbl_user_type, soldirectorytaball set tbl_sol_directory.solUserType = tbl_user_type.id where (soldirectorytaball.record_id = tbl_sol_directory.solId AND soldirectorytaball._46 = tbl_user_type.name )";

		Connection con = null;
		PreparedStatement ps = null;
		ResultSet rs = null;

		try {
			con = ConnectionPool.getConnection();
			ps = con.prepareStatement(IMPORT_SOL_USER_TYPE);

			ps.executeUpdate();
		}
		finally {
			ConnectionPool.cleanUp(con, ps);
		}
		
	}

	public static void ImportSolProgLang()throws SQLException{
		//48 
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
			String _DELETE_ALL_COV = "DELETE FROM tbl_sol_to_proglang";
			ps = con.prepareStatement(_DELETE_ALL_COV);

			ps.executeUpdate();
		}
		finally {
			ConnectionPool.cleanUp(con, ps);
		}
		
		
		try {
			con = ConnectionPool.getConnection();
			String selectCountryBulk = "SELECT record_id, _48 FROM soldirectorytaball";
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
			String selectInd = "SELECT id, name FROM tbl_prog_lang";
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
	
						ps = con.prepareStatement(_ADD_SOLTOSOLPROGLANG_ITEM);
	
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
	
	public static void ImportSolOS()throws SQLException{
		//49 
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
			String _DELETE_ALL_COV = "DELETE FROM tbl_sol_to_os";
			ps = con.prepareStatement(_DELETE_ALL_COV);

			ps.executeUpdate();
		}
		finally {
			ConnectionPool.cleanUp(con, ps);
		}
		
		
		try {
			con = ConnectionPool.getConnection();
			String selectCountryBulk = "SELECT record_id, _49 FROM soldirectorytaball";
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
			String selectInd = "SELECT id, name FROM tbl_os";
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
	
						ps = con.prepareStatement(_ADD_SOLTOSOLOS_ITEM);
	
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
	
	public static void ImportSolAIOBased()throws SQLException{
		//54 
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
			String _DELETE_ALL_COV = "DELETE FROM tbl_sol_to_solaiobased";
			ps = con.prepareStatement(_DELETE_ALL_COV);

			ps.executeUpdate();
		}
		finally {
			ConnectionPool.cleanUp(con, ps);
		}
		
		
		try {
			con = ConnectionPool.getConnection();
			String selectCountryBulk = "SELECT record_id, _54 FROM soldirectorytaball";
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
			String selectInd = "SELECT id, name FROM tbl_sol_aio_based";
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
	
						ps = con.prepareStatement(_ADD_SOLTOSOLAIOBASED_ITEM);
	
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
	
	
	private static final String _ADD_SOLTOCOV_ITEM =
		"INSERT INTO tbl_solution_coverage (solutionId, countryId) VALUES (?, ?)";

	private static final String _ADD_SOLTOLANGAVAILABLE_ITEM = 
		"INSERT INTO tbl_sol_to_langavailable (solutionId, id) VALUES (?, ?)";

	private static final String _ADD_SOLTOAIO_ITEM =
		"INSERT INTO tbl_sol_to_solsapallinone (solutionId, id) VALUES (?, ?)";

	private static final String _ADD_SOLTOBOP_ITEM =
		"INSERT INTO tbl_sol_to_solsaponeproduct (solutionId, id) VALUES (?, ?)";
	
	private static final String _ADD_SOLTOIND_ITEM = 
		"INSERT INTO tbl_solution_industries (solutionId, industryId) VALUES (?, ?)";
	
	private static final String _ADD_SOLTOTARGETCOMPSIZE_ITEM = 
		"INSERT INTO tbl_sol_to_targetcompsize (solutionId, id) VALUES (?, ?)";
	
	private static final String _ADD_SOLTOSOLCATEGTARGET_ITEM = 
		"INSERT INTO tbl_sol_to_solcategtarget (solutionId, id) VALUES (?, ?)";
	
	private static final String _ADD_SOLTOSOLPROGLANG_ITEM = 
		"INSERT INTO tbl_sol_to_proglang (solutionId, id) VALUES (?, ?)";

	private static final String _ADD_SOLTOSOLOS_ITEM = 
		"INSERT INTO tbl_sol_to_os (solutionId, id) VALUES (?, ?)";

	private static final String _ADD_SOLTOSOLAIOBASED_ITEM = 
		"INSERT INTO tbl_sol_to_solaiobased (solutionId, id) VALUES (?, ?)";
			
}