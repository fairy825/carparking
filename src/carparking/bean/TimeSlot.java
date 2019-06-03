package carparking.bean;
import java.sql.Time;
import java.util.Date;
public class TimeSlot {
	private int id;
	private int seat;
	private int beginTime;
	private Date bookingDate;
	//private User user;
	//private Booking booking;
	public Parking getParking() {
		return parking;
	}
	public void setParking(Parking parking) {
		this.parking = parking;
	}
	private Parking parking;
	public int getSeat() {
		return seat;
	}
	public void setSeat(int seat) {
		this.seat = seat;
	}
//	public User getUser() {
//		return user;
//	}
//	public void setUser(User user) {
//		this.user = user;
//	}
//	public Booking getBooking() {
//		return booking;
//	}
//	public void setBooking(Booking booking) {
//		this.booking = booking;
//	}
	public int getBeginTime() {
		return beginTime;
	}
	public void setBeginTime(int beginTime) {
		this.beginTime = beginTime;
	}
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	
	public Date getBookingDate() {
		return bookingDate;
	}
	public void setBookingDate(Date bookingDate) {
		this.bookingDate = bookingDate;
	}
}
