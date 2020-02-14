package Theater;

/*screen_ID	int(11)	NO	PRI		
theater_ID	int(11)	NO	PRI		*/

public class ScreenDTO {
	
	int screen_ID;
	int theater_ID;
	
	public ScreenDTO(int screen_ID, int theater_ID) {
		this.screen_ID = screen_ID;
		this.theater_ID = theater_ID;
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
