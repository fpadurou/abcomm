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

package com.sample.searchsolution.model;

import com.sample.searchsolution.util.ConnectionPool;

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
 * <a href="SolutionUtil.java.html"><b><i>View Source</i></b></a>
 *
 * @author  Florin Paduroiu
 *
 */
public class SolutionUtil {

	public static List YesNoList() {
		List YN = new ArrayList();
		YN.add("Yes");
		YN.add("No");
		return YN;
	}
	
	public static int getSolFocusIdByName(String name)throws SQLException 
	{
		Connection con = null;
		PreparedStatement ps = null;
		ResultSet rs = null;
		int id = 0;
		if((name == null) || (name.isEmpty()))
			return id;
				
		try {
			con = ConnectionPool.getConnection();
			String _GET_SOLSOLFOCUS_ID = "SELECT id FROM tbl_sol_solfocus WHERE solSolFocus = ?";
			ps = con.prepareStatement(_GET_SOLSOLFOCUS_ID);
			ps.setString(1, name);
			rs = ps.executeQuery();

			if (rs.next()) {
				id = rs.getInt(1);
			}
		}
		finally {
			ConnectionPool.cleanUp(con, ps, rs);
		}

		return id;
	}
	
	public static List getSolSapSol()throws SQLException {
		List list = new ArrayList();
			
		Connection con = null;
		PreparedStatement ps = null;
		ResultSet rs = null;
		
		try {
			con = ConnectionPool.getConnection();
			String _GET_SOL_SOLFOCUS = "SELECT solSolFocus FROM tbl_sol_solfocus ";
			ps = con.prepareStatement(_GET_SOL_SOLFOCUS);
			rs = ps.executeQuery();

			while (rs.next()) {
				list.add(rs.getString(1));
			}
		}
		finally {
			ConnectionPool.cleanUp(con, ps, rs);
		}

		return list;	
	}
	
	public static String getSolutionPartnerName(SolutionItem solutionItem) throws SQLException {
		List list = new ArrayList();
		String value = "";
		int id = 0;
		if(solutionItem != null)
			id = solutionItem.companyId;
			
		Connection con = null;
		PreparedStatement ps = null;
		ResultSet rs = null;
		String querry = "SELECT companyName FROM tbl_company WHERE companyId = ?";

		
		try {
			con = ConnectionPool.getConnection();

			ps = con.prepareStatement(querry);
			ps.setInt(1, id);
			rs = ps.executeQuery();

			if (rs.next()) {
				value = rs.getString(1);
			}
		}
		finally {
			ConnectionPool.cleanUp(con, ps, rs);
		}

		return value;
	}
	
	public static String getSolutionSolFocus(SolutionItem solutionItem) throws SQLException {
		List list = new ArrayList();
		String solutionSapSolutions = "";
		int id = 0;
		if(solutionItem != null)
			id = solutionItem.solFocus;
			
		Connection con = null;
		PreparedStatement ps = null;
		ResultSet rs = null;
		
		try {
			con = ConnectionPool.getConnection();

			ps = con.prepareStatement(_GET_SOLUTION_SOL_FOCUS);
			ps.setInt(1, id);
			rs = ps.executeQuery();

			if (rs.next()) {
				solutionSapSolutions = rs.getString(1);
			}
		}
		finally {
			ConnectionPool.cleanUp(con, ps, rs);
		}

		return solutionSapSolutions;
	}	

	public static List getMySAPAllInOneVersions() throws SQLException {
		List list = new ArrayList();
			
		Connection con = null;
		PreparedStatement ps = null;
		ResultSet rs = null;
		
		try {
			con = ConnectionPool.getConnection();

			String _GET_MYSAPALLINONE_VERISON ="SELECT name FROM tbl_sol_sapallinone ";
			ps = con.prepareStatement(_GET_MYSAPALLINONE_VERISON);
			rs = ps.executeQuery();

			while (rs.next()) {
				list.add(rs.getString(1));
			}
		}
		finally {
			ConnectionPool.cleanUp(con, ps, rs);
		}

		return list;

	}
	
	public static List getSolutionMySAPAllInOneVersions(SolutionItem solutionItem) throws SQLException {
		List list = new ArrayList();
		long solutionId = 0;
		if(solutionItem != null)
			solutionId = solutionItem.getId();
			
		Connection con = null;
		PreparedStatement ps = null;
		ResultSet rs = null;
		
		try {
			con = ConnectionPool.getConnection();

			ps = con.prepareStatement(_GET_SOL_MYSAPALLINONE_VERSION);
			ps.setLong(1, solutionId);
			rs = ps.executeQuery();

			while (rs.next()) {
				list.add(rs.getString(1));
			}
		}
		finally {
			ConnectionPool.cleanUp(con, ps, rs);
		}

		return list;

	}	

	public static List getMySAPOneProductVersions() throws SQLException {
		List list = new ArrayList();
			
		Connection con = null;
		PreparedStatement ps = null;
		ResultSet rs = null;
		
		try {
			con = ConnectionPool.getConnection();

			String _GET_MYSAPONEPRODUCT_VERISON ="SELECT name FROM tbl_sol_saponeproduct ";
			ps = con.prepareStatement(_GET_MYSAPONEPRODUCT_VERISON);
			rs = ps.executeQuery();

			while (rs.next()) {
				list.add(rs.getString(1));
			}
		}
		finally {
			ConnectionPool.cleanUp(con, ps, rs);
		}

		return list;

	}

	public static List getSolutionSAPOneProductVersions(SolutionItem solutionItem) throws SQLException {
		List list = new ArrayList();
		long solutionId = 0;
		if(solutionItem != null)
			solutionId = solutionItem.getId();
			
		Connection con = null;
		PreparedStatement ps = null;
		ResultSet rs = null;
		
		try {
			con = ConnectionPool.getConnection();

			ps = con.prepareStatement(_GET_SOL_SAPONEPRODUCT_VERSION);
			ps.setLong(1, solutionId);
			rs = ps.executeQuery();

			while (rs.next()) {
				list.add(rs.getString(1));
			}
		}
		finally {
			ConnectionPool.cleanUp(con, ps, rs);
		}

		return list;

	}	
	
	public static int getMaturityIdByName(String name) throws SQLException {
		Connection con = null;
		PreparedStatement ps = null;
		ResultSet rs = null;
		int id = 0;
		if((name == null) || (name.isEmpty()))
			return id;
				
		try {
			con = ConnectionPool.getConnection();
			String _GET_MATURITY_ID = "SELECT id FROM tbl_sol_maturity WHERE name = ?";
			ps = con.prepareStatement(_GET_MATURITY_ID);
			ps.setString(1, name);
			rs = ps.executeQuery();

			if (rs.next()) {
				id = rs.getInt(1);
			}
		}
		finally {
			ConnectionPool.cleanUp(con, ps, rs);
		}

		return id;
	}	

	public static List getMaturity() throws SQLException {
		List list = new ArrayList();
		Connection con = null;
		PreparedStatement ps = null;
		ResultSet rs = null;
		
		try {
			con = ConnectionPool.getConnection();
			String _GET_MATURITY = "SELECT name FROM tbl_sol_maturity ";	
			ps = con.prepareStatement(_GET_MATURITY);
			rs = ps.executeQuery();

			while (rs.next()) {
				list.add(rs.getString(1));
			}
		}
		finally {
			ConnectionPool.cleanUp(con, ps, rs);
		}

		return list;
	}	
	
	public static String getSolMaturity(SolutionItem solutionItem) throws SQLException {
		String value = "";
		int id = solutionItem.solMaturity ;
		if(id <=0 )
			return value;

		Connection con = null;
		PreparedStatement ps = null;
		ResultSet rs = null;
		
		try {
			con = ConnectionPool.getConnection();

			ps = con.prepareStatement(_GET_SOL_MATURITY);
			ps.setLong(1, id);
			rs = ps.executeQuery();

			if (rs.next()) {
				value = rs.getString(1);
			}
		}
		finally {
			ConnectionPool.cleanUp(con, ps, rs);
		}

		return value;
	}
	
