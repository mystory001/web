//231221
package board;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.sql.DataSource;


import member.MemberDTO;

public class BoardDAO {
	Connection con = null;
	PreparedStatement ps = null;
	ResultSet rs = null;
	
	public Connection getConnection() {
		
		try {
//			Class.forName("com.mysql.cj.jdbc.Driver");
//			String dbUrl = "jdbc:mysql://localhost:3306/jspdb?serverTimezone=Asia/Seoul";
//			String dbUser = "root";
//			String dbPw = "1234";
//			con = DriverManager.getConnection(dbUrl, dbUser, dbPw);	
			
			//커넥션 풀(Connenction Pool(CP) : 서버단에서 연결정보를 저장)
			//데이터베이스와 연결된 Connection 객체를 미리 생성하여 풀(Pool) 기억공간에 저장
			//→ 필요할 때 마다 풀에 접근해서 Connection객체를 사용하고 끝나면 반환
			// 장점 : 속도 향상, DB연결정보를 한 번만 수정해서 사용
			// 톰캣에서 제공하는 DBCP(Database Connection Pool) 사용
			//1) META-INF 폴더에 context.xml 파일을 만들고 커넥션 풀 디비연결정보 정의
			//2) DAO에서 디비연결자원의 이름을 불러서 사용
//			import javax.naming.Context;
//			import javax.naming.InitialContext;
			Context init = new InitialContext();
			//init.lookup("자원이름/자원이름");
			//자원위치 : java:comp/env
			//자원이름 : jdbc/Mysql
//			import javax.sql.DataSource;
			DataSource ds =	(DataSource)init.lookup("java:comp/env/jdbc/Mysql");
			con = ds.getConnection();
			
			
		} catch (Exception e) {
			e.printStackTrace();
		} 		
		return con;	
	}
	
	// 내장객체 기억장소 해제 메소드
	// finally 
	public void dbClose() {
		if(rs!=null) {
			try {
				rs.close();
			} catch (Exception e1) {
				e1.printStackTrace();
			}
		}
		if(ps!=null) {
			try {
				ps.close();
			} catch (Exception e2) {
				e2.printStackTrace();
			}
		}
		if(con!=null) {
			try {
				con.close();
			} catch (Exception e3) {
				e3.printStackTrace();
			}
		}
	}
	
	
	
	public void insertBoard(BoardDTO boardDTO) {
//		System.out.println(boardDTO.getName());
//		System.out.println(boardDTO.getSubject());
//		System.out.println(boardDTO.getContent());
//		System.out.println(boardDTO.getNum());
//		System.out.println(boardDTO.getReadcount());
//		System.out.println(boardDTO.getDate());
		
		try {
			con = getConnection();
			
			String sql = "insert into board(name,subject,content,num,readcount,date) values(?,?,?,?,?,?)";
			ps = con.prepareStatement(sql);
			ps.setString(1, boardDTO.getName());
			ps.setString(2, boardDTO.getSubject());
			ps.setString(3, boardDTO.getContent());
			ps.setInt(4, boardDTO.getNum());
			ps.setInt(5, boardDTO.getReadcount());
			ps.setTimestamp(6, boardDTO.getDate());
			
			ps.executeUpdate();
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			//마무리 작업 사용한 내장객체 기억장소 삭제(해제)
			//con ps 마지막에 생성된 것부터 close
			dbClose();
		}
		
	}
	
	//231226
	public int getMaxNum() {
		int num = 0;
		try {
			con = getConnection();
			
			String sql = "select max(num) from board"; 
			ps = con.prepareStatement(sql);
			rs = ps.executeQuery();
			
			if(rs.next()) {
				num = rs.getInt("max(num)");
			}
			
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			dbClose();
		}
		return num;
	} 
	
	//231226
	public ArrayList<BoardDTO> getBoardList(){
		System.out.println("BoardDAO getBoardList()");
		ArrayList<BoardDTO> boardList = new ArrayList<BoardDTO>();
		
		try {
			con = getConnection();
			
			String sql = "select * from board order by num desc";
			ps = con.prepareStatement(sql);
			rs = ps.executeQuery();
			
			while(rs.next()) {
				//num, name, subject, readCount, date를 boardList에 대입
				BoardDTO boardDTO = new BoardDTO();
				boardDTO.setNum(rs.getInt("num"));
				boardDTO.setName(rs.getString("name"));
				boardDTO.setSubject(rs.getString("subject"));
				boardDTO.setReadcount(rs.getInt("readCount"));
				boardDTO.setContent(rs.getString("content"));
				boardDTO.setDate(rs.getTimestamp("date"));			
				boardList.add(boardDTO);
			}
			
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			
		}
		return boardList;
	}
	
	//231226
	//요청 주소 : content.jsp?num=1
	//서버에 request에 "num"요청 파라미터값을 저장 → 가져와서 변수 int num에 저장
	//BoardDTO 리턴할 형, getBoard()(int num) 메소드 정의
	//BoardDTO boardDTO = BoardDTO getBoard(num값) 메소드 호출
	public BoardDTO getBoard(int num) {
		System.out.println("BoardDAO getBoard()");
		BoardDTO boardDTO = new BoardDTO();
		
		try {

			con = getConnection();
			String sql = "select * from board where num=?";
			ps = con.prepareStatement(sql);
			ps.setInt(1, num);
			rs = ps.executeQuery();
			
			if(rs.next()) {
				boardDTO.setNum(rs.getInt("num"));
				boardDTO.setName(rs.getString("name"));
				boardDTO.setReadcount(rs.getInt("readCount"));
				boardDTO.setDate(rs.getTimestamp("date"));
				boardDTO.setSubject(rs.getString("subject"));
				boardDTO.setContent(rs.getString("content"));
				
			}
			
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			dbClose();
		}
		
		return boardDTO;
	}
	
	//231228
	public void updateReadcount(int num) {
		System.out.println("BoardDAO updateReadcount()");
		BoardDTO boardDTO = new BoardDTO();
		
		try {
			con = getConnection();
			
			String sql = "update board set readcount = readcount+1 where num = ?";			
			ps = con.prepareStatement(sql);
			ps.setInt(1, num);
			ps.executeUpdate();		
			
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			dbClose();
		}
	}
	
	//231228
	//리턴할 형 없음. updateBoard(BoardDTO 변수) 메소드 정의
	public void updateBoard(BoardDTO boardDTO) {
		System.out.println("BoardDAO updateBoard()");
		
		try {
			
			con = getConnection();
		
			String sql = "update board set subject=?, content=? where num = ?";			
			ps = con.prepareStatement(sql);
			ps.setString(1, boardDTO.getSubject());
			ps.setString(2, boardDTO.getContent());
			ps.setInt(3, boardDTO.getNum());
			ps.executeUpdate();	
			
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			dbClose();
		}
		
	}
	
	//231228
	public void deleteBoard(BoardDTO boardDTO) {
		System.out.println("deleteBoard()");
		try {
			con = getConnection();
			
			String sql = "delete from board where num=?";
			ps = con.prepareCall(sql);
			ps.setInt(1, boardDTO.getNum());
			ps.executeUpdate();
		
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			dbClose();
		}
		
	}
	
	
	
	
	
	
	

}
