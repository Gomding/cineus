package movie;

import java.sql.Date;

/*
 * movie_ID	int(11)	NO	PRI		
title	varchar(50)	NO			
title_en	char(100)	YES			
plot	text	YES			
trailer	varchar(100)	YES			
product_year	int(11)	YES			
show_time	int(11)	NO			
start_date	date	NO			
end_date	date	YES			
 * 
 * 
*/		

public class MovieDTO {
	int movie_ID;
	String title;
	String title_en;
	String plot;
	String trailer;
	int product_year;
	int show_time;
	
	Date start_date;
	Date end_date;
	
	
	public MovieDTO(int movie_ID, String title, String title_en, String plot, String trailer, int product_year, int show_time, Date start_date, Date end_date) {
		this.movie_ID = movie_ID;
		this.title = title;
		this.title_en = title_en;
		this.plot=plot;
		this.trailer=trailer;
		this.product_year = product_year;
		this.show_time = show_time;
		this.start_date=start_date;
		this.end_date=end_date;
	}
	
	
	public String getPlot() {
		return plot;
	}


	public void setPlot(String plot) {
		this.plot = plot;
	}


	public String getTrailer() {
		return trailer;
	}


	public void setTrailer(String trailer) {
		this.trailer = trailer;
	}


	public int getMovie_ID() {
		return movie_ID;
	}
	public void setMovie_ID(int movie_ID) {
		this.movie_ID = movie_ID;
	}
	public String getTitle() {
		return title;
	}
	public void setTitle(String title) {
		this.title = title;
	}
	public String getTitle_en() {
		return title_en;
	}
	public void setTitle_en(String title_en) {
		this.title_en = title_en;
	}
	public int getProduct_year() {
		return product_year;
	}
	public void setProduct_year(int product_year) {
		this.product_year = product_year;
	}
	public int getShow_time() {
		return show_time;
	}
	public void setShow_time(int show_time) {
		this.show_time = show_time;
	}


	public Date getStart_date() {
		return start_date;
	}


	public void setStart_date(Date start_date) {
		this.start_date = start_date;
	}


	public Date getEnd_date() {
		return end_date;
	}


	public void setEnd_date(Date end_date) {
		this.end_date = end_date;
	}
	
	
}
