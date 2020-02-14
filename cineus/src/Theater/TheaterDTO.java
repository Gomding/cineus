package Theater;

public class TheaterDTO {
	int theater_ID;
	String code;
	String img;
	String name;
	String address;
	double x;
	double y;
	
	public TheaterDTO(int theater_ID, String code, String img, String name, String address, double x, double y) {
		//super();
		this.code = code;
		this.img = img;
		this.name = name;
		this.address = address;
		this.theater_ID = theater_ID;
		this.x = x;
		this.y = y;
	}


	public String getCode() {
		return code;
	}



	public void setCode(String code) {
		this.code = code;
	}



	public String getImg() {
		return img;
	}



	public void setImg(String img) {
		this.img = img;
	}



	public String getName() {
		return name;
	}



	public void setName(String name) {
		this.name = name;
	}



	public String getAddress() {
		return address;
	}



	public void setAddress(String address) {
		this.address = address;
	}



	public int getTheater_ID() {
		return theater_ID;
	}



	public void setTheater_ID(int theater_ID) {
		this.theater_ID = theater_ID;
	}



	public double getX() {
		return x;
	}



	public void setX(double x) {
		this.x = x;
	}



	public double getY() {
		return y;
	}



	public void setY(double y) {
		this.y = y;
	}

	@Override
	public String toString() {
		return "TheaterDTO [code=" + code + ", img=" + img + ", name=" + name
				+ ", address=" + address + ", theater_ID=" + theater_ID + ", x=" + x + ", y=" + y + "]";
	}

	
}