	public static List getSolutionIndustries(SolutionItem solutionItem) throws SQLException {
		List list = new ArrayList();
		long solutionId = 0;
		if(solutionItem != null)
			solutionId = solutionItem.getId();
			
		Connection con = null;
		PreparedStatement ps = null;
		ResultSet rs = null;
		
		try {
			con = ConnectionPool.getConnection();

			ps = con.prepareStatement(_GET_SOLUTION_INDUSTRIES);
			ps.setLong(1, solutionId);
			rs = ps.executeQuery();

			while (rs.next()) {
				list.add(rs.getString(1));
			}
		}
		finally {
			ConnectionPool.cleanUp(con, ps, rs);
		}

		return list;

	}	

	public static String getSolutionIndustriesString(SolutionItem solutionItem) throws SQLException {
		String value = "";
		long solutionId = 0;
		if(solutionItem != null)
			solutionId = solutionItem.getId();
			
		Connection con = null;
		PreparedStatement ps = null;
		ResultSet rs = null;
		
		try {
			con = ConnectionPool.getConnection();

			ps = con.prepareStatement(_GET_SOLUTION_INDUSTRIES);
			ps.setLong(1, solutionId);
			rs = ps.executeQuery();

			while (rs.next()) {
				value = value + rs.getString(1) + ", ";
			}
		}
		finally {
			ConnectionPool.cleanUp(con, ps, rs);
		}

		return value;

	}	
	
	public static int getStatusByProviderIdByName(String name)throws SQLException {
		Connection con = null;
		PreparedStatement ps = null;
		ResultSet rs = null;
		int id = 0;
		if((name == null) || (name.isEmpty()))
			return id;
				
		try {
			con = ConnectionPool.getConnection();
			String _GET_STATUS_BY_PROVIDER_ID = "SELECT id FROM tbl_sol_status_by_partner WHERE name = ?";
			ps = con.prepareStatement(_GET_STATUS_BY_PROVIDER_ID);
			ps.setString(1, name);
			rs = ps.executeQuery();

			if (rs.next()) {
				id = rs.getInt(1);
			}
		}
		finally {
			ConnectionPool.cleanUp(con, ps, rs);
		}

		return id;
	}
	
	
	public static List getStatusByProvider() throws SQLException {
		List list = new ArrayList();

		Connection con = null;
		PreparedStatement ps = null;
		ResultSet rs = null;
		
		try {
			con = ConnectionPool.getConnection();
			String _GET_STATUS_BY_PROVIDER = "SELECT name FROM tbl_sol_status_by_partner";
			ps = con.prepareStatement(_GET_STATUS_BY_PROVIDER);
			rs = ps.executeQuery();

			while(rs.next()) {
				list.add(rs.getString(1));
			}
		}
		finally {
			ConnectionPool.cleanUp(con, ps, rs);
		}

		return list;
	}

	
	public static String getSolStatusByProvider(SolutionItem solutionItem) throws SQLException {
		String value = "";
		int id = solutionItem.statusByProvider;
		if(id <=0 )
			return value;

		Connection con = null;
		PreparedStatement ps = null;
		ResultSet rs = null;
		
		try {
			con = ConnectionPool.getConnection();

			ps = con.prepareStatement(_GET_SOL_STATUS_BY_PROVIDER);
			ps.setInt(1, id);
			rs = ps.executeQuery();

			if (rs.next()) {
				value = rs.getString(1);
			}
		}
		finally {
			ConnectionPool.cleanUp(con, ps, rs);
		}

		return value;
	}
	
	public static int getStatusBySAPIdByName(String name)	 throws SQLException {
		Connection con = null;
		PreparedStatement ps = null;
		ResultSet rs = null;
		int id = 0;
		if((name == null) || (name.isEmpty()))
			return id;
				
		try {
			con = ConnectionPool.getConnection();
			String _GET_STATUS_BY_SAP_ID = "SELECT id FROM tbl_sol_status_by_sap WHERE name = ?";
			ps = con.prepareStatement(_GET_STATUS_BY_SAP_ID);
			ps.setString(1, name);
			rs = ps.executeQuery();

			if (rs.next()) {
				id = rs.getInt(1);
			}
		}
		finally {
			ConnectionPool.cleanUp(con, ps, rs);
		}

		return id;
	}
	
	public static List getStatusBySAP() throws SQLException {
		List list = new ArrayList();

		Connection con = null;
		PreparedStatement ps = null;
		ResultSet rs = null;
		
		try {
			con = ConnectionPool.getConnection();
			String _GET_STATUS_BY_SAP = "SELECT name FROM tbl_sol_status_by_sap ";
			ps = con.prepareStatement(_GET_STATUS_BY_SAP);
			rs = ps.executeQuery();

			while(rs.next()) {
				list.add(rs.getString(1));
			}
		}
		finally {
			ConnectionPool.cleanUp(con, ps, rs);
		}

		return list;
	}

	public static String getSolStatusBySAP(SolutionItem solutionItem) throws SQLException {
		String value = "";
		int id = solutionItem.statusBySAP;
		if(id <=0 )
			return value;

		Connection con = null;
		PreparedStatement ps = null;
		ResultSet rs = null;
		
		try {
			con = ConnectionPool.getConnection();

			ps = con.prepareStatement(_GET_SOL_STATUS_BY_SAP);
			ps.setInt(1, id);
			rs = ps.executeQuery();

			if (rs.next()) {
				value = rs.getString(1);
			}
		}
		finally {
			ConnectionPool.cleanUp(con, ps, rs);
		}

		return value;
	}
	
	
	public static String getSolutionCountryCoverageString(SolutionItem solutionItem) throws SQLException {
		List list = new ArrayList();
		String strCoverage = "";
		long solutionId = 0;
		if(solutionItem != null)
			solutionId = solutionItem.getId();
			
		Connection con = null;
		PreparedStatement ps = null;
		ResultSet rs = null;
		
		try {
			con = ConnectionPool.getConnection();

			ps = con.prepareStatement(_GET_SOLUTION_COVERAGE);
			ps.setLong(1, solutionId);
			rs = ps.executeQuery();

			while (rs.next()) {
				strCoverage = strCoverage + rs.getString(1) + ", ";
			}
		}
		finally {
			ConnectionPool.cleanUp(con, ps, rs);
		}

		return strCoverage;

	}		
	
	public static int getCountryIdByName(String name)throws SQLException {
		Connection con = null;
		PreparedStatement ps = null;
		ResultSet rs = null;
		int id = 0;
		if((name == null) || (name.isEmpty()))
			return id;
				
		try {
			con = ConnectionPool.getConnection();
			String _GET_COUNTRY_ID_BY_NAME = "SELECT countryId FROM tbl_countries WHERE country_name = ?";
			ps = con.prepareStatement(_GET_COUNTRY_ID_BY_NAME);
			ps.setString(1, name);
			rs = ps.executeQuery();

			if (rs.next()) {
				id = rs.getInt(1);
			}
		}
		finally {
			ConnectionPool.cleanUp(con, ps, rs);
		}

		return id;
		
	}

	
	public static List getSolutionCountryCoverage(SolutionItem solutionItem) throws SQLException {
		List list = new ArrayList();
		long solutionId = 0;
		if(solutionItem != null)
			solutionId = solutionItem.getId();
			
		Connection con = null;
		PreparedStatement ps = null;
		ResultSet rs = null;
		
		try {
			con = ConnectionPool.getConnection();

			ps = con.prepareStatement(_GET_SOLUTION_COVERAGE);
			ps.setLong(1, solutionId);
			rs = ps.executeQuery();

			while (rs.next()) {
				list.add(rs.getString(1));
			}
		}
		finally {
			ConnectionPool.cleanUp(con, ps, rs);
		}

		return list;

	}			
	
	public static String getTargetCompanySizeString(SolutionItem solutionItem) throws SQLException {
		String strCoverage = "";
		long solutionId = 0;
		if(solutionItem != null)
			solutionId = solutionItem.getId();
			
		Connection con = null;
		PreparedStatement ps = null;
		ResultSet rs = null;
		
		try {
			con = ConnectionPool.getConnection();

			ps = con.prepareStatement(_GET_TARGET_COMP_SIZE);
			ps.setLong(1, solutionId);
			rs = ps.executeQuery();

			while (rs.next()) {
				strCoverage = strCoverage + rs.getString(1) + ", ";
			}
		}
		finally {
			ConnectionPool.cleanUp(con, ps, rs);
		}

		return strCoverage;

	}		
	
