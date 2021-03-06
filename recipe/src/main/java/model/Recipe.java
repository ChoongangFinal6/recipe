package model;

import java.util.Date;

public class Recipe {
	private int no;
	private String email;
	private String country;
	private int time;
	private String material;
	private String name;
	private int difficulty;
	private int amount;
	private String oven;
	private Date writeDate;
	private String lastimage;
	private float rate;

	private String[] sendText;	
	
	private int startRow;
	private int endRow;

	public String[] getSendText() {
		return sendText;
	}
	public void setSendText(String[] sendText) {
		this.sendText = sendText;
	}
	public int getNo() {
		return no;
	}
	public void setNo(int no) {
		this.no = no;
	}
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	public String getCountry() {
		return country;
	}
	public void setCountry(String country) {
		this.country = country;
	}
	public int getTime() {
		return time;
	}
	public void setTime(int time) {
		this.time = time;
	}
	public String getMaterial() {
		return material;
	}
	public void setMaterial(String material) {
		this.material = material;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public int getDifficulty() {
		return difficulty;
	}
	public void setDifficulty(int difficulty) {
		this.difficulty = difficulty;
	}
	public int getAmount() {
		return amount;
	}
	public void setAmount(int size) {
		this.amount = size;
	}
	public String getOven() {
		return oven;
	}
	public void setOven(String oven) {
		this.oven = oven;
	}
	public Date getWriteDate() {
		return writeDate;
	}
	public void setWriteDate(Date writeDate) {
		this.writeDate = writeDate;
	}
	public float getRate() {
		return rate;
	}
	public void setRate(float rate) {
		this.rate = rate;
	}
	public String getLastimage() {
		return lastimage;
	}
	public void setLastimage(String lastimage) {
		this.lastimage = lastimage;
	}
	public int getStartRow() {
		return startRow;
	}
	public void setStartRow(int startRow) {
		this.startRow = startRow;
	}
	public int getEndRow() {
		return endRow;
	}
	public void setEndRow(int endRow) {
		this.endRow = endRow;
	}
}