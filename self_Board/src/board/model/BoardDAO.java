package board.model;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

public class BoardDAO {
	private static BoardDAO instance = null;
	private BoardDAO() {
	}
	public static BoardDAO getInstance() {
		if(instance == null) {
			synchronized(BoardDAO.class) {
				instance = new BoardDAO();
				
			}
		}
		return instance;
	}
	// 이곳에 게시판 작업의 기능 하나하나를 메소드로 추가 할것 이다 .
	
	// 전체 글의 개수를 알아내 주는 매소드 
	public int getActicleCount() {
		Connection conn = null;
		PreparedStatement ps = null;
		ResultSet rs = null;
		int x = 0;
		
		try {
			conn = ConnUtil.getConnection();
			ps = conn.prepareStatement("select count(*) from zboard");
			rs=ps.executeQuery();
			if(rs.next()) {
				x = rs.getInt(1);
				
			}
		} catch (Exception ex) {
			ex.printStackTrace();
		} finally {
			if (rs!=null) try { rs.close(); } catch (SQLException ex) {}
			if (ps!=null) try { ps.close(); } catch (SQLException ex) {}
			if (conn!=null) try { conn.close(); } catch (SQLException ex) {}
		}
		
		return x;
	}
		//글목록을 얻어서 list형태로 리턴해 줄 메소드
		public List<BoardVO> getArticles(int start, int end){
			Connection conn = null;
			PreparedStatement ps = null;
			ResultSet rs = null;
			List<BoardVO> articleList = null;
			
			try {
				conn = ConnUtil.getConnection();
				ps = conn.prepareStatement(
						"select rownum rnum, num, writer, email, subject, pass, regdate, readcount, ref, step, depth, content, ip "
						+ "from (select * from zboard order by ref desc, step ase)) where rnum>=? and rnum<=?");
				ps.setInt(1, start);
				ps.setInt(2, end);
				rs=ps.executeQuery();
				if(rs.next()) {
					articleList = new ArrayList<BoardVO>(5);
					do {
						BoardVO article = new BoardVO();
						article.setNum(rs.getInt("num"));
						article.setWriter(rs.getString("Writer"));
						article.setEmail(rs.getString("email"));
						article.setSubject(rs.getString("subject"));
						article.setPass(rs.getString("pass"));
						article.setRegdate(rs.getTimestamp("regdate"));
						article.setReadcount(rs.getInt("readcount"));
						article.setRef(rs.getInt("ref"));
						article.setStep(rs.getInt("step"));
						article.setDepth(rs.getInt("depth"));
						article.setContent(rs.getString("content"));
						article.setIp(rs.getString("ip"));
						articleList.add(article);
					} while (rs.next());
				}
			} catch (Exception ex) {
				ex.printStackTrace();
			} finally {
				if (rs!=null) try { rs.close();} catch (SQLException ex) {}
				if (ps!=null) try { ps.close();} catch (SQLException ex) {}
				if (conn!=null) try { conn.close();} catch (SQLException ex) {}
			}
			return articleList;
		}
		
		//글저장을 처리해줄 메소드 
		public void insertArticle(BoardVO article) {
			Connection conn = null;
			PreparedStatement ps = null;
			ResultSet rs = null;
			
			int num =article.getNum();
			int ref =article.getRef();
			int step = article.getStep();
			int depth = article.getDepth();
			int number = 0;
			String sql = "";
			
			try {
				conn = ConnUtil.getConnection();
				ps = conn.prepareStatement("select max(num) from board");
				rs = ps.executeQuery();
				
				if (rs.next()) number = rs.getInt(1)+1;
				else number=1;
				
				if(num!=0) {
					sql = "update board set step=step+1 where ref=? and step>?";
					ps = conn.prepareStatement(sql);
					ps.setInt(1, ref);
					ps.setInt(2, step);
					ps.executeUpdate();
					step = step + 1 ;
					depth = depth + 1;
				} else { //새글일 경우
					ref = number;
					step = 0;
					depth = 0;
				}// 쿼리를 작성
				sql = "insert into board(num, writer, email, subject, pass, regdate, ref, step, depth, content, ip)"
						+ "values(board_seq.nextval,?,?,?,?,?,?,?,?,?,?)";
				ps=conn.prepareStatement(sql);
				ps.setString(1, article.getWriter());
				ps.setString(2, article.getEmail());
				ps.setString(3, article.getSubject());
				ps.setString(4, article.getPass());
				ps.setTimestamp(5, article.getRegdate());
				ps.setInt(6, ref);
				ps.setInt(7, step);
				ps.setInt(8, depth);
				ps.setString(9, article.getContent());
				ps.setString(10, article.getIp());
				ps.executeUpdate();
			} catch (Exception ex) { ex.printStackTrace();
			} finally {
				if (rs!=null) try {rs.close();} catch (SQLException ex1) {}
				if (ps!=null) try {ps.close();} catch (SQLException ex2) {}
				if (conn!=null) try {conn.close();} catch (SQLException ex3) {}
			}
		}
		
