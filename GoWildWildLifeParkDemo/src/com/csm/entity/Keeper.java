package com.csm.entity;

import com.csm.IncorrectDataTypeException;
import java.time.LocalDate;

public class Keeper {
    private int keeperId;
    private String keeperName;
    private LocalDate dateOfBirth;
    private String rank;

    public Keeper(int keeperId, String keeperName, LocalDate dateOfBirth, String rank) {
        super();
        this.keeperId = keeperId;
        setKeeperName(keeperName);
        setDateOfBirth(dateOfBirth);
        setRank(rank);
    }

    public Keeper(String keeperName, LocalDate dateOfBirth, String rank) {
        super();
        setKeeperName(keeperName);
        setDateOfBirth(dateOfBirth);
        setRank(rank);
    }

    public int getKeeperId() {
        return keeperId;
    }

    public void setKeeperId(int keeperId) {
        this.keeperId = keeperId;
    }

    public String getKeeperName() {
        return keeperName;
    }

    public void setKeeperName(String keeperName) {
        // Validate that the keeperName contains only letters and no digits
        if (keeperName.matches(".*\\d.*")) {
            throw new IncorrectDataTypeException("Keeper_Name", keeperName);
        }
        this.keeperName = keeperName;
    }

    public LocalDate getDateOfBirth() {
        return dateOfBirth;
    }

    public void setDateOfBirth(LocalDate dateOfBirth) {
        // Additional validation can be performed here if needed.
        this.dateOfBirth = dateOfBirth;
    }

    public String getRank() {
        return rank;
    }

    public void setRank(String rank) {
        // Validate that the rank contains only letters and no digits
        if (rank.matches(".*\\d.*")) {
            throw new IncorrectDataTypeException("Rank", rank);
        }
        this.rank = rank;
    }
}