	public static List getTargetCompanySize() throws SQLException {
		List list = new ArrayList();
			
		Connection con = null;
		PreparedStatement ps = null;
		ResultSet rs = null;
		
		try {
			con = ConnectionPool.getConnection();

			String _GET_TARGET_COMP_SIZE_ALL = "Select name FROM tbl_target_comp_size ";
			ps = con.prepareStatement(_GET_TARGET_COMP_SIZE_ALL);
			rs = ps.executeQuery();

			while (rs.next()) {
				list.add(rs.getString(1));
			}
		}
		finally {
			ConnectionPool.cleanUp(con, ps, rs);
		}

		return list;

	}		

	public static List getSolTargetCompanySize(SolutionItem solutionItem) throws SQLException {
		List list = new ArrayList();
		long solutionId = 0;
		if(solutionItem != null)
			solutionId = solutionItem.getId();
			
		Connection con = null;
		PreparedStatement ps = null;
		ResultSet rs = null;
		
		try {
			con = ConnectionPool.getConnection();

			ps = con.prepareStatement(_GET_TARGET_COMP_SIZE);
			ps.setLong(1, solutionId);
			rs = ps.executeQuery();

			while (rs.next()) {
				list.add(rs.getString(1));
			}
		}
		finally {
			ConnectionPool.cleanUp(con, ps, rs);
		}

		return list;

	}		

	public static List getSolutionCategTarget(SolutionItem solutionItem) throws SQLException {
		List list = new ArrayList();
		long solutionId = 0;
		if(solutionItem != null)
			solutionId = solutionItem.getId();
			
		Connection con = null;
		PreparedStatement ps = null;
		ResultSet rs = null;
		
		try {
			con = ConnectionPool.getConnection();

			ps = con.prepareStatement(_GET_SOLUTION_CATEG_TARGET);
			ps.setLong(1, solutionId);
			rs = ps.executeQuery();

			while (rs.next()) {
				list.add(rs.getString(1));
			}
		}
		finally {
			ConnectionPool.cleanUp(con, ps, rs);
		}

		return list;

	}		

	public static List getCategTarget() throws SQLException {
		List list = new ArrayList();
			
		Connection con = null;
		PreparedStatement ps = null;
		ResultSet rs = null;
		
		try {
			con = ConnectionPool.getConnection();
			String _GET_CATEG_TARGET_ALL = "SELECT name FROM tbl_sol_categ_target ";
			ps = con.prepareStatement(_GET_CATEG_TARGET_ALL);
			rs = ps.executeQuery();

			while (rs.next()) {
				list.add(rs.getString(1));
			}
		}
		finally {
			ConnectionPool.cleanUp(con, ps, rs);
		}

		return list;

	}			
	
	public static String getSolutionCategTargetString(SolutionItem solutionItem) throws SQLException {
		List list = new ArrayList();
		String strCoverage = "";
		long solutionId = 0;
		if(solutionItem != null)
			solutionId = solutionItem.getId();
			
		Connection con = null;
		PreparedStatement ps = null;
		ResultSet rs = null;
		
		try {
			con = ConnectionPool.getConnection();

			ps = con.prepareStatement(_GET_SOLUTION_CATEG_TARGET);
			ps.setLong(1, solutionId);
			rs = ps.executeQuery();

			while (rs.next()) {
				strCoverage = strCoverage + rs.getString(1) + ", ";
			}
		}
		finally {
			ConnectionPool.cleanUp(con, ps, rs);
		}

		return strCoverage;

	}		

	public static List getLangAvailable() throws SQLException {
		List list = new ArrayList();
			
		Connection con = null;
		PreparedStatement ps = null;
		ResultSet rs = null;
		
		try {
			con = ConnectionPool.getConnection();
			String _GET_SOLUTION_LANG_AVAILABLE_ALL = "SELECT name FROM tbl_lang_available ";
			ps = con.prepareStatement(_GET_SOLUTION_LANG_AVAILABLE_ALL);
			rs = ps.executeQuery();

			while (rs.next()) {
				list.add(rs.getString(1));
			}
		}
		finally {
			ConnectionPool.cleanUp(con, ps, rs);
		}

		return list;
	}		

	public static String getSolutionLangAvailableString(SolutionItem solutionItem) throws SQLException {
		List list = new ArrayList();
		String strCoverage = "";
		long solutionId = 0;
		if(solutionItem != null)
			solutionId = solutionItem.getId();
			
		Connection con = null;
		PreparedStatement ps = null;
		ResultSet rs = null;
		
		try {
			con = ConnectionPool.getConnection();

			ps = con.prepareStatement(_GET_SOLUTION_LANG_AVAILABLE);
			ps.setLong(1, solutionId);
			rs = ps.executeQuery();

			while (rs.next()) {
				strCoverage = strCoverage + rs.getString(1) + ", ";
			}
		}
		finally {
			ConnectionPool.cleanUp(con, ps, rs);
		}

		return strCoverage;

	}		

	public static List getSolutionLangAvailable(SolutionItem solutionItem) throws SQLException {
		List list = new ArrayList();
		long solutionId = 0;
		if(solutionItem != null)
			solutionId = solutionItem.getId();
			
		Connection con = null;
		PreparedStatement ps = null;
		ResultSet rs = null;
		
		try {
			con = ConnectionPool.getConnection();

			ps = con.prepareStatement(_GET_SOLUTION_LANG_AVAILABLE);
			ps.setLong(1, solutionId);
			rs = ps.executeQuery();

			while (rs.next()) {
				list.add(rs.getString(1));
			}
		}
		finally {
			ConnectionPool.cleanUp(con, ps, rs);
		}

		return list;

	}		
	
	public static int getUserTypeIdByName(String name)throws SQLException {
		Connection con = null;
		PreparedStatement ps = null;
		ResultSet rs = null;
		int id = 0;
		if((name == null) || (name.isEmpty()))
			return id;
				
		try {
			con = ConnectionPool.getConnection();
			String _GET_USER_TYPE_ID = "SELECT id FROM tbl_user_type WHERE name = ?";
			ps = con.prepareStatement(_GET_USER_TYPE_ID);
			ps.setString(1, name);
			rs = ps.executeQuery();

			if (rs.next()) {
				id = rs.getInt(1);
			}
		}
		finally {
			ConnectionPool.cleanUp(con, ps, rs);
		}

		return id;
		
	}
	
	public static List getSolUserType() throws SQLException {
		List list = new ArrayList();

		Connection con = null;
		PreparedStatement ps = null;
		ResultSet rs = null;
		
		try {
			con = ConnectionPool.getConnection();
			String _GET_USER_TYPE = "SELECT name FROM tbl_user_type ";
			ps = con.prepareStatement(_GET_USER_TYPE);
			rs = ps.executeQuery();

			while (rs.next()) {
				list.add(rs.getString(1));
			}
		}
		finally {
			ConnectionPool.cleanUp(con, ps, rs);
		}

		return list;
	}
	
	public static String getSolUserType(SolutionItem solutionItem) throws SQLException {
		String value = "";
		long id = solutionItem.solUserType;
		if(id <=0 )
			return value;

		Connection con = null;
		PreparedStatement ps = null;
		ResultSet rs = null;
		
		try {
			con = ConnectionPool.getConnection();

			ps = con.prepareStatement(_GET_SOL_USER_TYPE);
			ps.setLong(1, id);
			rs = ps.executeQuery();

			if (rs.next()) {
				value = rs.getString(1);
			}
		}
		finally {
			ConnectionPool.cleanUp(con, ps, rs);
		}

		return value;
	}

	public static String getSolCountryEur(SolutionItem solutionItem) throws SQLException {
		String value = "";
		long id = solutionItem.countryPriceEuro;
		if(id <=0 )
			return value;

		Connection con = null;
		PreparedStatement ps = null;
		ResultSet rs = null;
		
		try {
			con = ConnectionPool.getConnection();

			ps = con.prepareStatement(_GET_SOL_COUNTRY_EUR);
			ps.setLong(1, id);
			rs = ps.executeQuery();

			if (rs.next()) {
				value = rs.getString(1);
			}
		}
		finally {
			ConnectionPool.cleanUp(con, ps, rs);
		}

		return value;
	}
	