		//데이터 베이스에서 실제로 글 내용을 가져올 메소드를 추가
		public BoardVO getArticle(int num) {
			Connection conn = null;
			PreparedStatement ps = null;
			ResultSet rs = null;
			BoardVO article = null;
			
			try {
				conn = ConnUtil.getConnection();
				ps = conn.prepareStatement("update board set readcount=readcount+1 where num = ?");
				ps.setInt(1, num);
				ps.executeQuery();
				ps = conn.prepareStatement("select * from board where num = ?");
				ps.setInt(1, num);
				rs = ps.executeQuery();
				
				if(rs.next()) {
					article = new BoardVO();
					article.setNum(rs.getInt("num"));
					article.setWriter(rs.getString("writer"));
					article.setEmail(rs.getString("email"));
					article.setSubject(rs.getString("subject"));
					article.setPass(rs.getString("pass"));
					article.setRegdate(rs.getTimestamp("regdate"));
					article.setReadcount(rs.getInt("readcount"));
					article.setRef(rs.getInt("ref"));
					article.setStep(rs.getInt("step"));
					article.setDepth(rs.getInt("depth"));
					article.setContent(rs.getString("content"));
					article.setIp(rs.getString("ip"));
				}
			} catch (Exception ex) { ex.getStackTrace();
			} finally {
				if (rs!=null) try {rs.close();} catch (SQLException ex) {}
				if (ps!=null) try {ps.close();} catch (SQLException ex) {}
				if (conn!=null) try {conn.close();} catch (SQLException ex) {}
			}
			return article;
		}
		
		
		public BoardVO updateGetArticle(int num) {
			Connection conn = null;
			PreparedStatement ps = null;
			ResultSet rs = null;
			BoardVO article = null;
			
			try {
				conn = ConnUtil.getConnection();
				ps = conn.prepareStatement("select * from board where num = ?");
				ps.setInt(1, num);
				rs = ps.executeQuery();
				
				if (rs.next()) {
					article = new BoardVO();
					article.setNum(rs.getInt("num"));
					article.setWriter(rs.getString("writer"));
					article.setEmail(rs.getString("email"));
					article.setSubject(rs.getString("subject"));
					article.setPass(rs.getString("pass"));
					article.setRegdate(rs.getTimestamp("regdate"));
					article.setReadcount(rs.getInt("readcount"));
					article.setRef(rs.getInt("ref"));
					article.setStep(rs.getInt("step"));
					article.setDepth(rs.getInt("depth"));
					article.setContent(rs.getString("ip"));
							
				}
				
			} catch (Exception ex) {
				ex.printStackTrace();
			} finally {
				if (rs!=null) try { rs.close(); }catch (SQLException ex) {}
				if (ps!=null) try { ps.close(); }catch (SQLException ex) {}
				if (conn!=null) try { conn.close(); }catch (SQLException ex) {}
				}
			return article;
			}
		


	public int updateArticle(BoardVO article) {
		Connection conn = null;
		PreparedStatement ps = null;
		ResultSet rs = null;
		String dbpasswd = "";
		String sql = "";
		int result = -1; // 결과값
		
		try {
			conn = ConnUtil.getConnection();
			ps = conn.prepareStatement("select pass from board where num = ?");
			ps.setInt(1, article.getNum());
			rs = ps.executeQuery();
			
			if (dbpasswd.equals(article.getPass())) {
				sql = "update board set writer=?,email=?,subject=?";
				sql += ",content=? where num=?";
				ps = conn.prepareStatement(sql);
				ps.setString(1, article.getWriter());
				ps.setString(2, article.getEmail());
				ps.setString(3, article.getSubject());
				ps.setString(4, article.getContent());
				ps.setInt(5, article.getNum());
				ps.executeQuery();
				result = 1;// 수정성공
			} else {
				result = 0;// 수정실패
			}
			
		} catch (Exception ex) {
			ex.printStackTrace();
		} finally {
			if (rs!=null) try { rs.close(); }catch (SQLException ex) {}
			if (ps!=null) try { ps.close(); }catch (SQLException ex) {}
			if (conn!=null) try { conn.close(); }catch (SQLException ex) {}
			}
		return result;
		}
	


	public int deleteArticle(int num, String pass) {
		Connection conn = null;
		PreparedStatement ps = null;
		ResultSet rs = null;
		String dbPass = "";
		int result = -1;
		
		try {
			conn = ConnUtil.getConnection();
			ps = conn.prepareStatement("select pass from board where num = ?");
			ps.setInt(1, num);
			rs = ps.executeQuery();
			
			if (rs.next()) {
				dbPass = rs.getString("pass");
				if (dbPass.equals(pass)) {
					ps = conn.prepareStatement("delete from board where num=?");
					ps.setInt(1, num);
					ps.executeQuery();
					result = 1;//글 삭제 성공
				} else 
					result = 0;//비밀번호 틀
				}
			
		} catch (Exception ex) {
			ex.printStackTrace();
		} finally {
			if (rs!=null) try { rs.close(); }catch (SQLException ex) {}
			if (ps!=null) try { ps.close(); }catch (SQLException ex) {}
			if (conn!=null) try { conn.close(); }catch (SQLException ex) {}
			}
		return result;
		}
	}