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
		long id = solutionItem.getId();
		if(id <=0 )
			return value;

		Connection con = null;
		PreparedStatement ps = null;
		ResultSet rs = null;
		
		try {
			con = ConnectionPool.getConnection();

			ps = con.prepareStatement(_GET_SOL_STATUS_BY_PROVIDER);
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
	
	public static List getStatusBySAP() throws SQLException {
		List list = new ArrayList();

		Connection con = null;
		PreparedStatement ps = null;
		ResultSet rs = null;
		
		try {
			con = ConnectionPool.getConnection();
			String _GET_STATUS_BY_SAP = "SELECT name FROM tbl_sol_status_by_SAP ";
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
		long id = solutionItem.getId();
		if(id <=0 )
			return value;

		Connection con = null;
		PreparedStatement ps = null;
		ResultSet rs = null;
		
		try {
			con = ConnectionPool.getConnection();

			ps = con.prepareStatement(_GET_SOL_STATUS_BY_SAP);
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

	public static List updateCompanySAPSolutionList(CompanyItem companyItem, String[] selectedArray) throws SQLException {
		
		List sapSolutions = SAPSolutionItemDAO.getSAPSolutionItems();
		List list = new ArrayList();
		String companySapSolutions = "";
		int companyId = 0;
		if(companyItem != null)
			companyId = companyItem.getId();
			
		Connection con = null;
		Statement stmt = null;
		PreparedStatement ps = null;
		ResultSet rs = null;
		
		try {
			// first delete all the company previous sap solutions links
			con = ConnectionPool.getConnection();

			ps = con.prepareStatement(_DELETE_COMPANY_SAP_SOLUTIONS);
			ps.setInt(1, companyId);
			ps.executeUpdate();
			if(selectedArray != null)
			{
			// add new values
			String querry = "INSERT INTO tbl_companies_sapsolution (companyId, sapsolutionId) values ";
				
			boolean bFirst = true;
			for(int i = 0; i<selectedArray.length; i++ )
			{
				String value = (String)selectedArray[i];
				for(int j = 0; j<sapSolutions.size();j++)
				{
					if(value.equalsIgnoreCase(((SAPSolutionItem)sapSolutions.get(j)).getSAPSolutionName()))
					{
						if(!bFirst)
						{
							querry +=", ";
						}
						querry += "(" + companyId + ", "+ ((SAPSolutionItem)sapSolutions.get(j)).getId() +")";
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

		return list;
	}	

	public static List updateCompanyIndustriesList(CompanyItem companyItem, String[] selectedArray) throws SQLException {
		
		List industryItems = IndustryItemDAO.getIndustryItems();
		List list = new ArrayList();
		int companyId = 0;
		if(companyItem != null)
			companyId = companyItem.getId();
			
		Connection con = null;
		Statement stmt = null;
		PreparedStatement ps = null;
		ResultSet rs = null;
		
		try {
			// first delete all the company previous sap solutions links
			con = ConnectionPool.getConnection();

			ps = con.prepareStatement(_DELETE_COMPANY_INDUSTRIES);
			ps.setInt(1, companyId);
			ps.executeUpdate();
			if(selectedArray != null)
			{
			// add new values
			String querry = "INSERT INTO tbl_companies_industries (companyId, industryId) values ";
				
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
						querry += "(" + companyId + ", "+ ((IndustryItem)industryItems.get(j)).getId() +")";
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

		return list;
	}	
	
	public static List updateBusinessType(CompanyItem companyItem, String selected, int type ) throws SQLException {
		if(type != 1 && type != 2)
			return null;
		List businessItems = BusinesstypeItemDAO.getBusinessTypeItems();
		List list = new ArrayList();
		int companyId = 0;
		if(companyItem != null)
			companyId = companyItem.getId();
			
		Connection con = null;
		Statement stmt = null;
		PreparedStatement ps = null;
		ResultSet rs = null;
		
		try {
			// first delete all the company previous sap solutions links
			con = ConnectionPool.getConnection();

			ps = con.prepareStatement(_DELETE_COMPANY_BUSINESS_TYPE);
			ps.setInt(1, companyId);
			ps.setInt(2, type);
			ps.executeUpdate();

			// add new values
			String querry = "INSERT INTO tbl_companies_businesstype (companyId, businesstypeId, type_) values ";
				
			for(int j = 0; j<businessItems.size();j++)
			{
				if(selected.equalsIgnoreCase(((BusinesstypeItem)businessItems.get(j)).getBusinessName()))
				{
					querry += "(" + companyId + ", "+ ((BusinesstypeItem)businessItems.get(j)).getId() + ", "+ type + ")";
				}
			}
			System.out.println(querry);
			stmt = con.createStatement(java.sql.ResultSet.TYPE_FORWARD_ONLY,
                    java.sql.ResultSet.CONCUR_UPDATABLE);
			stmt.executeUpdate(querry, Statement.NO_GENERATED_KEYS);
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

		return list;
	}	

	public static List updateCompanyCountryCoverage(CompanyItem companyItem, String[] selectedArray) throws SQLException {
		
		List countries = CountryItemDAO.getCountryItems();
		List list = new ArrayList();
		int companyId = 0;
		if(companyItem != null)
			companyId = companyItem.getId();
			
		Connection con = null;
		Statement stmt = null;
		PreparedStatement ps = null;
		ResultSet rs = null;
		
		try {
			// first delete all the company previous coverage links
			con = ConnectionPool.getConnection();

			ps = con.prepareStatement(_DELETE_COMPANY_COVERAGE);
			ps.setInt(1, companyId);
			ps.executeUpdate();
			if(selectedArray != null)
			{
				// add new values
				String querry = "INSERT INTO tbl_companies_coverage (companyId, countryId) values ";
					
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
							querry += "(" + companyId + ", "+ ((CountryItem)countries.get(j)).getId() +")";
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

		return list;
	}		

	
	public static List getSolutionItemsBySearch(String industry_search, String  sapsol_search, String country_search, String country_coverage_search, String primary_business_type_search) throws SQLException {
		List list = new ArrayList();
		List listByInd = new ArrayList();
		List listBySap = new ArrayList();
		List listByCountryCov = new ArrayList();
		List listByCountry = new ArrayList();
		List listByBssType = new ArrayList();
		
		String value = "";
		if(industry_search != null)
			value += industry_search + " ";
		if(sapsol_search != null )
			value += sapsol_search + " ";
		if(country_search != null )
			value += country_search + " ";
		if(country_coverage_search != null)
			value += country_coverage_search + " ";
		if(primary_business_type_search != null)
			value += primary_business_type_search + " ";

		int indId = -1;
		int sapsolId = -1;
		int countrycoverageId = -1;
		int businesstypeId = -1;
		int countryId = -1;
		
		if(industry_search != null)
		{
			IndustryItem item = IndustryItemDAO.getIndustryItemByName(industry_search);
			if(item != null)
				indId = item.getId(); 
		}

		if(sapsol_search != null)
		{
			SAPSolutionItem item = SAPSolutionItemDAO.getSAPSolutionItemByName(sapsol_search);
			if(item != null)
				sapsolId = item.getId(); 
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
		
		if(country_search != null)
		{
			CountryItem item = CountryItemDAO.getCountryItemByName(country_search);
			if(item != null)
				countryId = item.getId(); 
		}
		
		Connection con = null;
		PreparedStatement ps = null;
		ResultSet rs = null;
			System.out.println("search with " + value);
			/*indId = -1;
			sapsolId = -1;
			countrycoverageId = -1;
			businesstypeId = -1;
			countryId = -1;*/
			System.out.println("search with " + String.valueOf(indId) +" " + String.valueOf(sapsolId) +" " + String.valueOf(countrycoverageId) +" " +String.valueOf(businesstypeId) +" " +String.valueOf(countryId) );
		try {
			con = ConnectionPool.getConnection();
			
			{
				if(indId >0 )	
				{
					ps = con.prepareStatement(_GET_COMPANY_ITEMS_BY_SEARCH_COMP_IND);
					ps.setInt(1, indId);
				}
				else // get all
				{
					ps = con.prepareStatement(_GET_COMPANY_ITEMS_ALL);
				}
				rs = ps.executeQuery();
				while (rs.next()) {
					CompanyItem companyItem = new CompanyItem();

					companyItem.setId(rs.getInt(1));
					companyItem.setName(rs.getString(2));
					companyItem.setDescription(rs.getString(3));
					companyItem.setParentCompanyName(rs.getString(4));
					companyItem.setCompanyNo(rs.getInt(5));
					companyItem.setCompanyFriendlySite(rs.getString(5));
					companyItem.setAdressId(rs.getInt(7));
					companyItem.setCompanyEmpNo(rs.getInt(8));
					companyItem.setCountryRegistrationId(rs.getInt(9));
					companyItem.setYear(rs.getInt(10));
					companyItem.setDateLastReview(rs.getDate(11));
					companyItem.setReviewedBy(rs.getString(12));
					companyItem.setDateCreated(rs.getDate(13));
					companyItem.setDateUpdated(rs.getDate(14));
					companyItem.setModifiedBy(rs.getString(15));				
					companyItem.setCompanySite(rs.getString(16));				
					
					listByInd.add(companyItem);
				}
			}
			{
				if(sapsolId >0 )	
				{
					ps = con.prepareStatement(_GET_COMPANY_ITEMS_BY_SEARCH_COMP_SAPSOL);
					ps.setInt(1, sapsolId);
				}
				else
				{
					ps = con.prepareStatement(_GET_COMPANY_ITEMS_ALL);
				}
				rs = ps.executeQuery();
				while (rs.next()) {
					CompanyItem companyItem = new CompanyItem();

					companyItem.setId(rs.getInt(1));
					companyItem.setName(rs.getString(2));
					companyItem.setDescription(rs.getString(3));
					companyItem.setParentCompanyName(rs.getString(4));
					companyItem.setCompanyNo(rs.getInt(5));
					companyItem.setCompanyFriendlySite(rs.getString(5));
					companyItem.setAdressId(rs.getInt(7));
					companyItem.setCompanyEmpNo(rs.getInt(8));
					companyItem.setCountryRegistrationId(rs.getInt(9));
					companyItem.setYear(rs.getInt(10));
					companyItem.setDateLastReview(rs.getDate(11));
					companyItem.setReviewedBy(rs.getString(12));
					companyItem.setDateCreated(rs.getDate(13));
					companyItem.setDateUpdated(rs.getDate(14));
					companyItem.setModifiedBy(rs.getString(15));				
					companyItem.setCompanySite(rs.getString(16));				
					
					listBySap.add(companyItem);
				}
			}
			
			{
				if(countrycoverageId >0 )	
				{
					ps = con.prepareStatement(_GET_COMPANY_ITEMS_BY_SEARCH_COMP_COVERAGE);
					ps.setInt(1, countrycoverageId);
				}
				else
				{
					ps = con.prepareStatement(_GET_COMPANY_ITEMS_ALL);
				}
				rs = ps.executeQuery();
				while (rs.next()) {
					CompanyItem companyItem = new CompanyItem();

					companyItem.setId(rs.getInt(1));
					companyItem.setName(rs.getString(2));
					companyItem.setDescription(rs.getString(3));
					companyItem.setParentCompanyName(rs.getString(4));
					companyItem.setCompanyNo(rs.getInt(5));
					companyItem.setCompanyFriendlySite(rs.getString(5));
					companyItem.setAdressId(rs.getInt(7));
					companyItem.setCompanyEmpNo(rs.getInt(8));
					companyItem.setCountryRegistrationId(rs.getInt(9));
					companyItem.setYear(rs.getInt(10));
					companyItem.setDateLastReview(rs.getDate(11));
					companyItem.setReviewedBy(rs.getString(12));
					companyItem.setDateCreated(rs.getDate(13));
					companyItem.setDateUpdated(rs.getDate(14));
					companyItem.setModifiedBy(rs.getString(15));				
					companyItem.setCompanySite(rs.getString(16));				
					
					listByCountryCov.add(companyItem);
				}
			}	
			{
				if(businesstypeId >0 )	
				{
					ps = con.prepareStatement(_GET_COMPANY_ITEMS_BY_SEARCH_COMP_BSSTYPE);
					ps.setInt(1, businesstypeId);
				}
				else // get all
				{
					ps = con.prepareStatement(_GET_COMPANY_ITEMS_ALL);
				}
				rs = ps.executeQuery();
				while (rs.next()) {
					CompanyItem companyItem = new CompanyItem();

					companyItem.setId(rs.getInt(1));
					companyItem.setName(rs.getString(2));
					companyItem.setDescription(rs.getString(3));
					companyItem.setParentCompanyName(rs.getString(4));
					companyItem.setCompanyNo(rs.getInt(5));
					companyItem.setCompanyFriendlySite(rs.getString(5));
					companyItem.setAdressId(rs.getInt(7));
					companyItem.setCompanyEmpNo(rs.getInt(8));
					companyItem.setCountryRegistrationId(rs.getInt(9));
					companyItem.setYear(rs.getInt(10));
					companyItem.setDateLastReview(rs.getDate(11));
					companyItem.setReviewedBy(rs.getString(12));
					companyItem.setDateCreated(rs.getDate(13));
					companyItem.setDateUpdated(rs.getDate(14));
					companyItem.setModifiedBy(rs.getString(15));				
					companyItem.setCompanySite(rs.getString(16));				
					
					listByBssType.add(companyItem);
				}
			}
			{
				if(countryId >0 )	
				{
					ps = con.prepareStatement(_GET_COMPANY_ITEMS_BY_SEARCH_COMP_COUNTRY);
					ps.setInt(1, countryId);
				}
				else // get all
				{
					ps = con.prepareStatement(_GET_COMPANY_ITEMS_ALL);
				}
				rs = ps.executeQuery();
				while (rs.next()) {
					CompanyItem companyItem = new CompanyItem();
	
					companyItem.setId(rs.getInt(1));
					companyItem.setName(rs.getString(2));
					companyItem.setDescription(rs.getString(3));
					companyItem.setParentCompanyName(rs.getString(4));
					companyItem.setCompanyNo(rs.getInt(5));
					companyItem.setCompanyFriendlySite(rs.getString(5));
					companyItem.setAdressId(rs.getInt(7));
					companyItem.setCompanyEmpNo(rs.getInt(8));
					companyItem.setCountryRegistrationId(rs.getInt(9));
					companyItem.setYear(rs.getInt(10));
					companyItem.setDateLastReview(rs.getDate(11));
					companyItem.setReviewedBy(rs.getString(12));
					companyItem.setDateCreated(rs.getDate(13));
					companyItem.setDateUpdated(rs.getDate(14));
					companyItem.setModifiedBy(rs.getString(15));				
					companyItem.setCompanySite(rs.getString(16));				
					
					listByCountry.add(companyItem);
				}
			}
			// perform some list intersection!!!
			//List listByInd = new ArrayList();
			//List listBySap = new ArrayList();
			//List listByCountryCov = new ArrayList();
			//List listByCountry = new ArrayList();
			//List listByBssType = new ArrayList();
			for (int i = 0; i < listByInd.size(); i++) {
				CompanyItem companyItem1 = (CompanyItem)listByInd.get(i);
				for (int j = 0; j < listBySap.size(); j++)
				{
					CompanyItem companyItem2 = (CompanyItem)listBySap.get(j);
					if(companyItem1.getId() == companyItem2.getId()) // check in the sec list
					{
						for (int t = 0; t < listByCountryCov.size(); t++)
						{
							CompanyItem companyItem3 = (CompanyItem)listByCountryCov.get(t);
							if(companyItem3.getId() == companyItem2.getId())
							{
								for (int k = 0; k < listByBssType.size(); k++)
								{
									CompanyItem companyItem4 = (CompanyItem)listByBssType.get(k);
									if(companyItem4.getId() == companyItem3.getId())
									{
										for (int kk = 0; kk < listByCountry.size(); kk++)
										{
											CompanyItem companyItem5 = (CompanyItem)listByCountry.get(kk);
											if(companyItem5.getId() == companyItem4.getId())
											{
												list.add(companyItem1);
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
			

		}
		finally {
			ConnectionPool.cleanUp(con, ps, rs);
		}

		return list;
	}
	
	private static final String _GET_COMPANY_ITEMS_BY_SEARCH =
		"SELECT companyId, companyName, description, parent_companyname, partnerNumber, friendlySAP_site, adressId, noEmployees, countryRegistrationId ,partner_since, last_review_date, reviewed_By, date_created, date_updated, modified_by, web_site FROM tbl_company";
	
	private static final String _GET_COMPANY_ITEMS_BY_SEARCH_COMP_COVERAGE =
		"SELECT companyId, companyName, description, parent_companyname, partnerNumber, friendlySAP_site, adressId, noEmployees, countryRegistrationId ,partner_since, last_review_date, reviewed_By, date_created, date_updated, modified_by, web_site FROM tbl_company t1 join tbl_companies_coverage t2 USING ( companyId) WHERE t2.countryId = ?";

	private static final String _GET_COMPANY_ITEMS_BY_SEARCH_COMP_SAPSOL =
		"SELECT companyId, companyName, description, parent_companyname, partnerNumber, friendlySAP_site, adressId, noEmployees, countryRegistrationId ,partner_since, last_review_date, reviewed_By, date_created, date_updated, modified_by, web_site FROM tbl_company t1 join tbl_companies_sapsolution t2 USING ( companyId) WHERE t2.sapsolutionId = ?";

	private static final String _GET_COMPANY_ITEMS_BY_SEARCH_COMP_BSSTYPE =
		"SELECT companyId, companyName, description, parent_companyname, partnerNumber, friendlySAP_site, adressId, noEmployees, countryRegistrationId ,partner_since, last_review_date, reviewed_By, date_created, date_updated, modified_by, web_site FROM tbl_company t1 join tbl_companies_businesstype t2 USING ( companyId) WHERE t2.businesstypeId = ? AND t2.type_ = 1";
	
	private static final String _GET_COMPANY_ITEMS_BY_SEARCH_COMP_IND =
		"SELECT companyId, companyName, description, parent_companyname, partnerNumber, friendlySAP_site, adressId, noEmployees, countryRegistrationId ,partner_since, last_review_date, reviewed_By, date_created, date_updated, modified_by, web_site FROM tbl_company t1 join tbl_companies_industries t2 USING ( companyId) WHERE t2.industryId = ?";

	private static final String _GET_COMPANY_ITEMS_BY_SEARCH_COMP_COUNTRY =
		"SELECT companyId, companyName, description, parent_companyname, partnerNumber, friendlySAP_site, adressId, noEmployees, countryRegistrationId ,partner_since, last_review_date, reviewed_By, date_created, date_updated, modified_by, web_site FROM tbl_company t1 join tbl_adress t2 USING ( adressId, companyId ) WHERE t2.countryId = ?";

	private static final String _GET_COMPANY_SAP_SOLUTIONS =
		"SELECT SAPSolution_name FROM tbl_companies_sapsolution t1 join tbl_sapsolutions t2 WHERE (t1.sapsolutionId = t2.sapsolutionId) AND  t1.companyId = ?";

	private static final String _GET_COMPANY_BUSINESS_BY_TYPE =
		"SELECT business_name FROM tbl_companies_businesstype t1 join tbl_businesstype t2 WHERE (t1.businesstypeId = t2.businesstypeId) AND  t1.companyId = ? AND t1.type_= ?";

	private static final String _GET_COMPANY_COVERAGE =
		"SELECT country_name FROM tbl_companies_coverage t1 join tbl_countries t2 WHERE (t1.countryId = t2.countryId) AND  t1.companyId = ?";

	private static final String _DELETE_COMPANY_SAP_SOLUTIONS =	
		"DELETE FROM tbl_companies_sapsolution WHERE companyId = ?";

	private static final String _DELETE_COMPANY_INDUSTRIES =	
		"DELETE FROM tbl_companies_industries WHERE companyId = ?";

	private static final String _DELETE_COMPANY_BUSINESS_TYPE =	
		"DELETE FROM tbl_companies_businesstype WHERE companyId = ? AND type_ = ?";

	private static final String _DELETE_COMPANY_COVERAGE =	
		"DELETE FROM tbl_companies_coverage WHERE companyId = ?";

	private static final String _GET_COMPANY_ITEMS_ALL =
		"SELECT companyId, companyName, description, parent_companyname, partnerNumber, friendlySAP_site, adressId, noEmployees, countryRegistrationId ,partner_since, last_review_date, reviewed_By, date_created, date_updated, modified_by, web_site FROM tbl_company";
	
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