package carparking.bean;

import java.util.Date;


import java.util.List;
import carparking.dao.BookingDAO;

public class Booking {
	private int id;
	private User user;
	private Parking parking;
	private Date createDate;
	private Date payDate;
	private Date arriveDate;
	private TimeSlot timeSlot;
	private String state;
	public String getStateDesc(){
        String desc ="未知";
        switch(state){
            case BookingDAO.waitPay:
                desc="待付款";
                break;
            case BookingDAO.waitTime:
                desc="未到预约时间";
                break;
            case BookingDAO.waitArrive:
                desc="待到达";
                break;
            case BookingDAO.waitFinish:
                desc="进行中";
                break;
            case BookingDAO.waitReview:
                desc="可留言";
                break;
            case BookingDAO.finish:
                desc="已结束";
                break;
            case BookingDAO.delete:
                desc="刪除";
                break;
            default:
                desc="未知";
        }
        return desc;
    }
	public TimeSlot getTimeSlot() {
		return timeSlot;
	}

	public void setTimeSlot(TimeSlot timeSlot) {
		this.timeSlot = timeSlot;
	}
	public Date getPayDate() {
		return payDate;
	}
	public void setPayDate(Date payDate) {
		this.payDate = payDate;
	}
	public Date getArriveDate() {
		return arriveDate;
	}
	public void setArriveDate(Date arriveDate) {
		this.arriveDate = arriveDate;
	}
	public String getState() {
		return state;
	}
	public void setState(String state) {
		this.state = state;
	}
	public Date getCreateDate() {
		return createDate;
	}
	public void setCreateDate(Date createDate) {
		this.createDate = createDate;
	}
	
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public User getUser() {
		return user;
	}
	public void setUser(User user) {
		this.user = user;
	}
	public Parking getParking() {
		return parking;
	}
	public void setParking(Parking parking) {
		this.parking = parking;
	}
}
