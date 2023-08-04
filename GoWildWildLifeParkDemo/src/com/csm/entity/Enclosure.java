package com.csm.entity;

import com.csm.IncorrectDataTypeException;

public class Enclosure {
    private int Enclosure_Id;
    private String Enclosure_Type;
    private String Location;

    public Enclosure(int enclosure_Id, String enclosure_Type, String location) {
        super();
        Enclosure_Id = enclosure_Id;
        setEnclosure_Type(enclosure_Type);
        setLocation(location);
    }

    public Enclosure(String enclosure_Type, String location) {
        super();
        setEnclosure_Type(enclosure_Type);
        setLocation(location);
    }

    public int getEnclosure_Id() {
        return Enclosure_Id;
    }

    public void setEnclosure_Id(int enclosure_Id) {
        Enclosure_Id = enclosure_Id;
    }

    public String getEnclosure_Type() {
        return Enclosure_Type;
    }

    public void setEnclosure_Type(String enclosure_Type) {
        // Validate that the Enclosure_Type contains only letters and no digits
        if (enclosure_Type.matches(".*\\d.*")) {
            throw new IncorrectDataTypeException("Enclosure_Type", enclosure_Type);
        }
        Enclosure_Type = enclosure_Type;
    }

    public String getLocation() {
        return Location;
    }

    public void setLocation(String location) {
        // Validate that the Location contains only letters and no digits
        if (location.matches(".*\\d.*")) {
            throw new IncorrectDataTypeException("Location", location);
        }
        Location = location;
    }
}
