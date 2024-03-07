//231215
package member;

import java.sql.Timestamp;

public class MemberDTO {
	//멤버변수 → 변수를 아무나 접근 못하게 막아줌 → 데이터 은닉
	//데이터 은닉과 캡슐화
	private String id;
	private String pw;
	private String name;
	private Timestamp date;
	

	//데이터를 접근하기 위한 변수 setter,getter 메서드 → public 메서드
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
	public Timestamp getDate() {
		return date;
	}
	public void setDate(Timestamp date) {
		this.date = date;
	}
	
}//MemberDTO
