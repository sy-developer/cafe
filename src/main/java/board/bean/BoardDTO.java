package board.bean;

public class BoardDTO {
	private int board_num;			// 글 번호
	private String board_id;		// 글 작성자
	private String board_pass;		// 글 비밀번호
	private String board_subject;	// 글 제목
	private String board_content;	// 글 내용
	private int board_re_ref;		// 관련글 번호
	private int board_re_lev;		// 답글 레벨
	private int board_re_seq;		// 관련글 중 출력순서
	private int board_readcount;	// 조회수
	private String logtime;			// 작성일
	
	public int getBoard_num() {
		return board_num;
	}
	public void setBoard_num(int board_num) {
		this.board_num = board_num;
	}
	public String getBoard_id() {
		return board_id;
	}
	public void setBoard_id(String board_id) {
		this.board_id = board_id;
	}
	public String getBoard_pass() {
		return board_pass;
	}
	public void setBoard_pass(String board_pass) {
		this.board_pass = board_pass;
	}
	public String getBoard_subject() {
		return board_subject;
	}
	public void setBoard_subject(String board_subject) {
		this.board_subject = board_subject;
	}
	public String getBoard_content() {
		return board_content;
	}
	public void setBoard_content(String board_content) {
		this.board_content = board_content;
	}
	public int getBoard_re_ref() {
		return board_re_ref;
	}
	public void setBoard_re_ref(int board_re_ref) {
		this.board_re_ref = board_re_ref;
	}
	public int getBoard_re_lev() {
		return board_re_lev;
	}
	public void setBoard_re_lev(int board_re_lev) {
		this.board_re_lev = board_re_lev;
	}
	public int getBoard_re_seq() {
		return board_re_seq;
	}
	public void setBoard_re_seq(int board_re_seq) {
		this.board_re_seq = board_re_seq;
	}
	public int getBoard_readcount() {
		return board_readcount;
	}
	public void setBoard_readcount(int board_readcount) {
		this.board_readcount = board_readcount;
	}
	public String getLogtime() {
		return logtime;
	}
	public void setLogtime(String logtime) {
		this.logtime = logtime;
	}	
}


