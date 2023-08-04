package com.csm.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import com.csm.DBManager;
import com.csm.entity.Enclosure;

public class EnclosureManage {
	 public int insert(Enclosure enclosure) throws ClassNotFoundException, SQLException {
	        int result = -1;

	        // Get connection
	        try (Connection conn = DBManager.getConnection()) {
	            // Prepare statement
	            String sql = "INSERT INTO `gwwb`.`Enclosures` (`Enclosure_Type`, `Location`) VALUES (?, ?)";
	            try (PreparedStatement pstmt = conn.prepareStatement(sql)) {
	                // Set parameters for the prepared statement
	                pstmt.setString(1, enclosure.getEnclosure_Type());
	                pstmt.setString(2, enclosure.getLocation());

	                // Execute the statement
	                result = pstmt.executeUpdate();
	            }
	        }

	        return result;
	    }


    public ArrayList<Enclosure> fetchAll() throws ClassNotFoundException, SQLException {
        ArrayList<Enclosure> enclosures = new ArrayList<Enclosure>();
        Enclosure c;

        // Get connection
        DBManager dbMgr = new DBManager();
        Connection conn = dbMgr.getConnection();

        // Query
        String sql = "SELECT * FROM gwwb.Enclosures";
        PreparedStatement pstmt = conn.prepareStatement(sql);
        ResultSet rs = pstmt.executeQuery();

        while (rs.next()) {
            c = new Enclosure(
                    rs.getInt("Enclosure_Id"),
                    rs.getString("Enclosure_Type"),
                    rs.getString("Location")
            );

            enclosures.add(c);
        }
        return enclosures;
    }

    public int delete(int EnclosureId) throws ClassNotFoundException, SQLException {
        int result = -1;

        // Get connection
        DBManager dbMgr = new DBManager();
        Connection conn = dbMgr.getConnection();

        // Prepare statement
        String sql = "DELETE FROM `gwwb`.`enclosures` " +
                "WHERE (`Enclosure_Id` = ?)";

        PreparedStatement pstmt = conn.prepareStatement(sql);
        pstmt.setInt(1, EnclosureId);

        // Execute statement
        result = pstmt.executeUpdate();
        return result;
    }
}
