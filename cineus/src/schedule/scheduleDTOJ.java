package schedule;

import java.sql.Date;

public class scheduleDTOJ extends scheduleDTO {
	
	String theater_name; // 예 : 강남 메가박스
	int group_num; //1~8
	String location_name; //예 : 부산 충청 대전...
	int show_time;
	String end_at_accurate; //정확히 끝나는 시각(DB에는 X)
	String title;// 영화제목

	public String getTitle() {
		return title;
	}

	public void setTitle(String title) {
		this.title = title;
	}

	public scheduleDTOJ(int schedule_ID, Date schedule_date, String start_at, String end_at, int movie_ID,
			int screen_ID, int theater_ID) {
		super(schedule_ID, schedule_date, start_at, end_at, movie_ID, screen_ID, theater_ID);
		// TODO Auto-generated constructor stub
	}

	public String getTheater_name() {
		return theater_name;
	}

	public void setTheater_name(String theater_name) {
		this.theater_name = theater_name;
	}

	public int getGroup_num() {
		return group_num;
	}

	public void setGroup_num(int group_num) {
		this.group_num = group_num;
	}

	public String getLocation_name() {
		return location_name;
	}

	public void setLocation_name(String location_name) {
		this.location_name = location_name;
	}

	public int getShow_time() {
		return show_time;
	}

	public void setShow_time(int show_time) {
		this.show_time = show_time;
	}
	
	
	public String getEnd_at_accurate() {
		return end_at_accurate;
	}

	public void setEnd_at_accurate(String end_at_accurate) {
		this.end_at_accurate = end_at_accurate;
	}
	
}
