package carparking.comparator;
 
import java.util.Comparator;

 
import carparking.bean.Parking;
 
public class ParkingPriceComparator implements Comparator<Parking>{
 
    @Override
    public int compare(Parking p1, Parking p2) {
        return (int) (p1.getPrice()-p2.getPrice());
    }
 
}