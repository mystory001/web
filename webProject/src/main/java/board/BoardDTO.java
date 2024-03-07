//231221
package board;

import java.sql.Timestamp;

public class BoardDTO {
	private String name;
	private String subject;
	private String content;
	private int num;
	private int readcount;
	private Timestamp date;
	
	
	@Override
	public String toString() {
		return "BoardDTO [name=" + name + ", subject=" + subject + ", content=" + content + ", num=" + num
				+ ", readcount=" + readcount + ", date=" + date + "]";
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getSubject() {
		return subject;
	}
	public void setSubject(String subject) {
		this.subject = subject;
	}
	public String getContent() {
		return content;
	}
	public void setContent(String content) {
		this.content = content;
	}
	public int getNum() {
		return num;
	}
	public void setNum(int num) {
		this.num = num;
	}
	public int getReadcount() {
		return readcount;
	}
	public void setReadcount(int readcount) {
		this.readcount = readcount;
	}
	public Timestamp getDate() {
		return date;
	}
	public void setDate(Timestamp date) {
		this.date = date;
	}
	
	
	

}
