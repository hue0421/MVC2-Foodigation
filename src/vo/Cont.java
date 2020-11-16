package vo;

import java.util.Date;

public class Cont {
	private int cno;	// 번호
	private String name;// 제목
	private String review;	// 리뷰
	private String store_name;	// 가게이름
	private int point;	// 포인트
	private String cat;	// 카테고리
	private int views;	// 조회수
	private Date writedate;	// 작성일
	private String writer; // 작성자
	private String map;	// 지도위치
	private String img_name;	// 첨부파일 이름 
	
	
	public String getImg_name() {
		return img_name;
	}

	public void setImg_name(String img_name) {
		this.img_name = img_name;
	}

	public Cont() {}

	public Cont(String name, String review, String store_name, int point, String cat) {
		super();
		/* this.cno = cno; */
		this.name = name;
		this.review = review;
		this.store_name = store_name;
		this.point = point;
		this.cat = cat;
	}
	
	
	public Cont(String name, String review, String store_name, int point, String cat, String writer,
			String map, String img_name) {
		super();
		this.name = name;
		this.review = review;
		this.store_name = store_name;
		this.point = point;
		this.cat = cat;
		this.writer = writer;
		this.map = map;
		this.img_name = img_name;
	}

	public Cont(int cno, String name, String review, String store_name, int point, String cat, int views,
			Date writedate) {
		super();
		this.cno = cno;
		this.name = name;
		this.review = review;
		this.store_name = store_name;
		this.point = point;
		this.cat = cat;
		this.views = views;
		this.writedate = writedate;
	}
	
	
	

	public Cont(int cno, String name, String review, String store_name, int point, String cat, int views,
			Date writedate, String writer, String map) {
		super();
		this.cno = cno;
		this.name = name;
		this.review = review;
		this.store_name = store_name;
		this.point = point;
		this.cat = cat;
		this.views = views;
		this.writedate = writedate;
		this.writer = writer;
		this.map = map;
	}

	public int getCno() {
		return cno;
	}

	public void setCno(int cno) {
		this.cno = cno;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getReview() {
		return review;
	}

	public void setReview(String review) {
		this.review = review;
	}

	public String getStore_name() {
		return store_name;
	}

	public void setStore_name(String store_name) {
		this.store_name = store_name;
	}

	public int getPoint() {
		return point;
	}

	public void setPoint(int point) {
		this.point = point;
	}

	public String getCat() {
		return cat;
	}

	public void setCat(String cat) {
		this.cat = cat;
	}

	public int getViews() {
		return views;
	}

	public void setViews(int views) {
		this.views = views;
	}

	public Date getWritedate() {
		return writedate;
	}

	public void setWritedate(Date writedate) {
		this.writedate = writedate;
	}

	public String getWriter() {
		return writer;
	}

	public void setWriter(String writer) {
		this.writer = writer;
	}

	public String getMap() {
		return map;
	}

	public void setMap(String map) {
		this.map = map;
	}

	@Override
	public String toString() {
		return "Cont [cno=" + cno + ", name=" + name + ", review=" + review + ", store_name=" + store_name + ", point="
				+ point + ", cat=" + cat + ", views=" + views + ", writedate=" + writedate + ", writer=" + writer
				+ ", map=" + map + "]";
	}

}
