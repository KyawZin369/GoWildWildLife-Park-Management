package com.csm.entity;

import com.csm.IncorrectDataTypeException;

public class Species {
    private int speciesId;
    private String speciesType;
    private String speciesGroup;
    private String lifestyle;
    private String conservationStatus;

    public Species(int speciesId, String speciesType, String speciesGroup, String lifestyle, String conservationStatus) {
        super();
        this.speciesId = speciesId;
        setSpeciesType(speciesType);
        setSpeciesGroup(speciesGroup);
        setLifestyle(lifestyle);
        setConservationStatus(conservationStatus);
    }

    public Species(String speciesType, String speciesGroup, String lifestyle, String conservationStatus) {
        super();
        setSpeciesType(speciesType);
        setSpeciesGroup(speciesGroup);
        setLifestyle(lifestyle);
        setConservationStatus(conservationStatus);
    }

    public int getSpeciesId() {
        return speciesId;
    }

    public void setSpeciesId(int speciesId) {
        this.speciesId = speciesId;
    }

    public String getSpeciesType() {
        return speciesType;
    }

    public void setSpeciesType(String speciesType) {
        // Validate that the speciesType contains only letters and no digits
        if (speciesType.matches(".*\\d.*")) {
            throw new IncorrectDataTypeException("Species_Type", speciesType);
        }
        this.speciesType = speciesType;
    }

    public String getSpeciesGroup() {
        return speciesGroup;
    }

    public void setSpeciesGroup(String speciesGroup) {
        // Validate that the speciesGroup contains only letters and no digits
        if (speciesGroup.matches(".*\\d.*")) {
            throw new IncorrectDataTypeException("Species_Group", speciesGroup);
        }
        this.speciesGroup = speciesGroup;
    }

    public String getLifestyle() {
        return lifestyle;
    }

    public void setLifestyle(String lifestyle) {
        this.lifestyle = lifestyle;
    }

    public String getConservationStatus() {
        return conservationStatus;
    }

    public void setConservationStatus(String conservationStatus) {
        this.conservationStatus = conservationStatus;
    }
}