	public static List getProgLang() throws SQLException {
		List list = new ArrayList();
			
		Connection con = null;
		PreparedStatement ps = null;
		ResultSet rs = null;
		
		try {
			con = ConnectionPool.getConnection();
			String _GET_SOLUTION_PROG_LANG_ALL = "SELECT name FROM tbl_prog_lang ";
			ps = con.prepareStatement(_GET_SOLUTION_PROG_LANG_ALL);
			rs = ps.executeQuery();

			while (rs.next()) {
				list.add(rs.getString(1));
			}
		}
		finally {
			ConnectionPool.cleanUp(con, ps, rs);
		}

		return list;

	}		
	
	public static List getSolutionProgLang(SolutionItem solutionItem) throws SQLException {
		List list = new ArrayList();
		long solutionId = 0;
		if(solutionItem != null)
			solutionId = solutionItem.getId();
			
		Connection con = null;
		PreparedStatement ps = null;
		ResultSet rs = null;
		
		try {
			con = ConnectionPool.getConnection();

			ps = con.prepareStatement(_GET_SOLUTION_PROG_LANG);
			ps.setLong(1, solutionId);
			rs = ps.executeQuery();

			while (rs.next()) {
				list.add(rs.getString(1));
			}
		}
		finally {
			ConnectionPool.cleanUp(con, ps, rs);
		}

		return list;

	}	
	
	public static String getSolutionProgLangString(SolutionItem solutionItem) throws SQLException {
		List list = new ArrayList();
		String strCoverage = "";
		long solutionId = 0;
		if(solutionItem != null)
			solutionId = solutionItem.getId();
			
		Connection con = null;
		PreparedStatement ps = null;
		ResultSet rs = null;
		
		try {
			con = ConnectionPool.getConnection();

			ps = con.prepareStatement(_GET_SOLUTION_PROG_LANG);
			ps.setLong(1, solutionId);
			rs = ps.executeQuery();

			while (rs.next()) {
				strCoverage = strCoverage + rs.getString(1) + ", ";
			}
		}
		finally {
			ConnectionPool.cleanUp(con, ps, rs);
		}

		return strCoverage;

	}			
	
	public static List getOS() throws SQLException {
		List list = new ArrayList();
			
		Connection con = null;
		PreparedStatement ps = null;
		ResultSet rs = null;
		
		try {
			con = ConnectionPool.getConnection();
			String _GET_SOLUTION_OS_ALL = "SELECT name FROM tbl_os ";
			ps = con.prepareStatement(_GET_SOLUTION_OS_ALL);
			rs = ps.executeQuery();

			while (rs.next()) {
				list.add(rs.getString(1));
			}
		}
		finally {
			ConnectionPool.cleanUp(con, ps, rs);
		}

		return list;

	}			


	public static String getSolutionOSString(SolutionItem solutionItem) throws SQLException {
		List list = new ArrayList();
		String strCoverage = "";
		long solutionId = 0;
		if(solutionItem != null)
			solutionId = solutionItem.getId();
			
		Connection con = null;
		PreparedStatement ps = null;
		ResultSet rs = null;
		
		try {
			con = ConnectionPool.getConnection();

			ps = con.prepareStatement(_GET_SOLUTION_OS);
			ps.setLong(1, solutionId);
			rs = ps.executeQuery();

			while (rs.next()) {
				strCoverage = strCoverage + rs.getString(1) + ", ";
			}
		}
		finally {
			ConnectionPool.cleanUp(con, ps, rs);
		}

		return strCoverage;

	}			
	
	public static List getSolutionOS(SolutionItem solutionItem) throws SQLException {
		List list = new ArrayList();
		long solutionId = 0;
		if(solutionItem != null)
			solutionId = solutionItem.getId();
			
		Connection con = null;
		PreparedStatement ps = null;
		ResultSet rs = null;
		
		try {
			con = ConnectionPool.getConnection();

			ps = con.prepareStatement(_GET_SOLUTION_OS);
			ps.setLong(1, solutionId);
			rs = ps.executeQuery();

			while (rs.next()) {
				list.add(rs.getString(1));
			}
		}
		finally {
			ConnectionPool.cleanUp(con, ps, rs);
		}

		return list;

	}			

	public static List getMySAPAllInOneBased() throws SQLException {
		List list = new ArrayList();
			
		Connection con = null;
		PreparedStatement ps = null;
		ResultSet rs = null;
		
		try {
			con = ConnectionPool.getConnection();
			String _GET_SAP_ALLINONE_ALL = "SELECT name FROM tbl_sol_aio_based";
			ps = con.prepareStatement(_GET_SAP_ALLINONE_ALL);
			rs = ps.executeQuery();

			while (rs.next()) {
				list.add(rs.getString(1));
			}
		}
		finally {
			ConnectionPool.cleanUp(con, ps, rs);
		}

		return list;

	}		
	
	public static String getSolutionMySAPAllInOneBasedString(SolutionItem solutionItem) throws SQLException {
		List list = new ArrayList();
		String strCoverage = "";
		long solutionId = 0;
		if(solutionItem != null)
			solutionId = solutionItem.getId();
			
		Connection con = null;
		PreparedStatement ps = null;
		ResultSet rs = null;
		
		try {
			con = ConnectionPool.getConnection();

			ps = con.prepareStatement(_GET_SOLUTION_SAP_ALLINONE_BASED);
			ps.setLong(1, solutionId);
			rs = ps.executeQuery();

			while (rs.next()) {
				strCoverage = strCoverage + rs.getString(1) + ", ";
			}
		}
		finally {
			ConnectionPool.cleanUp(con, ps, rs);
		}

		return strCoverage;

	}			

	public static List getSolutionMySAPAllInOneBased(SolutionItem solutionItem) throws SQLException {
		List list = new ArrayList();
		long solutionId = 0;
		if(solutionItem != null)
			solutionId = solutionItem.getId();
			
		Connection con = null;
		PreparedStatement ps = null;
		ResultSet rs = null;
		
		try {
			con = ConnectionPool.getConnection();

			ps = con.prepareStatement(_GET_SOLUTION_SAP_ALLINONE_BASED);
			ps.setLong(1, solutionId);
			rs = ps.executeQuery();

			while (rs.next()) {
				list.add(rs.getString(1));
			}
		}
		finally {
			ConnectionPool.cleanUp(con, ps, rs);
		}

		return list;

	}		
	
///////////////////////// update -//////////////////////////////////////////	
	public static void updateSolutionSolFocus(SolutionItem solutionItem, String sol_solFocusStr) throws SQLException {
		int id = getSolFocusIdByName(sol_solFocusStr);
		solutionItem.solFocus = id;
	}
	
	public static void updateSolutionCountryPriceEuro(SolutionItem solutionItem, String sol_countryPriceEuro)throws SQLException {
		int id = getCountryIdByName(sol_countryPriceEuro);
		solutionItem.countryPriceEuro = id;
	}
	
	public static void updateSolutionGeographicCoverage(SolutionItem solutionItem, String[] selectedArray)throws SQLException {
		List countries = CountryItemDAO.getCountryItems();
		List list = new ArrayList();
		long id = 0;
		if(solutionItem != null)
			id = solutionItem.getId();
			
		Connection con = null;
		Statement stmt = null;
		PreparedStatement ps = null;
		ResultSet rs = null;
		
		try {
			// first delete all the company previous coverage links
			con = ConnectionPool.getConnection();

			ps = con.prepareStatement(_DELETE_SOLUTION_COVERAGE);
			ps.setLong(1, id);
			ps.executeUpdate();
			if(selectedArray != null)
			{
				// add new values
				String querry = "INSERT INTO tbl_solution_coverage (solutionId, countryId) values ";
					
				boolean bFirst = true;
				for(int i = 0; i<selectedArray.length; i++ )
				{
					String value = (String)selectedArray[i];
					for(int j = 0; j<countries.size();j++)
					{
						if(value.equalsIgnoreCase(((CountryItem)countries.get(j)).getCountryName()))
						{
							if(!bFirst)
							{
								querry +=", ";
							}
							querry += "(" + id + ", "+ ((CountryItem)countries.get(j)).getId() +")";
							if(bFirst)
							{
								bFirst = false;
							}
						}
					}
				}
				System.out.println(querry);
				stmt = con.createStatement(java.sql.ResultSet.TYPE_FORWARD_ONLY,
	                    java.sql.ResultSet.CONCUR_UPDATABLE);
				stmt.executeUpdate(querry, Statement.NO_GENERATED_KEYS);
			}
		}
		finally {
		    if (stmt != null) {
		        try {
		            stmt.close();
		        } catch (SQLException ex) {
		            // ignore
		        }
		    }
			ConnectionPool.cleanUp(con, ps, rs);
		}
	}
	
