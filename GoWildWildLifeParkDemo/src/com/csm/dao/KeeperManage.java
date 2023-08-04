package com.csm.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import com.csm.DBManager;
import com.csm.entity.Keeper;

public class KeeperManage {
    // Insert a new Keeper record
    public int insert(Keeper keeper) throws ClassNotFoundException, SQLException {
        int result = -1;

        // Get connection
        try (Connection conn = DBManager.getConnection()) {
            // Prepare statement
            String sql = "INSERT INTO `gwwb`.`keeper` (`Keeper_Name`, `Date_of_Birth`, `Rank`) VALUES (?, ?, ?)";
            try (PreparedStatement pstmt = conn.prepareStatement(sql)) {
                // Set parameters for the prepared statement
                pstmt.setString(1, keeper.getKeeperName());
                pstmt.setString(2, keeper.getDateOfBirth().toString()); // Convert LocalDate to string
                pstmt.setString(3, keeper.getRank()); // Use parameter index 3 for Rank
                // Execute the statement
                result = pstmt.executeUpdate();
            }
        }

        return result;
    }
    public ArrayList<Keeper>fetchAll() throws ClassNotFoundException, SQLException{
		
		ArrayList<Keeper> keepers = new ArrayList<Keeper>();
		
		Keeper c;
		
		//get connection
		DBManager dbMgr = new DBManager();
		Connection conn = dbMgr.getConnection();
		
		//query
		String sql = "select * from gwwb.keeper";
		PreparedStatement pstmt = conn.prepareStatement(sql);
		ResultSet rs = pstmt.executeQuery();
		
		while (rs.next()){
			c = new Keeper(
				    rs.getNString("Keeper_Name"),
				    rs.getDate("Date_of_Birth").toLocalDate(),
				    rs.getString("Rank")
				);
					
			keepers.add(c);
		}
		return keepers;
	}
    
    public int delete (int KeeperId) throws ClassNotFoundException,
	SQLException{
		int result = -1;
		
		//get connection
		DBManager dbMgr = new DBManager();
		Connection conn = dbMgr.getConnection();
		
		//prepare statement
		String sql = "DELETE FROM `gwwb`.`keeper` " +
				"WHERE (`Keeper_Id` = ?)";
		
		PreparedStatement pstmt = conn.prepareStatement(sql);
		pstmt.setInt(1, KeeperId);
		
		//execute statement
		result = pstmt.executeUpdate();
		return result;
	}

}
