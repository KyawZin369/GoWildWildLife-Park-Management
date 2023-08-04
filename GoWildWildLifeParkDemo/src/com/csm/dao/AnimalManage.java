package com.csm.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import com.csm.DBManager;
import com.csm.entity.Animal;

public class AnimalManage {
    // Insert a new Animal record
    public int insert(Animal animal) throws ClassNotFoundException, SQLException {
        int result = -1;

        // Get connection
        try (Connection conn = DBManager.getConnection()) {
            // Prepare statement
            String sql = "INSERT INTO `gwwb`.`animal` (`Animal_Id`, `Animal_Name`, `Gender`, `Year_of_Arrival`, `Species_Species_Id`, `Keeper_Keeper_Id`, `Enclosures_Enclosure_Id`, `Diet_Diet_Id`) VALUES (?, ?, ?, ?, ?, ?, ?, ?)";
            try (PreparedStatement pstmt = conn.prepareStatement(sql)) {
                // Set parameters for the prepared statement
                pstmt.setInt(1, animal.getAnimal_Id());
                pstmt.setString(2, animal.getAnimal_Name());
                pstmt.setString(3, animal.getGender());
                pstmt.setInt(4, animal.getYear_of_Arrival());
                pstmt.setInt(5, animal.getSpecies_Species_Id());
                pstmt.setInt(6, animal.getKeeper_Keeper_Id());
                pstmt.setInt(7, animal.getEnclosures_Enclosure_Id());
                pstmt.setInt(8, animal.getDiet_Diet_Id());
                
                // Execute the statement
                result = pstmt.executeUpdate();
            }
        }

        return result;
    }
    
    public ArrayList<Animal> fetchAll() throws ClassNotFoundException, SQLException {
        ArrayList<Animal> animals = new ArrayList<Animal>();
        Animal animal;
        
        // Get connection
        DBManager dbMgr = new DBManager();
        Connection conn = dbMgr.getConnection();

        // Query to fetch all animals from the "Animal" table
        String sql = "SELECT * FROM gwwb.Animal";
        PreparedStatement pstmt = conn.prepareStatement(sql);
        ResultSet rs = pstmt.executeQuery();

        while (rs.next()) {
            animal = new Animal(
                rs.getInt("Animal_Id"),
                rs.getString("Animal_Name"),
                rs.getString("Gender"),
                rs.getInt("Year_of_Arrival"),
                rs.getInt("Species_Species_Id"),
                rs.getInt("Keeper_Keeper_Id"),
                rs.getInt("Enclosures_Enclosure_Id"),
                rs.getInt("Diet_Diet_Id")
            );

            animals.add(animal);
        }
        
        return animals;
    }

    public ArrayList<Animal> fetchDaveorTemi() throws ClassNotFoundException, SQLException {
        ArrayList<Animal> animals = new ArrayList<Animal>();
        Animal animalInfo;
        
        // get connection
        DBManager dbMgr = new DBManager();
        Connection conn = dbMgr.getConnection();

        // query
        String sql = "SELECT Animal_Id, Animal_Name, Gender, Year_of_Arrival, Keeper_Id, Keeper_Name \r\n"
        		+ "FROM animal\r\n"
        		+ "INNER JOIN gwwb.keeper ON animal.Keeper_Keeper_Id = Keeper.Keeper_Id\r\n"
        		+ "WHERE Keeper_Name IN ('Dave', 'Temi')\r\n"
        		+ "GROUP BY Animal_Id, Animal_Name, Gender, Year_of_Arrival, Keeper_Id, Keeper_Name;";
        PreparedStatement pstmt = conn.prepareStatement(sql);
        ResultSet rs = pstmt.executeQuery();

        while (rs.next()) {
            animalInfo = new Animal(
                rs.getInt("Animal_ID"),
                rs.getString("Animal_Name"),
                rs.getString("Gender"),
                rs.getInt("Year_of_Arrival"),
                rs.getInt("Keeper_Id"),
                rs.getString("Keeper_Name")
            );
                        
            animals.add(animalInfo); // add entity into collection to arraylist
        }

        return animals;
    }


	public ArrayList<Animal> fetchAnimalGroupByKeeper()throws ClassNotFoundException, SQLException{ //select all
		ArrayList<Animal> animals = new ArrayList<Animal>();
		Animal animalinfobykeeper;
		// get connection
		DBManager dbMgr = new DBManager();
		Connection conn = dbMgr.getConnection();

		// query
String sql = "Select Keeper_Name, Count(Animal_ID) AS Total_Animal From animal\r\n"
		+ "INNER JOIN gwwb.keeper ON animal.Keeper_Keeper_Id = Keeper.Keeper_Id\r\n"
		+ "Group by Keeper_Name;";
		PreparedStatement pstmt = conn.prepareStatement(sql);
		ResultSet rs = pstmt.executeQuery();


		while (rs.next()) {
			animalinfobykeeper = new Animal(
					
					rs.getString("Keeper_Name"),
					rs.getInt("Total_Animal"));
					
			animals.add(animalinfobykeeper); //add entity into collection to arraylist
		}

		return animals;

	}	

	public int delete (int AnimalId) throws ClassNotFoundException,
	SQLException{
		int result = -1;
		
		//get connection
		DBManager dbMgr = new DBManager();
		Connection conn = dbMgr.getConnection();
		
		//prepare statement
		String sql = "DELETE FROM `gwwb`.`animal` " +
				"WHERE (`Animal_Id` = ?)";
		
		PreparedStatement pstmt = conn.prepareStatement(sql);
		pstmt.setInt(1, AnimalId);
		
		//execute statement
		result = pstmt.executeUpdate();
		return result;
	}
}
