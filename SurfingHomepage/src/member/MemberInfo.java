package member;

import java.util.Date;

//회원가입한 회원 정보 저장

public class MemberInfo {
	private String id;
	private String pw;
	private String name;
	private String pNum;
	private String photo;
	private int level;
	private Date registerDate;
	
	public MemberInfo() {
		this.registerDate = new Date();
	}
	
	public MemberInfo(String id, String pw, String name, String pNum, String photo, int level) {
		super();
		this.id = id;
		this.pw = pw;
		this.name = name;
		this.pNum = pNum;
		this.photo = photo;
		this.level = level;
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


	public String getpNum() {
		return pNum;
	}


	public void setpNum(String pNum) {
		this.pNum = pNum;
	}


	public String getPhoto() {
		return photo;
	}


	public void setPhoto(String photo) {
		this.photo = photo;
	}


	public int getLevel() {
		return level;
	}


	public void setLevel(int level) {
		this.level = level;
	}


	public Date getRegisterDate() {
		return registerDate;
	}


	public void setRegisterDate(Date registerDate) {
		this.registerDate = registerDate;
	}
	
	public String html() {
		String str = "";
		str += "<div id='html'> \n";
		str += "<h3> \n";
		str += "이름: "+name+"<br>";
		str += "전화번호: "+pNum+"<br>";
		str += "아이디: "+id+"<br>";
		str += "비밀번호: "+pw+"<br>";
		str += "레벨: "+level+"<br>";
		str += "가입일자: "+registerDate+"<br>";
		str += "photo: "+photo+"<br>";
		str += "</h3> \n";
		str += "</div> \n";
		
		return str;
	}


	@Override
	public String toString() {
		return "MemberInfo [id=" + id + ", pw=" + pw + ", name=" + name + ", pNum=" + pNum + ", photo=" + photo
				+ ", level=" + level + ", registerDate=" + registerDate + "]";
	}

	
	
}
