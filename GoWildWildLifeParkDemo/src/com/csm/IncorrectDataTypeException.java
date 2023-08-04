package com.csm;

public class IncorrectDataTypeException extends RuntimeException {
    private String columnName;
    private String incorrectValue;

    public IncorrectDataTypeException(String columnName, String incorrectValue) {
        this.columnName = columnName;
        this.incorrectValue = incorrectValue;
    }

    public String getColumnName() {
        return columnName;
    }

    public String getIncorrectValue() {
        return incorrectValue;
    }

    @Override
    public String getMessage() {
        return "Incorrect " + columnName + " value: '" + incorrectValue + "'";
    }
}

