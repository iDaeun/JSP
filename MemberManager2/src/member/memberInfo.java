package member;

import java.util.Date;

public class memberInfo {
	private String id;
	private String pw;
	private String name;
	private Date registerDate;
	
	public memberInfo() {
		this.registerDate = new Date();
	}
	
	

	public String getId() {
		return id;
	}



	public void setId(String id) {
		this.id = id;
	}



	public String getPw() {
		return pw;
	}



	public void setPw(String pw) {
		this.pw = pw;
	}



	public String getName() {
		return name;
	}



	public void setName(String name) {
		this.name = name;
	}



	public Date getRegisterDate() {
		return registerDate;
	}



	public void setRegisterDate(Date registerDate) {
		this.registerDate = registerDate;
	}



	@Override
	public String toString() {
		return "memberInfo [id=" + id + ", pw=" + pw + ", name=" + name + ", registerDate=" + registerDate + "]";
	}
	
	
}
