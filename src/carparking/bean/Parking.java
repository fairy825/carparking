package carparking.bean;

import java.sql.Time;
import java.util.List;



public class Parking {
	private int id;
	private String name;
	private String introduction;
	private float price;
	private String phoneNumber;
	private int seat;
	private int totalSeat;
	private String location;
	private District district;
	private int startTime;
	private int endTime;
	
	private ParkingImage firstParkingImage;
	private List<ParkingImage> parkingImages;
	private List<ParkingImage> parkingSingleImages;
	private List<ParkingImage> parkingDetailImages;
	private int reviewCount;
	private List<Message> messages;
	private List<TimeSlot> timeSlots;

	public List<TimeSlot> getTimeSlots() {
		return timeSlots;
	}
	public void setTimeSlots(List<TimeSlot> timeSlots) {
		this.timeSlots = timeSlots;
	}
	public int getStartTime() {
		return startTime;
	}
	public void setStartTime(int startTime) {
		this.startTime = startTime;
	}
	public int getEndTime() {
		return endTime;
	}
	public void setEndTime(int endTime) {
		this.endTime = endTime;
	}
	public List<ParkingImage> getParkingSingleImages() {
		return parkingSingleImages;
	}
	public void setParkingSingleImages(List<ParkingImage> parkingSingleImages) {
		this.parkingSingleImages = parkingSingleImages;
	}
	public List<ParkingImage> getParkingDetailImages() {
		return parkingDetailImages;
	}
	public void setParkingDetailImages(List<ParkingImage> parkingDetailImages) {
		this.parkingDetailImages = parkingDetailImages;
	}
	public List<Message> getMessages() {
		return messages;
	}
	public void setMessages(List<Message> messages) {
		this.messages = messages;
	}
	public String getPhoneNumber() {
		return phoneNumber;
	}
	public void setPhoneNumber(String phoneNumber) {
		this.phoneNumber = phoneNumber;
	}
	public int getTotalSeat() {
		return totalSeat;
	}
	public void setTotalSeat(int totalSeat) {
		this.totalSeat = totalSeat;
	}
	public int getReviewCount() {
		return reviewCount;
	}
	public void setReviewCount(int reviewCount) {
		this.reviewCount = reviewCount;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getIntroduction() {
		return introduction;
	}
	public void setIntroduction(String introduction) {
		this.introduction = introduction;
	}
	public float getPrice() {
		return price;
	}
	public void setPrice(float price) {
		this.price = price;
	}
	public int getSeat() {
		return seat;
	}
	public void setSeat(int seat) {
		this.seat = seat;
	}
	public String getLocation() {
		return location;
	}
	public void setLocation(String location) {
		this.location = location;
	}
	public District getDistrict() {
		return district;
	}
	public void setDistrict(District district) {
		this.district = district;
	}
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public ParkingImage getFirstParkingImage() {
		return firstParkingImage;
	}
	public void setFirstParkingImage(ParkingImage firstParkingImage) {
		this.firstParkingImage = firstParkingImage;
	}
	public List<ParkingImage> getParkingImages() {
		return parkingImages;
	}
	public void setParkingImages(List<ParkingImage> parkingImages) {
		this.parkingImages = parkingImages;
	}
	
}
