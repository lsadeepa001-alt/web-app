package model;

public class ServiceRecord {
    private String carName;      // Added for Main.java
    private String date;
    private String serviceType;
    private double cost;         // Added for dashboard.jsp

    // 1. The Empty Constructor (Prevents basic errors)
    public ServiceRecord() {
    }

    // 2. The Dashboard Constructor (String, String, double)
    public ServiceRecord(String date, String serviceType, double cost) {
        this.date = date;
        this.serviceType = serviceType;
        this.cost = cost;
        this.carName = "Unknown Car"; // Default if not provided
    }

    // 3. The Main.java Constructor (String, String, String)
    public ServiceRecord(String carName, String serviceType, String date) {
        this.carName = carName;
        this.serviceType = serviceType;
        this.date = date;
        this.cost = 0.0; // Default if not provided
    }

    // --- GETTERS ---
    public String getCarName() { return carName; }
    public String getDate() { return date; }
    public String getServiceType() { return serviceType; }
    public double getCost() { return cost; }

    // --- SETTERS ---
    public void setCarName(String carName) { this.carName = carName; }
    public void setDate(String date) { this.date = date; }
    public void setServiceType(String serviceType) { this.serviceType = serviceType; }
    public void setCost(double cost) { this.cost = cost; }

    // --- PRINT METHOD ---
    public void printRecord() {
        System.out.println("Car: " + carName + " | Date: " + date + " | Service: " + serviceType + " | Cost: $" + cost);
    }
}