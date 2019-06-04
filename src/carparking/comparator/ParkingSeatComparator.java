package carparking.comparator;
 
import java.util.Comparator;

 
import carparking.bean.Parking;
 
public class ParkingSeatComparator implements Comparator<Parking>{
 
    @Override
    public int compare(Parking p1, Parking p2) {
        return p2.getTotalSeat()-p1.getTotalSeat();
    }
 
}