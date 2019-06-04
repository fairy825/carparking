package carparking.comparator;
 
import java.util.Comparator;
 
import carparking.bean.Parking;
 
public class ParkingReviewComparator implements Comparator<Parking>{
 
    @Override
    public int compare(Parking p1, Parking p2) {
        return p2.getReviewCount()-p1.getReviewCount();
    }
 
}