package com.sample.viewallpartners.ImageUtil;

import java.io.*;
import java.text.*;
import java.sql.*;
import java.util.*;
import javax.servlet.*;
import javax.servlet.http.*;

import com.sample.viewallpartners.util.ConnectionPool;
/**
 *
 * Author:  Kyriakos T. Fourniadis
 * Scope:   Display Image Servlet
 * Version: 1.0
 *
 */
 
public class showImage extends HttpServlet {
    
    /*private Connection con;
    private Statement stmt;
    private String trace;
    */
    /**
     * Setup database connection and create SQL statement
     */
    public void init( ServletConfig config ) throws ServletException
    {
        System.out.println("init ceva?");
/*        // Try database connection
        try{
            // The call to Class.forName explicitly loads the driver class
            //Class.forName("org.gjt.mm.mysql.Driver"); 
            Class.forName("com.mysql.jdbc.Driver").newInstance(); 
            //jdbc:mysql://<HOST>:<PORT>/<DB>
            //Connection con = DriverManager.getConnection("jdbc:mysql://localhost/mydb?user=''&password=''");
            con = DriverManager.getConnection("jdbc:mysql://localhost/mydb");
            // Once a connection has been established we can create an instance 
            // of Statement, through which we will send queries to the database.
            stmt = con.createStatement();  
        }
        catch (Exception exception ) {
            exception.printStackTrace();
            throw new UnavailableException(exception.getMessage());
        }*/
    } // End init()
    
    /**
     * Forward to doGet
     */
    public void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException
    {
        System.out.println("doGet?");

        doPost(request, response);
    }
    
    /*
     * NOTE: doPost -> HTTP post requests | doGet -> HTTP get resuest
     */
    public void doPost(HttpServletRequest request, HttpServletResponse response)
    throws IOException, ServletException
    {
        System.out.println("doPost?");
        // Simple trace variable for debugging...
        //trace = "";
        
        /*
        SELECT *
        FROM image
        WHERE image.image_id = ?variable?
         */        
		Connection con = null;
		PreparedStatement ps = null;
		ResultSet rs =  null;
		Statement stmt = null ;
        try {
			con = ConnectionPool.getConnection();

            String SQL =
                "SELECT * " +
                "FROM tbl_logo " +
                "WHERE tbl_logo.id = '" + request.getParameter("id") + "'";
            
            rs = stmt.executeQuery(SQL);
            rs.next();
            
            Blob blob = null;
            blob = rs.getBlob("bin_data");
            response.setContentType("image/jpeg");
            
            System.out.println("just above OutputStream");
            
            InputStream in = blob.getBinaryStream();
            OutputStream out = response.getOutputStream();
            int b;
            while ((b = in.read()) != -1) {
                out.write(b);
            }
 
            in.close();
            out.flush();
            out.close(); 
 
        }
        catch (Exception exception ) {
            throw new ServletException("Error");
        }
		finally {
		    if (rs != null) {
		        try {
		            rs.close();
		        } catch (SQLException ex) {
		            // ignore
		        }
		    }

		    if (stmt != null) {
		        try {
		            stmt.close();
		        } catch (SQLException ex) {
		            // ignore
		        }
		    }
			ConnectionPool.cleanUp(con, ps, rs);
		}
    } // end doPost()
            
    /*
     * Close SQL statements & database connection
     */
    public void destroy()
    {
        // Attempt to close statements and database connection
        /*try{
            stmt.close();
            con.close();
        }       
        
        // Handle database exceptions by returning error to client
        catch (SQLException sqlException){
            sqlException.printStackTrace();
        }*/
    } // End destroy()    
} // End class showImage

