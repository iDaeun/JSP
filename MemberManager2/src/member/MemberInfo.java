package member;
// usebean class
import java.util.Date;

public class MemberInfo {
	private String id;
	private String pw;
	private String name;
	private String photo;
	private Date registerDate;
	
	//Default 생성자
	public MemberInfo() {
		this.registerDate = new Date();
	}
	
	
	public MemberInfo(String id, String pw, String name, String photo, Date registerDate) {
		this.id = id;
		this.pw = pw;
		this.name = name;
		this.photo = photo;
		this.registerDate = registerDate;
	}
	
	// 변수들의 getter/setter


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


	public String getPhoto() {
		return photo;
	}


	public void setPhoto(String photo) {
		this.photo = photo;
	}


	public Date getRegisterDate() {
		return registerDate;
	}


	public void setRegisterDate(Date registerDate) {
		this.registerDate = registerDate;
	}

	//데이터 확인을 위한 toString 오버라이딩
	@Override
	public String toString() {
		return "memberInfo [id=" + id + ", pw=" + pw + ", name=" + name + ", photo=" + photo + ", registerDate="
				+ registerDate + "]";
	}

	// 화면 결과 출력을 위한 HTML코드 반환
	public String makeHtmlDiv() {
		String str = "";
		
		str += "<div class='mInfor'> \n";
		str += "<h3> \n";
		str += ""+id+"("+name+") \n";
		str += "</h3> \n";
		str += "<p> \n";
		str += "</div> \n";
		
		return str;
	}
	
	// MemberInfo객체 -> LoginInfo객체 반환 
	public LoginInfo toLoginInfo() {
		return new LoginInfo(id, name, photo);
	}

}
