package schedule;

import java.sql.Date;

/*schedule_ID	int(11)	NO	PRI		auto_increment
schedule_date	date	NO			
start_at	time	NO			
end_at	time	NO			
movie_ID	int(11)	NO	MUL		
screen_ID	int(11)	NO	MUL		
theater_ID	int(11)	NO	MUL		*/

public class scheduleDTO {
	int schedule_ID;
	
	Date schedule_date;
	/*Time start_at;
	Time end_at;*/
	String start_at; // #### , 네자리 hhmm 
	String end_at;   // ####, 네자리 hhmm
	
	int movie_ID;	
	
	int screen_ID;		
	int theater_ID;
	
	
	public scheduleDTO(int schedule_ID, Date schedule_date, String start_at, String end_at, int movie_ID, int screen_ID,
			int theater_ID) {
		this.schedule_ID = schedule_ID;
		this.schedule_date = schedule_date;
		this.start_at = start_at;
		this.end_at = end_at;
		this.movie_ID = movie_ID;
		this.screen_ID = screen_ID;
		this.theater_ID = theater_ID;
	}

	@Override
	public String toString() {
		return "scheduleDTO [schedule_ID=" + schedule_ID + ", schedule_date=" + schedule_date + ", start_at=" + start_at
				+ ", end_at=" + end_at + ", movie_ID=" + movie_ID + ", screen_ID=" + screen_ID + ", theater_ID="
				+ theater_ID + "]";
	}
	
	public int getSchedule_ID() {
		return schedule_ID;
	}
	public void setSchedule_ID(int schedule_ID) {
		this.schedule_ID = schedule_ID;
	}
	public Date getSchedule_date() {
		return schedule_date;
	}
	public void setSchedule_date(Date schedule_date) {
		this.schedule_date = schedule_date;
	}
	public String getStart_at() {
		return start_at;
	}
	public void setStart_at(String start_at) {
		this.start_at = start_at;
	}
	public String getEnd_at() {
		return end_at;
	}
	public void setEnd_at(String end_at) {
		this.end_at = end_at;
	}
	public int getMovie_ID() {
		return movie_ID;
	}
	public void setMovie_ID(int movie_ID) {
		this.movie_ID = movie_ID;
	}
	public int getScreen_ID() {
		return screen_ID;
	}
	public void setScreen_ID(int screen_ID) {
		this.screen_ID = screen_ID;
	}
	public int getTheater_ID() {
		return theater_ID;
	}
	public void setTheater_ID(int theater_ID) {
		this.theater_ID = theater_ID;
	}	
}
