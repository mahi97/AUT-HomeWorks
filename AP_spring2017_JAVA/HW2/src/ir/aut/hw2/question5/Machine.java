package ir.aut.hw2.question5;

/**
 *
 * Created by Rahimi on 2/26/17.
 */
public class Machine {

    public static final double TURN_LEFT  = -90;
    public static final double TURN_RIGHT =  90;


    private static double highestSpeed;

    private double currentVelocity;
    private double currentAngle;
    private String owner;
    private long id;


    public Machine() {

    }

    public Machine(String ownerName) {
        this.owner = ownerName;
    }

    public void turn(double angle) {
        setCurrentAngle(getCurrentAngle() + angle);
    }

    @Override
    public String toString() {
        return "id : " + id + " owner : " + owner + " CV : " + currentVelocity + " CA : " + currentAngle;
    }

    public double getCurrentAngle() {
        return currentAngle;
    }

    public double getCurrentVelocity() {
        return currentVelocity;
    }

    public static double getHighestSpeed() {
        return highestSpeed;
    }

    public long getId() {
        return id;
    }

    public String getOwner() {
        return owner;
    }

    public void setCurrentAngle(double currentAngle) {
        this.currentAngle = currentAngle;
    }

    public void setCurrentVelocity(double currentVelocity) {
        if (currentVelocity > highestSpeed) {
            highestSpeed = currentVelocity;
        }
        this.currentVelocity = currentVelocity;
    }

    public void setId(long id) {
        this.id = id;
    }

    public static void setHighestSpeed(double highestSpeed) {
        Machine.highestSpeed = highestSpeed;
    }

    public void setOwner(String owner) {
        this.owner = owner;
    }
}

