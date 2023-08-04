package com.csm.entity;

public class Diet {
	private int DietID;
	private String Diet_Type;
	private int No_of_feed;
	
	
	
	public Diet(int dietID, String diet_Type, int no_of_feed) {
		super();
		DietID = dietID;
		Diet_Type = diet_Type;
		No_of_feed = no_of_feed;
	}
	public Diet(String diet_Type, int no_of_feed) {
		super();
		Diet_Type = diet_Type;
		No_of_feed = no_of_feed;
	}
	public int getDietID() {
		return DietID;
	}
	public void setDietID(int dietID) {
		DietID = dietID;
	}
	public String getDiet_Type() {
		return Diet_Type;
	}
	public void setDiet_Type(String diet_Type) {
		Diet_Type = diet_Type;
	}
	public int getNo_of_feed() {
		return No_of_feed;
	}
	public void setNo_of_feed(int no_of_feed) {
		No_of_feed = no_of_feed;
	}
}
