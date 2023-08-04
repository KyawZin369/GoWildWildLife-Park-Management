package com.csm.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import com.csm.DBManager;
import com.csm.entity.Diet;

public class DietManage {

    // Insert a new Diet record
    public int insert(Diet diet) throws ClassNotFoundException, SQLException {
        int result = -1;

        // Get connection
        try (Connection conn = DBManager.getConnection()) {
            // Prepare statement
            String sql = "INSERT INTO `gwwb`.`diet` (`Diet_Type`, `No_of_feed`) VALUES (?, ?)";
            try (PreparedStatement pstmt = conn.prepareStatement(sql)) {
                // Set parameters for the prepared statement
                pstmt.setString(1, diet.getDiet_Type());
                pstmt.setInt(2, diet.getNo_of_feed());

                // Execute the statement
                result = pstmt.executeUpdate();
            }
        }

        return result;
    }
    
    public ArrayList<Diet>fetchAll() throws ClassNotFoundException, SQLException{
		
		ArrayList<Diet> diets = new ArrayList<Diet>();
		
		Diet c;
		
		//get connection
		DBManager dbMgr = new DBManager();
		Connection conn = dbMgr.getConnection();
		
		//query
		String sql = "select * from gwwb.diet";
		PreparedStatement pstmt = conn.prepareStatement(sql);
		ResultSet rs = pstmt.executeQuery();
		
		while (rs.next()){
			c = new Diet(	rs.getInt("Diet_ID"),
					rs.getString("Diet_Type"),
					rs.getInt("No_of_feed"));
					
			diets.add(c);
		}
		return diets;
	}

    public int delete (int DietId) throws ClassNotFoundException,
	SQLException{
		int result = -1;
		
		//get connection
		DBManager dbMgr = new DBManager();
		Connection conn = dbMgr.getConnection();
		
		//prepare statement
		String sql = "DELETE FROM `gwwb`.`diet` " +
				"WHERE (`Diet_Id` = ?)";
		
		PreparedStatement pstmt = conn.prepareStatement(sql);
		pstmt.setInt(1, DietId);
		
		//execute statement
		result = pstmt.executeUpdate();
		return result;
	}

    
}