	public static void updateSolutionIndustry(SolutionItem solutionItem, String[] selectedArray) throws SQLException {
		List industryItems = IndustryItemDAO.getIndustryItems();
		long id = 0;
		if(solutionItem != null)
			id = solutionItem.getId();
			
		Connection con = null;
		Statement stmt = null;
		PreparedStatement ps = null;
		ResultSet rs = null;
		
		try {
			// first delete all the company previous sap solutions links
			con = ConnectionPool.getConnection();
			ps = con.prepareStatement(_DELETE_SOLUTION_INDUSTRIES);
			ps.setLong(1, id);
			ps.executeUpdate();
			if(selectedArray != null)
			{
			// add new values
			String querry = "INSERT INTO tbl_solution_industries (solutionId, industryId) values ";
				
			boolean bFirst = true;
			for(int i = 0; i<selectedArray.length; i++ )
			{
				String value = (String)selectedArray[i];
				for(int j = 0; j<industryItems.size();j++)
				{
					if(value.equalsIgnoreCase(((IndustryItem)industryItems.get(j)).getIndustryName()))
					{
						if(!bFirst)
						{
							querry +=", ";
						}
						querry += "(" + id + ", "+ ((IndustryItem)industryItems.get(j)).getId() +")";
						if(bFirst)
						{
							bFirst = false;
						}
					}
				}
			}
			stmt = con.createStatement(java.sql.ResultSet.TYPE_FORWARD_ONLY,
                    java.sql.ResultSet.CONCUR_UPDATABLE);
			stmt.executeUpdate(querry, Statement.NO_GENERATED_KEYS);
			}
		}
		finally {
		    if (stmt != null) {
		        try {
		            stmt.close();
		        } catch (SQLException ex) {
		            // ignore
		        }
		    }
			ConnectionPool.cleanUp(con, ps, rs);
		}

	}	

	public static void updateMySAPAllInOneVers(SolutionItem solutionItem, String[] selectedArray)throws SQLException {

		List list = new ArrayList();
		List listId = new ArrayList();
		
		Connection con = null;
		PreparedStatement ps = null;
		ResultSet rs = null;
		
		try {
			con = ConnectionPool.getConnection();

			String _GET_MYSAPALLINONE_VERISON ="SELECT name, id FROM tbl_sol_sapallinone ";
			ps = con.prepareStatement(_GET_MYSAPALLINONE_VERISON);
			rs = ps.executeQuery();

			while (rs.next()) {
				list.add(rs.getString(1));
				listId.add(rs.getInt(2));
			}
		}
		finally {
			ConnectionPool.cleanUp(con, ps, rs);
		}
		
		long id = 0;
		if(solutionItem != null)
			id = solutionItem.getId();
			
		con = null;
		Statement stmt = null;
		ps = null;
		rs = null;
		
		try {
			// first delete all the company previous sap solutions links
			con = ConnectionPool.getConnection();
			ps = con.prepareStatement(_DELETE_SOLUTION_SAPALLINONE);
			ps.setLong(1, id);
			ps.executeUpdate();
			if(selectedArray != null)
			{
			// add new values
			String querry = "INSERT INTO tbl_sol_to_solsapallinone (solutionId, id) values ";
				
			boolean bFirst = true;
			for(int i = 0; i<selectedArray.length; i++ )
			{
				String value = (String)selectedArray[i];
				for(int j = 0; j<list.size();j++)
				{
					if(value.equalsIgnoreCase((String)list.get(j)))
					{
						if(!bFirst)
						{
							querry +=", ";
						}
						querry += "(" + id + ", "+ listId.get(j) +")";
						if(bFirst)
						{
							bFirst = false;
						}
					}
				}
			}
			System.out.println(querry);
			stmt = con.createStatement(java.sql.ResultSet.TYPE_FORWARD_ONLY,
                    java.sql.ResultSet.CONCUR_UPDATABLE);
			stmt.executeUpdate(querry, Statement.NO_GENERATED_KEYS);
			}
		}
		finally {
		    if (stmt != null) {
		        try {
		            stmt.close();
		        } catch (SQLException ex) {
		            // ignore
		        }
		    }
			ConnectionPool.cleanUp(con, ps, rs);
		}
	}
	
	public static void updateMySAPOneProductVers(SolutionItem solutionItem, String[] selectedArray)throws SQLException {

		List list = new ArrayList();
		List listId = new ArrayList();
		
		Connection con = null;
		PreparedStatement ps = null;
		ResultSet rs = null;
		
		try {
			con = ConnectionPool.getConnection();

			String _GET_MYSAPONEPRODUCT_VERISON ="SELECT name, id FROM tbl_sol_saponeproduct ";
			ps = con.prepareStatement(_GET_MYSAPONEPRODUCT_VERISON);
			rs = ps.executeQuery();

			while (rs.next()) {
				list.add(rs.getString(1));
				listId.add(rs.getInt(2));
			}
		}
		finally {
			ConnectionPool.cleanUp(con, ps, rs);
		}
		
		long id = 0;
		if(solutionItem != null)
			id = solutionItem.getId();
			
		con = null;
		Statement stmt = null;
		ps = null;
		rs = null;
		
		try {
			// first delete all the company previous sap solutions links
			con = ConnectionPool.getConnection();
			ps = con.prepareStatement(_DELETE_SOLUTION_SAPONEPRODUCT);
			ps.setLong(1, id);
			ps.executeUpdate();
			if(selectedArray != null)
			{
			// add new values
			String querry = "INSERT INTO tbl_sol_to_solsaponeproduct (solutionId, id) values ";
				
			boolean bFirst = true;
			for(int i = 0; i<selectedArray.length; i++ )
			{
				String value = (String)selectedArray[i];
				for(int j = 0; j<list.size();j++)
				{
					if(value.equalsIgnoreCase((String)list.get(j)))
					{
						if(!bFirst)
						{
							querry +=", ";
						}
						querry += "(" + id + ", "+ listId.get(j) +")";
						if(bFirst)
						{
							bFirst = false;
						}
					}
				}
			}
			System.out.println(querry);
			stmt = con.createStatement(java.sql.ResultSet.TYPE_FORWARD_ONLY,
                    java.sql.ResultSet.CONCUR_UPDATABLE);
			stmt.executeUpdate(querry, Statement.NO_GENERATED_KEYS);
			}
		}
		finally {
		    if (stmt != null) {
		        try {
		            stmt.close();
		        } catch (SQLException ex) {
		            // ignore
		        }
		    }
			ConnectionPool.cleanUp(con, ps, rs);
		}
	}
	
	public static void updateMaturity(SolutionItem solutionItem, String sol_maturity)throws SQLException {
		int id = getMaturityIdByName(sol_maturity);
		solutionItem.solMaturity = id;
	}
	
	public static void updateSolStatusByProvider(SolutionItem solutionItem, String sol_statusByProvider)throws SQLException {
		int id = getStatusByProviderIdByName(sol_statusByProvider);
		solutionItem.statusByProvider = id;
	}
	
	public static void updateSolStatusBySAP(SolutionItem solutionItem, String sol_statusBySAP)throws SQLException {
		int id = getStatusBySAPIdByName(sol_statusBySAP);
		solutionItem.statusBySAP = id;
	}
	
