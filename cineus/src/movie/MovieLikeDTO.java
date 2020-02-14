package movie;

import java.sql.Timestamp;

/*id	int(11)	NO	PRI		auto_increment
movie_ID	int(11)	NO	MUL		
customer_ID	varchar(30)	NO	MUL		
reg_date	datetime	NO			*/

public class MovieLikeDTO {
	int id;
	int movie_ID;
	String customer_ID;
	Timestamp reg_date;
	
	public MovieLikeDTO(int id, int movie_ID, String customer_ID, Timestamp reg_date) {
		this.id = id;
		this.movie_ID = movie_ID;
		this.customer_ID = customer_ID;
		this.reg_date = reg_date;
	}
	
	@Override
	public String toString() {
		return "MovieLikeDTO [id=" + id + ", movie_ID=" + movie_ID + ", customer_ID=" + customer_ID + ", reg_date="
				+ reg_date + "]";
	}
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public int getMovie_ID() {
		return movie_ID;
	}
	public void setMovie_ID(int movie_ID) {
		this.movie_ID = movie_ID;
	}
	public String getCustomer_ID() {
		return customer_ID;
	}
	public void setCustomer_ID(String customer_ID) {
		this.customer_ID = customer_ID;
	}
	public Timestamp getReg_date() {
		return reg_date;
	}
	public void setReg_date(Timestamp reg_date) {
		this.reg_date = reg_date;
	}
	
}
