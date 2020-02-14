package Theater;

/*seat_ID	int(11)	NO	PRI		auto_increment
seat_group	varchar(1)	NO			
seat_no	int(11)	NO			
seat_line_no	int(11)	NO			
screen_ID	int(11)	NO	MUL		
theater_ID	int(11)	NO	*/		

public class SeatDTO {
	int seat_ID; //PK
	String seat_group; //A, B, C, ...
	int seat_no; //1,2,3...
	int screen_ID; //1,2,..
	int theater_ID;

	public SeatDTO(int seat_ID, String seat_group, int seat_no, int screen_ID, int theater_ID) {
		//super();
		this.seat_ID = seat_ID;
		this.seat_group = seat_group;
		this.seat_no = seat_no;
		this.screen_ID = screen_ID;
		this.theater_ID = theater_ID;
	}
	
	@Override
	public String toString() {
		return "SeatDTO [seat_ID=" + seat_ID + ", seat_group=" + seat_group + ", seat_no=" + seat_no + ", screen_ID="
				+ screen_ID + ", theater_ID=" + theater_ID + "]";
	}
	
	public int getSeat_ID() {
		return seat_ID;
	}
	public void setSeat_ID(int seat_ID) {
		this.seat_ID = seat_ID;
	}
	public String getSeat_group() {
		return seat_group;
	}
	public void setSeat_group(String seat_group) {
		this.seat_group = seat_group;
	}
	public int getSeat_no() {
		return seat_no;
	}
	public void setSeat_no(int seat_no) {
		this.seat_no = seat_no;
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
