/*

Defining the Table: Oracle and MySql

create table MyPictures (
   id INT PRIMARY KEY,
   name VARCHAR(0),
   photo BLOB
);
*/
package com.sample.viewallpartners.util;


import java.io.File;
import java.io.FileInputStream;
import java.io.IOException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.SQLException;
import java.awt.Image;
import java.awt.geom.AffineTransform;
import java.awt.Graphics2D;
import java.awt.image.BufferedImage;
import java.io.BufferedInputStream;
import java.io.FileInputStream;
import java.io.FileOutputStream;
import java.io.InputStream;
import java.sql.Blob;
import javax.swing.ImageIcon;

/*import java.awt.Toolkit;
import java.awt.MediaTracker;
import com.sun.image.codec.jpeg.JPEGImageEncoder;
*/
public class InsertPictureToMySql {

	private ImageIcon icon = null;

	private ImageIcon iconThumbnail = null;
	
  public static void AddLogoItem(int id, String str) throws Exception, IOException, SQLException {
    Class.forName("org.gjt.mm.mysql.Driver");
    
	Connection con = null;
	PreparedStatement ps = null;

    String INSERT_PICTURE = "insert into tbl_logo(companyId, filename, bin_data) values (?, ?, ?)";

    FileInputStream fis = null;
    try {

    	con = ConnectionPool.getConnection();

    	File file = new File("C:/LifeRay/Logo/citixsys_logo.jpg");
		fis = new FileInputStream(file);
		ps = con.prepareStatement(INSERT_PICTURE);
		ps.setInt(1, 1);
		ps.setString(2, "name1");
		ps.setBinaryStream(3, fis, (int) file.length());
		ps.executeUpdate();

		file = new File("C:/LifeRay/Logo/logo.gif");
		fis = new FileInputStream(file);
		ps = con.prepareStatement(INSERT_PICTURE);
		ps.setInt(1, 2);
		ps.setString(2, "name2");
		ps.setBinaryStream(3, fis, (int) file.length());
		ps.executeUpdate();

    }
	finally {
		ConnectionPool.cleanUp(con, ps);
		fis.close();
	}

  }
  
  /*public void getThumb(int id) {

	    //Do Get Account Button
	    getAccountButton = new JButton("Get Account");

	    if (!rs.isAfterLast()) {
	            accountIDText.setText(rs.getString("acc_id"));
	            thumbIDText.setText(rs.getString("thumb_id"));
	            Blob blob = rs.getBlob("pic");

	            int b;
	            InputStream bis = rs.getBinaryStream("pic");
	            FileOutputStream f = new FileOutputStream("pic.jpg");
	            while ((b = bis.read()) >= 0) {
	              f.write(b);
	            }
	            f.close();
	            bis.close();

	            icon = new ImageIcon(blob.getBytes(1L, (int) blob
	                .length()));
	            createThumbnail();
	            photographLabel.setIcon(iconThumbnail);
	          }
	        } catch (Exception selectException) {
	          displaySQLErrors(selectException);
	        }
	      }
	    };*/

  private void createThumbnail() {
	    int maxDim = 350;
	    try {
	      Image inImage = icon.getImage();

	      double scale = (double) maxDim / (double) inImage.getHeight(null);
	      if (inImage.getWidth(null) > inImage.getHeight(null)) {
	        scale = (double) maxDim / (double) inImage.getWidth(null);
	      }

	      int scaledW = (int) (scale * inImage.getWidth(null));
	      int scaledH = (int) (scale * inImage.getHeight(null));

	      BufferedImage outImage = new BufferedImage(scaledW, scaledH,
	          BufferedImage.TYPE_INT_RGB);

	      AffineTransform tx = new AffineTransform();

	      if (scale < 1.0d) {
	        tx.scale(scale, scale);
	      }

	      Graphics2D g2d = outImage.createGraphics();
	      g2d.drawImage(inImage, tx, null);
	      g2d.dispose();

	      iconThumbnail = new ImageIcon(outImage);
	    } catch (Exception e) {
	      e.printStackTrace();
	    }
	  }
  
  /*public static void createThumbFromFile(String[] args) throws Exception {
	    if (args.length != 5) {
	      System.err.println("Usage: java Thumbnail INFILE " +
	        "OUTFILE WIDTH HEIGHT QUALITY");
	      System.exit(1);
	    }
	    // load image from INFILE
	    Image image = Toolkit.getDefaultToolkit().getImage(args[0]);
	    MediaTracker mediaTracker = new MediaTracker(new Container());
	    mediaTracker.addImage(image, 0);
	    mediaTracker.waitForID(0);
	    // determine thumbnail size from WIDTH and HEIGHT
	    int thumbWidth = Integer.parseInt(args[2]);
	    int thumbHeight = Integer.parseInt(args[3]);
	    double thumbRatio = (double)thumbWidth / (double)thumbHeight;
	    int imageWidth = image.getWidth(null);
	    int imageHeight = image.getHeight(null);
	    double imageRatio = (double)imageWidth / (double)imageHeight;
	    if (thumbRatio < imageRatio) {
	      thumbHeight = (int)(thumbWidth / imageRatio);
	    } else {
	      thumbWidth = (int)(thumbHeight * imageRatio);
	    }
	    // draw original image to thumbnail image object and
	    // scale it to the new size on-the-fly
	    BufferedImage thumbImage = new BufferedImage(thumbWidth,
	      thumbHeight, BufferedImage.TYPE_INT_RGB);
	    Graphics2D graphics2D = thumbImage.createGraphics();
	    graphics2D.setRenderingHint(RenderingHints.KEY_INTERPOLATION,
	      RenderingHints.VALUE_INTERPOLATION_BILINEAR);
	    graphics2D.drawImage(image, 0, 0, thumbWidth, thumbHeight, null);
	    // save thumbnail image to OUTFILE
	    BufferedOutputStream out = new BufferedOutputStream(new
	      FileOutputStream(args[1]));
	    JPEGImageEncoder encoder = JPEGCodec.createJPEGEncoder(out);
	    JPEGEncodeParam param = encoder.
	      getDefaultJPEGEncodeParam(thumbImage);
	    int quality = Integer.parseInt(args[4]);
	    quality = Math.max(0, Math.min(quality, 100));
	    param.setQuality((float)quality / 100.0f, false);
	    encoder.setJPEGEncodeParam(param);
	    encoder.encode(thumbImage);
	    out.close();
	    System.out.println("Done.");
	    System.exit(0);
	  }
*/
  
}
