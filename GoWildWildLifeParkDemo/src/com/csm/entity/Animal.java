package com.csm.entity;

import com.csm.IncorrectDataTypeException;

public class Animal {
    private int Animal_Id;
    private String Animal_Name;
    private String Gender;
    private int Year_of_Arrival;
    private int Species_Species_Id;
    private int Keeper_Keeper_Id;
    private int Enclosures_Enclosure_Id;
    private int Diet_Diet_Id;
    private int Keeper_Id;
    private String Keeper_Name;
    private int totalAnimals;

    public Animal(int animal_Id, String animal_Name, String gender, int year_of_Arrival, int keeper_Id,
                  String keeper_Name) {
        super();
        setAnimal_Id(animal_Id);
        setAnimal_Name(animal_Name);
        setGender(gender);
        setYear_of_Arrival(year_of_Arrival);
        setKeeper_Keeper_Id(keeper_Id);
        setKeeper_Name(keeper_Name);
    }

    public Animal(String name, int totalAnimals) {
        super();
        setKeeper_Name(name);
        setTotalAnimals(totalAnimals);
    }

    public String getKeeper_Name() {
        return this.Keeper_Name;
    }

    public void setKeeper_Name(String name) {
        // Validate that the name contains only letters and no digits
        if (name.matches(".*\\d.*")) {
            throw new IncorrectDataTypeException("Name", name);
        }
        Keeper_Name = name;
    }

    public int getTotalAnimals() {
        return totalAnimals;
    }

    public void setTotalAnimals(int totalAnimals) {
        this.totalAnimals = totalAnimals;
    }

    public Animal(int animal_Id, String animal_Name, String gender, int year_of_Arrival, int species_Species_Id,
                  int keeper_Keeper_Id, int enclosures_Enclosure_Id, int diet_Diet_Id) {
        super();
        setAnimal_Id(animal_Id);
        setAnimal_Name(animal_Name);
        setGender(gender);
        setYear_of_Arrival(year_of_Arrival);
        setSpecies_Species_Id(species_Species_Id);
        setKeeper_Keeper_Id(keeper_Keeper_Id);
        setEnclosures_Enclosure_Id(enclosures_Enclosure_Id);
        setDiet_Diet_Id(diet_Diet_Id);
    }

    public Animal(String animal_Name, String gender, int year_of_Arrival, int species_Species_Id,
                  int keeper_Keeper_Id, int enclosures_Enclosure_Id, int diet_Diet_Id) {
        super();
        setAnimal_Name(animal_Name);
        setGender(gender);
        setYear_of_Arrival(year_of_Arrival);
        setSpecies_Species_Id(species_Species_Id);
        setKeeper_Keeper_Id(keeper_Keeper_Id);
        setEnclosures_Enclosure_Id(enclosures_Enclosure_Id);
        setDiet_Diet_Id(diet_Diet_Id);
    }

    public int getAnimal_Id() {
        return Animal_Id;
    }

    public void setAnimal_Id(int animal_Id) {
        Animal_Id = animal_Id;
    }

    public String getAnimal_Name() {
        return Animal_Name;
    }

    public void setAnimal_Name(String animal_Name) {
        // Validate that the Animal_Name contains only letters and no digits
        if (animal_Name.matches(".*\\d.*")) {
            throw new IncorrectDataTypeException("Animal_Name", animal_Name);
        }
        Animal_Name = animal_Name;
    }

    public String getGender() {
        return Gender;
    }

    public void setGender(String gender) {
        // Validate that the Gender contains only letters and no digits
        if (gender.matches(".*\\d.*")) {
            throw new IncorrectDataTypeException("Gender", gender);
        }
        Gender = gender;
    }

    public int getYear_of_Arrival() {
        return Year_of_Arrival;
    }

    public void setYear_of_Arrival(int year_of_Arrival) {
        Year_of_Arrival = year_of_Arrival;
    }

    public int getSpecies_Species_Id() {
        return Species_Species_Id;
    }

    public void setSpecies_Species_Id(int species_Species_Id) {
        Species_Species_Id = species_Species_Id;
    }

    public int getKeeper_Keeper_Id() {
        return Keeper_Keeper_Id;
    }

    public void setKeeper_Keeper_Id(int keeper_Keeper_Id) {
        Keeper_Keeper_Id = keeper_Keeper_Id;
    }

    public int getEnclosures_Enclosure_Id() {
        return Enclosures_Enclosure_Id;
    }

    public void setEnclosures_Enclosure_Id(int enclosures_Enclosure_Id) {
        Enclosures_Enclosure_Id = enclosures_Enclosure_Id;
    }

    public int getDiet_Diet_Id() {
        return Diet_Diet_Id;
    }

    public void setDiet_Diet_Id(int diet_Diet_Id) {
        Diet_Diet_Id = diet_Diet_Id;
    }
}
