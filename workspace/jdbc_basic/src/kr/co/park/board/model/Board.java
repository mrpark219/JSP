package kr.co.park.board.model;

import java.sql.Date;

/*
	-- 게시판 테이블 생성.
	CREATE TABLE board (
	baord_id BIGINT(20) PRIMARY KEY AUTO_INCREMENT,
    writer VARCHAR(45) NOT NULL,
    title VARCHAR(100) NOT NULL,
    content TEXT NULL,
    created_at DATETIME DEFAULT NOW()
	);

*/

public class Board {

	Long boardID;
	String writer;
	String title;
	String content;
	Date createAt;
	
	public Board() {}

	public Board(Long boardID, String writer, String title, String content, Date createAt) {
		super();
		this.boardID = boardID;
		this.writer = writer;
		this.title = title;
		this.content = content;
		this.createAt = createAt;
	}

	public Long getBoardID() {
		return boardID;
	}

	public void setBoardID(Long boardID) {
		this.boardID = boardID;
	}

	public String getWriter() {
		return writer;
	}

	public void setWriter(String writer) {
		this.writer = writer;
	}

	public String getTitle() {
		return title;
	}

	public void setTitle(String title) {
		this.title = title;
	}

	public String getContent() {
		return content;
	}

	public void setContent(String content) {
		this.content = content;
	}

	public Date getCreateAt() {
		return createAt;
	}

	public void setCreateAt(Date createAt) {
		this.createAt = createAt;
	}
	
	
	
	
}
