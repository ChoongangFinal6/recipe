package model;

import java.sql.Timestamp;

public class Rating {
	private int no, postNo;
	private int rate;
	private String email;
	private Timestamp inputDate;
	
	//평점 후 계산용
	private int count;
	private float average;

	public int getCount() {
		return count;
	}
	public void setCount(int count) {
		this.count = count;
	}
	public float getAverage() {
		return average;
	}
	public void setAverage(float average) {
		this.average = average;
	}
	public int getNo() {
		return no;
	}
	public void setNo(int no) {
		this.no = no;
	}
	public int getPostNo() {
		return postNo;
	}
	public void setPostNo(int postNo) {
		this.postNo = postNo;
	}
	public int getRate() {
		return rate;
	}
	public void setRate(int rate) {
		this.rate = rate;
	}
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	public Timestamp getInputDate() {
		return inputDate;
	}
	public void setInputDate(Timestamp inputDate) {
		this.inputDate = inputDate;
	}
	public Rating() {
	}


}
