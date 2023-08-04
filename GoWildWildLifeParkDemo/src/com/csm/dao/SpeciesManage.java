package com.csm.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import com.csm.DBManager;
import com.csm.entity.Species;

public class SpeciesManage {
    public int insert(Species species) throws ClassNotFoundException, SQLException {
        int result = -1;

        // Get connection
        try (Connection conn = DBManager.getConnection()) {
            // Prepare statement
            String sql = "INSERT INTO `gwwb`.`species` (`Species_Id`, `Species_Type`, `Species_Group`, `Lifestyle`, `Conservation_status`) VALUES (?, ?, ?, ?, ?)";
            try (PreparedStatement pstmt = conn.prepareStatement(sql)) {
                // Set parameters for the prepared statement
                pstmt.setInt(1, species.getSpeciesId());
                pstmt.setString(2, species.getSpeciesType());
                pstmt.setString(3, species.getSpeciesGroup());
                pstmt.setString(4, species.getLifestyle());
                pstmt.setString(5, species.getConservationStatus());

                // Execute the statement
                result = pstmt.executeUpdate();
            }
        }

        return result;
    }
    
    public ArrayList<Species> fetchAll() throws ClassNotFoundException, SQLException {
        ArrayList<Species> species = new ArrayList<Species>();
        Species c;
        
        // Get connection
        DBManager dbMgr = new DBManager();
        Connection conn = dbMgr.getConnection();
        
        // Query
        String sql = "SELECT * FROM gwwb.species"; // Changed table name to "species"
        PreparedStatement pstmt = conn.prepareStatement(sql);
        ResultSet rs = pstmt.executeQuery();
        
        while (rs.next()) {
            c = new Species(
                rs.getInt("Species_Id"),
                rs.getString("Species_Type"),
                rs.getString("Species_Group"), // Added missing comma
                rs.getString("LifeStyle"), // Added missing comma
                rs.getString("Conservation_status")
            );
            
            species.add(c);
        }
        return species;
    }

    
    public int delete (int SpeciesId) throws ClassNotFoundException,
	SQLException{
		int result = -1;
		
		//get connection
		DBManager dbMgr = new DBManager();
		Connection conn = dbMgr.getConnection();
		
		//prepare statement
		String sql = "DELETE FROM `gwwb`.`species` " +
				"WHERE (`Species_Id` = ?)";
		
		PreparedStatement pstmt = conn.prepareStatement(sql);
		pstmt.setInt(1, SpeciesId);
		
		//execute statement
		result = pstmt.executeUpdate();
		return result;
	}



}
