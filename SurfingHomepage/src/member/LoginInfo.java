package member;

import java.util.Date;

//로그인한 회원 정보 저장

public class LoginInfo {
	private String id;
	private String pw;
	private String name;
	private String pNum;
	private String photo;
	private int level;
	private Date registerDate;
	
	
	public LoginInfo(String id, String pw, String name, String pNum, String photo, int level) {
		this.id = id;
		this.pw = pw;
		this.name = name;
		this.pNum = pNum;
		this.photo = photo;
		this.level = level;
		this.registerDate = new Date();
	}


	public void setId(String id) {
		this.id = id;
	}


	public void setPw(String pw) {
		this.pw = pw;
	}


	public void setName(String name) {
		this.name = name;
	}


	public void setpNum(String pNum) {
		this.pNum = pNum;
	}


	public void setPhoto(String photo) {
		this.photo = photo;
	}


	public void setLevel(int level) {
		this.level = level;
	}


	public void setRegisterDate(Date registerDate) {
		this.registerDate = registerDate;
	}

	
	public String getId() {
		return id;
	}

	@Override
	public String toString() {
		return "LoginInfo [id=" + id + ", pw=" + pw + ", name=" + name + ", pNum=" + pNum + ", photo=" + photo
				+ ", level=" + level + ", registerDate=" + registerDate + "]";
	}
	
}