	public static void updateSolTargetCompSize(SolutionItem solutionItem, String[] selectedArray)throws SQLException {

		List list = new ArrayList();
		List listId = new ArrayList();
		
		Connection con = null;
		PreparedStatement ps = null;
		ResultSet rs = null;
		
		try {
			con = ConnectionPool.getConnection();

			String _GET_COMP_SIZES ="SELECT name, id FROM tbl_target_comp_size ";
			ps = con.prepareStatement(_GET_COMP_SIZES);
			rs = ps.executeQuery();

			while (rs.next()) {
				list.add(rs.getString(1));
				listId.add(rs.getInt(2));
			}
		}
		finally {
			ConnectionPool.cleanUp(con, ps, rs);
		}
		
		long id = 0;
		if(solutionItem != null)
			id = solutionItem.getId();
			
		con = null;
		Statement stmt = null;
		ps = null;
		rs = null;
		
		try {
			// first delete all the company previous sap solutions links
			con = ConnectionPool.getConnection();
			ps = con.prepareStatement(_DELETE_SOLUTION_TO_TARGET_COMP_SIZE);
			ps.setLong(1, id);
			ps.executeUpdate();
			if(selectedArray != null)
			{
			// add new values
			String querry = "INSERT INTO tbl_sol_to_targetcompsize (solutionId, id) values ";
				
			boolean bFirst = true;
			for(int i = 0; i<selectedArray.length; i++ )
			{
				String value = (String)selectedArray[i];
				for(int j = 0; j<list.size();j++)
				{
					if(value.equalsIgnoreCase((String)list.get(j)))
					{
						if(!bFirst)
						{
							querry +=", ";
						}
						querry += "(" + id + ", "+ listId.get(j) +")";
						if(bFirst)
						{
							bFirst = false;
						}
					}
				}
			}
			System.out.println(querry);
			stmt = con.createStatement(java.sql.ResultSet.TYPE_FORWARD_ONLY,
                    java.sql.ResultSet.CONCUR_UPDATABLE);
			stmt.executeUpdate(querry, Statement.NO_GENERATED_KEYS);
			}
		}
		finally {
		    if (stmt != null) {
		        try {
		            stmt.close();
		        } catch (SQLException ex) {
		            // ignore
		        }
		    }
			ConnectionPool.cleanUp(con, ps, rs);
		}
	}
	
	public static void updateSolCategTarget(SolutionItem solutionItem, String[] selectedArray)throws SQLException {

		List list = new ArrayList();
		List listId = new ArrayList();
		
		Connection con = null;
		PreparedStatement ps = null;
		ResultSet rs = null;
		
		try {
			con = ConnectionPool.getConnection();

			String _GET_CATEG_TARGET ="SELECT name, id FROM tbl_sol_categ_target ";
			ps = con.prepareStatement(_GET_CATEG_TARGET);
			rs = ps.executeQuery();

			while (rs.next()) {
				list.add(rs.getString(1));
				listId.add(rs.getInt(2));
			}
		}
		finally {
			ConnectionPool.cleanUp(con, ps, rs);
		}
		
		long id = 0;
		if(solutionItem != null)
			id = solutionItem.getId();
			
		con = null;
		Statement stmt = null;
		ps = null;
		rs = null;
		
		try {
			// first delete all the company previous sap solutions links
			con = ConnectionPool.getConnection();
			ps = con.prepareStatement(_DELETE_SOLUTION_TO_CATEG_TARGET);
			ps.setLong(1, id);
			ps.executeUpdate();
			if(selectedArray != null)
			{
			// add new values
			String querry = "INSERT INTO tbl_sol_to_solcategtarget (solutionId, id) values ";
				
			boolean bFirst = true;
			for(int i = 0; i<selectedArray.length; i++ )
			{
				String value = (String)selectedArray[i];
				for(int j = 0; j<list.size();j++)
				{
					if(value.equalsIgnoreCase((String)list.get(j)))
					{
						if(!bFirst)
						{
							querry +=", ";
						}
						querry += "(" + id + ", "+ listId.get(j) +")";
						if(bFirst)
						{
							bFirst = false;
						}
					}
				}
			}
			System.out.println(querry);
			stmt = con.createStatement(java.sql.ResultSet.TYPE_FORWARD_ONLY,
                    java.sql.ResultSet.CONCUR_UPDATABLE);
			stmt.executeUpdate(querry, Statement.NO_GENERATED_KEYS);
			}
		}
		finally {
		    if (stmt != null) {
		        try {
		            stmt.close();
		        } catch (SQLException ex) {
		            // ignore
		        }
		    }
			ConnectionPool.cleanUp(con, ps, rs);
		}
	}
	
	public static void updateSolUserType(SolutionItem solutionItem, String sol_userType)throws SQLException {
		int id = getUserTypeIdByName(sol_userType);
		solutionItem.solUserType = id;
	}
	
	public static void updateSolProgLang(SolutionItem solutionItem, String[] selectedArray)throws SQLException {

		List list = new ArrayList();
		List listId = new ArrayList();
		
		Connection con = null;
		PreparedStatement ps = null;
		ResultSet rs = null;
		
		try {
			con = ConnectionPool.getConnection();

			String _GET_PROG_LANG ="SELECT name, id FROM tbl_prog_lang ";
			ps = con.prepareStatement(_GET_PROG_LANG);
			rs = ps.executeQuery();

			while (rs.next()) {
				list.add(rs.getString(1));
				listId.add(rs.getInt(2));
			}
		}
		finally {
			ConnectionPool.cleanUp(con, ps, rs);
		}
		
		long id = 0;
		if(solutionItem != null)
			id = solutionItem.getId();
			
		con = null;
		Statement stmt = null;
		ps = null;
		rs = null;
		
		try {
			// first delete all the company previous sap solutions links
			con = ConnectionPool.getConnection();
			ps = con.prepareStatement(_DELETE_SOLUTION_TO_PROG_LANG);
			ps.setLong(1, id);
			ps.executeUpdate();
			if(selectedArray != null)
			{
			// add new values
			String querry = "INSERT INTO tbl_sol_to_proglang (solutionId, id) values ";
				
			boolean bFirst = true;
			for(int i = 0; i<selectedArray.length; i++ )
			{
				String value = (String)selectedArray[i];
				for(int j = 0; j<list.size();j++)
				{
					if(value.equalsIgnoreCase((String)list.get(j)))
					{
						if(!bFirst)
						{
							querry +=", ";
						}
						querry += "(" + id + ", "+ listId.get(j) +")";
						if(bFirst)
						{
							bFirst = false;
						}
					}
				}
			}
			System.out.println(querry);
			stmt = con.createStatement(java.sql.ResultSet.TYPE_FORWARD_ONLY,
                    java.sql.ResultSet.CONCUR_UPDATABLE);
			stmt.executeUpdate(querry, Statement.NO_GENERATED_KEYS);
			}
		}
		finally {
		    if (stmt != null) {
		        try {
		            stmt.close();
		        } catch (SQLException ex) {
		            // ignore
		        }
		    }
			ConnectionPool.cleanUp(con, ps, rs);
		}
	}
	
	public static void updateSolOS(SolutionItem solutionItem, String[] selectedArray)throws SQLException {

		List list = new ArrayList();
		List listId = new ArrayList();
		
		Connection con = null;
		PreparedStatement ps = null;
		ResultSet rs = null;
		
		try {
			con = ConnectionPool.getConnection();

			String _GET_OS ="SELECT name, id FROM tbl_os ";
			ps = con.prepareStatement(_GET_OS);
			rs = ps.executeQuery();

			while (rs.next()) {
				list.add(rs.getString(1));
				listId.add(rs.getInt(2));
			}
		}
		finally {
			ConnectionPool.cleanUp(con, ps, rs);
		}
		
		long id = 0;
		if(solutionItem != null)
			id = solutionItem.getId();
			
		con = null;
		Statement stmt = null;
		ps = null;
		rs = null;
		
		try {
			// first delete all the company previous sap solutions links
			con = ConnectionPool.getConnection();
			ps = con.prepareStatement(_DELETE_SOLUTION_TO_OS);
			ps.setLong(1, id);
			ps.executeUpdate();
			if(selectedArray != null)
			{
			// add new values
			String querry = "INSERT INTO tbl_sol_to_os (solutionId, id) values ";
				
			boolean bFirst = true;
			for(int i = 0; i<selectedArray.length; i++ )
			{
				String value = (String)selectedArray[i];
				for(int j = 0; j<list.size();j++)
				{
					if(value.equalsIgnoreCase((String)list.get(j)))
					{
						if(!bFirst)
						{
							querry +=", ";
						}
						querry += "(" + id + ", "+ listId.get(j) +")";
						if(bFirst)
						{
							bFirst = false;
						}
					}
				}
			}
			System.out.println(querry);
			stmt = con.createStatement(java.sql.ResultSet.TYPE_FORWARD_ONLY,
                    java.sql.ResultSet.CONCUR_UPDATABLE);
			stmt.executeUpdate(querry, Statement.NO_GENERATED_KEYS);
			}
		}
		finally {
		    if (stmt != null) {
		        try {
		            stmt.close();
		        } catch (SQLException ex) {
		            // ignore
		        }
		    }
			ConnectionPool.cleanUp(con, ps, rs);
		}
	}
	
