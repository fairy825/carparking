package carparking.bean;

import java.util.List;


public class District {
	private int id;
	private String name;
	List<Parking> parkings;
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public List<Parking> getParkings() {
		return parkings;
	}
	public void setParkings(List<Parking> parkings) {
		this.parkings = parkings;
	}
}