	public static void updateSolAioBased(SolutionItem solutionItem, String[] selectedArray)throws SQLException {

		List list = new ArrayList();
		List listId = new ArrayList();
		
		Connection con = null;
		PreparedStatement ps = null;
		ResultSet rs = null;
		
		try {
			con = ConnectionPool.getConnection();

			String _GET_OS ="SELECT name, id FROM tbl_sol_aio_based ";
			ps = con.prepareStatement(_GET_OS);
			rs = ps.executeQuery();

			while (rs.next()) {
				list.add(rs.getString(1));
				listId.add(rs.getInt(2));
			}
		}
		finally {
			ConnectionPool.cleanUp(con, ps, rs);
		}
		
		long id = 0;
		if(solutionItem != null)
			id = solutionItem.getId();
			
		con = null;
		Statement stmt = null;
		ps = null;
		rs = null;
		
		try {
			// first delete all the company previous sap solutions links
			con = ConnectionPool.getConnection();
			ps = con.prepareStatement(_DELETE_SOLUTION_TO_AIO_BASED);
			ps.setLong(1, id);
			ps.executeUpdate();
			if(selectedArray != null)
			{
			// add new values
			String querry = "INSERT INTO tbl_sol_to_solaiobased (solutionId, id) values ";
				
			boolean bFirst = true;
			for(int i = 0; i<selectedArray.length; i++ )
			{
				String value = (String)selectedArray[i];
				for(int j = 0; j<list.size();j++)
				{
					if(value.equalsIgnoreCase((String)list.get(j)))
					{
						if(!bFirst)
						{
							querry +=", ";
						}
						querry += "(" + id + ", "+ listId.get(j) +")";
						if(bFirst)
						{
							bFirst = false;
						}
					}
				}
			}
			System.out.println(querry);
			stmt = con.createStatement(java.sql.ResultSet.TYPE_FORWARD_ONLY,
                    java.sql.ResultSet.CONCUR_UPDATABLE);
			stmt.executeUpdate(querry, Statement.NO_GENERATED_KEYS);
			}
		}
		finally {
		    if (stmt != null) {
		        try {
		            stmt.close();
		        } catch (SQLException ex) {
		            // ignore
		        }
		    }
			ConnectionPool.cleanUp(con, ps, rs);
		}
	}


////////////// search related ///////////////////////////////////////////////////
	public static List getSolutionItemsBySearch(String industry_search, String  sapsol_search, String partner_search, String country_coverage_search, String primary_business_type_search, String name_search, String desc_search) throws SQLException {
		List list = new ArrayList();
		List listByInd = new ArrayList(); 
		List listBySap = new ArrayList(); 
		List listByCountryCov = new ArrayList(); 
		List listByCountry = new ArrayList();
		List listByBssType = new ArrayList();
		List returnList = new ArrayList();
		String value = "";
		if(industry_search != null)
			value += industry_search + " ";
		if(sapsol_search != null )
			value += sapsol_search + " ";
		if(partner_search != null )
			value += partner_search + " ";
		if(country_coverage_search != null)
			value += country_coverage_search + " ";
		if(primary_business_type_search != null)
			value += primary_business_type_search + " ";

		int indId = -1;
		int sapsolId = -1;
		int countrycoverageId = -1;
		int businesstypeId = -1;
		int companyId = -1;
		
		if(industry_search != null)
		{
			IndustryItem item = IndustryItemDAO.getIndustryItemByName(industry_search);
			if(item != null)
				indId = item.getId(); 
		}

		if(sapsol_search != null)
		{
			sapsolId = SolutionUtil.getSolFocusIdByName(sapsol_search); 
		}

		if(country_coverage_search != null)
		{
			CountryItem item = CountryItemDAO.getCountryItemByName(country_coverage_search);
			if(item != null)
				countrycoverageId = item.getId(); 
		}
		
		if(primary_business_type_search != null)
		{
			BusinesstypeItem item = BusinesstypeItemDAO.getBusinesstypeItemByName(primary_business_type_search);
			if(item != null)
				businesstypeId = item.getId(); 
		}
		
		if(partner_search != null)
		{
			companyId = CompanyItemDAO.getCompanyItemIdByName(partner_search);
		}
		
		Connection con = null;
		PreparedStatement ps = null;
		ResultSet rs = null;
			/*System.out.println("search with " + value);
			indId = -1;
			sapsolId = -1;
			countrycoverageId = -1;
			businesstypeId = -1;
			countryId = -1;
			System.out.println("search with " + String.valueOf(indId) +" " + String.valueOf(sapsolId) +" " + String.valueOf(countrycoverageId) +" " +String.valueOf(businesstypeId) +" " +String.valueOf(countryId) );*/
		try {
			con = ConnectionPool.getConnection();
			
			{
				if(indId >0 )	
				{
					ps = con.prepareStatement(_GET_SOL_ITEMS_BY_SEARCH_SOL_IND);
					ps.setInt(1, indId);
				}
				else // get all
				{
					ps = con.prepareStatement(_GET_SOL_ITEMS_ALL);
				}
				rs = ps.executeQuery();
				while (rs.next()) {
					listByInd.add(rs.getLong(1));
				}
			}
			{
				if(sapsolId >0 )	
				{
					ps = con.prepareStatement(_GET_SOL_ITEMS_BY_SEARCH_SOL_FOCUS);
					ps.setInt(1, sapsolId);
				}
				else
				{
					ps = con.prepareStatement(_GET_SOL_ITEMS_ALL);
				}
				rs = ps.executeQuery();
				while (rs.next()) {
					listBySap.add(rs.getLong(1));
				}
			}
			System.out.println("Search ok 1");
			{
				if(countrycoverageId >0 )	
				{
					ps = con.prepareStatement(_GET_SOL_ITEMS_BY_SEARCH_SOL_COVERAGE);
					ps.setInt(1, countrycoverageId);
				}
				else
				{
					ps = con.prepareStatement(_GET_SOL_ITEMS_ALL);
				}
				rs = ps.executeQuery();
				while (rs.next()) {
					CompanyItem companyItem = new CompanyItem();

					companyItem.setId(rs.getInt(1));
					listByCountryCov.add(rs.getLong(1));
				}
			}	
			System.out.println("Search ok 2");
			{
				if(companyId >0 )	
				{
					ps = con.prepareStatement(_GET_SOL_ITEMS_BY_COMPANY_ID);
					ps.setInt(1, companyId);
				}
				else // get all
				{
					ps = con.prepareStatement(_GET_SOL_ITEMS_ALL);
				}
				rs = ps.executeQuery();
				while (rs.next()) {
					listByCountry.add(rs.getLong(1));
				}
			}
			System.out.println("Search ok 3");
			// get all to intersect with
			{
				listByBssType = SolutionItemDAO.getSolutionItems() ;
			}
			// perform some list intersection!!!
			//List listByInd = new ArrayList();
			//List listBySap = new ArrayList();
			//List listByCountryCov = new ArrayList();
			//List listByCountry = new ArrayList();
			//List listByBssType = new ArrayList();
			for (int i = 0; i < listByInd.size(); i++) {
				long solItem1 = (Long)listByInd.get(i);
				for (int j = 0; j < listBySap.size(); j++)
				{
					long solItem2 = (Long)listBySap.get(j);
					if(solItem1 == solItem2) // check in the sec list
					{
						for (int t = 0; t < listByCountryCov.size(); t++)
						{
							long solItem3 = (Long)listByCountryCov.get(t);
							if(solItem3 == solItem2)
							{
								for (int k = 0; k < listByCountry.size(); k++)
								{
									long solItem4 = (Long)listByCountry.get(k);
									if(solItem4 == solItem3)
									{
										for (int kk = 0; kk < listByBssType.size(); kk++)
										{
											SolutionItem solItem5 = (SolutionItem)listByBssType.get(kk);
											if(solItem5.getId() == solItem4)
											{
												list.add(solItem5);
											}
										}
									}
								}								
							}
						}
						
					}
				}

			}
			//int indId = -1;
			//int sapsolId = -1;
			//int countrycoverageId = -1;
			//int businesstypeId = -1;
			// re-check by name and desc
			boolean  cond1 = (name_search != null) && (!name_search.equalsIgnoreCase(""));
			if(cond1)
			{
				name_search = name_search.toLowerCase();
			}
			boolean  cond2 = (desc_search != null) && (!desc_search.equalsIgnoreCase(""));
			if(cond2)
				desc_search = desc_search.toLowerCase();
				
			if(cond1 || cond2)
			{
				for (int i = 0; i < list.size(); i++) {
					SolutionItem solItem = (SolutionItem)list.get(i);
					boolean b1=  true;
					boolean b2=  true;
					if(cond1 && !solItem.solName.toLowerCase().contains(name_search))
					{
						b1 = false;
					}

					if(cond2)
					{
						if(solItem.solDesc != null)
						{
								if(!solItem.solDesc.toLowerCase().contains(desc_search))
									b2 = false;
						}
						else
							b2 = false;
					}
					if(b1 && b2)
						returnList.add(solItem);
				}
			}
			else
			{
				for (int i = 0; i < list.size(); i++) {
					SolutionItem solItem = (SolutionItem)list.get(i);
					returnList.add(solItem);
				}
			}			

		}
		finally {
			ConnectionPool.cleanUp(con, ps, rs);
		}

		return returnList;
	}
	
	private static final String _GET_COMPANY_ITEMS_BY_SEARCH =
		"SELECT companyId, companyName, description, parent_companyname, partnerNumber, friendlySAP_site, adressId, noEmployees, countryRegistrationId ,partner_since, last_review_date, reviewed_By, date_created, date_updated, modified_by, web_site FROM tbl_company";
	
	private static final String _GET_SOL_ITEMS_BY_SEARCH_SOL_COVERAGE =
		"SELECT solId FROM tbl_sol_directory t1 join tbl_solution_coverage t2 WHERE (t2.countryId = ?) AND (t1.solId = t2.solutionId)";

	private static final String _GET_SOL_ITEMS_BY_COMPANY_ID =
		"SELECT solId FROM tbl_sol_directory t1 WHERE t1.companyId = ?";

	private static final String _GET_SOL_ITEMS_BY_SEARCH_SOL_NAME =
		"SELECT solId FROM tbl_sol_directory t1 WHERE t1.solName = ?";

	private static final String _GET_SOL_ITEMS_BY_SEARCH_SOL_FOCUS =
		"SELECT solId FROM tbl_sol_directory t1 WHERE t1.solFocus = ?";

	private static final String _GET_SOL_ITEMS_BY_SEARCH_SOL_IND =
		"SELECT solId FROM tbl_sol_directory t1 join tbl_solution_industries t2 WHERE (t2.industryId = ?) AND (t1.solId = t2.solutionId)";

	private static final String _GET_COMPANY_SAP_SOLUTIONS =
		"SELECT SAPSolution_name FROM tbl_companies_sapsolution t1 join tbl_sapsolutions t2 WHERE (t1.sapsolutionId = t2.sapsolutionId) AND  t1.companyId = ?";

	private static final String _GET_COMPANY_BUSINESS_BY_TYPE =
		"SELECT business_name FROM tbl_companies_businesstype t1 join tbl_businesstype t2 WHERE (t1.businesstypeId = t2.businesstypeId) AND  t1.companyId = ? AND t1.type_= ?";

	private static final String _GET_COMPANY_COVERAGE =
		"SELECT country_name FROM tbl_companies_coverage t1 join tbl_countries t2 WHERE (t1.countryId = t2.countryId) AND  t1.companyId = ?";

	private static final String _DELETE_COMPANY_SAP_SOLUTIONS =	
		"DELETE FROM tbl_companies_sapsolution WHERE companyId = ?";

	private static final String _DELETE_SOLUTION_INDUSTRIES =	
		"DELETE FROM tbl_solution_industries WHERE solutionId = ?";

	private static final String _DELETE_SOLUTION_SAPALLINONE =	
		"DELETE FROM tbl_sol_to_solsapallinone WHERE solutionId = ?";

	private static final String _DELETE_SOLUTION_SAPONEPRODUCT =	
		"DELETE FROM tbl_sol_to_solsaponeproduct WHERE solutionId = ?";

	private static final String _DELETE_SOLUTION_TO_TARGET_COMP_SIZE =
		"DELETE FROM tbl_sol_to_targetcompsize WHERE solutionId = ?";

	private static final String _DELETE_SOLUTION_TO_CATEG_TARGET =
		"DELETE FROM tbl_sol_to_solcategtarget WHERE solutionId = ?";
	
	private static final String _DELETE_SOLUTION_COVERAGE =	
		"DELETE FROM tbl_solution_coverage WHERE solutionId = ?";

	private static final String _DELETE_SOLUTION_TO_PROG_LANG = 
		"DELETE FROM tbl_sol_to_proglang WHERE solutionId = ?";
	
	private static final String _DELETE_SOLUTION_TO_OS = 
		"DELETE FROM tbl_sol_to_os WHERE solutionId = ?";
		
	private static final String _DELETE_SOLUTION_TO_AIO_BASED = 
		"DELETE FROM tbl_sol_to_solaiobased WHERE solutionId = ?";

	private static final String _GET_SOL_ITEMS_ALL =
		"SELECT solId FROM tbl_sol_directory";

/// solution string
	private static final String _GET_SOLUTION_SOL_FOCUS = 
		"SELECT solSolFocus FROM tbl_sol_solfocus WHERE (tbl_sol_solfocus.id = ?) ";
	private static final String _GET_SOL_MYSAPALLINONE_VERSION = 
		"SELECT name FROM tbl_sol_to_solsapallinone t1 join tbl_sol_sapallinone t2 WHERE (t1.id = t2.id) AND  t1.solutionId = ?";
	private static final String _GET_SOL_SAPONEPRODUCT_VERSION = 
		"SELECT name FROM tbl_sol_to_solsaponeproduct t1 join tbl_sol_saponeproduct t2 WHERE (t1.id = t2.id) AND  t1.solutionId = ?";
	private static final String _GET_SOL_MATURITY = 
		"SELECT name FROM tbl_sol_maturity WHERE (id = ?) ";
	private static final String _GET_SOLUTION_INDUSTRIES =
		"SELECT industry_name FROM tbl_solution_industries t1 join tbl_industry_microvertical t2 WHERE (t1.industryId = t2.industryId) AND  t1.solutionId = ?";
	private static final String _GET_SOL_STATUS_BY_PROVIDER = 
		"SELECT name FROM tbl_sol_status_by_partner WHERE (tbl_sol_status_by_partner.id = ?) ";
	private static final String _GET_SOL_STATUS_BY_SAP =
		"SELECT name FROM tbl_sol_status_by_sap WHERE (tbl_sol_status_by_sap.id = ?) ";

	private static final String _GET_SOLUTION_COVERAGE = 		
		"SELECT country_name FROM tbl_solution_coverage t1 join tbl_countries t2 WHERE (t1.countryId = t2.countryId) AND  t1.solutionId = ?";
	private static final String _GET_TARGET_COMP_SIZE =
		"SELECT name FROM tbl_sol_to_targetcompsize t1 join tbl_target_comp_size t2 WHERE (t1.id = t2.id) AND  t1.solutionId = ?";
	private static final String _GET_SOLUTION_CATEG_TARGET =
		"SELECT name FROM tbl_sol_to_solcategtarget t1 join tbl_sol_categ_target t2 WHERE (t1.id = t2.id) AND  t1.solutionId = ?";
	
	private static final String _GET_SOLUTION_LANG_AVAILABLE = 
		"SELECT name FROM tbl_sol_to_langavailable t1 join tbl_lang_available t2 WHERE (t1.id = t2.id) AND  t1.solutionId = ?";

	private static final String _GET_SOL_USER_TYPE = 
		"SELECT name FROM tbl_user_type WHERE (id = ?) ";

	private static final String _GET_SOL_COUNTRY_EUR = 
		"SELECT name FROM tbl_countries WHERE (id = ?) ";

	private static final String _GET_SOLUTION_OS = 
		"SELECT name FROM tbl_sol_to_os t1 join tbl_os t2 WHERE (t1.id = t2.id) AND  t1.solutionId = ?";
	private static final String _GET_SOLUTION_PROG_LANG =
		"SELECT name FROM tbl_sol_to_proglang t1 join tbl_prog_lang t2 WHERE (t1.id = t2.id) AND  t1.solutionId = ?";
	private static final String _GET_SOLUTION_SAP_ALLINONE_BASED = 
		"SELECT name FROM tbl_sol_to_solaiobased t1 join tbl_sol_aio_based t2 WHERE (t1.id = t2.id) AND  t1.solutionId = ?";
		
}