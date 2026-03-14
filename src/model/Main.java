package model;

public class Main {

    // This 'main' method is the exact spot where Java starts running the program!
    public static void main(String[] args) {

        System.out.println("--- Starting the SwiftDrive Services ---");

        // 1. We build our empty train track (The Linked List)
        ServiceHistoryList myTrain = new ServiceHistoryList();

        // 2. We create some cargo (Service Records)
        // Notice the dates are mixed up! We will fix that later.
        ServiceRecord service1 = new ServiceRecord("Toyota Prius", "Oil Change", "2024-01-15");
        ServiceRecord service2 = new ServiceRecord("Honda Civic", "Tire Replacement", "2023-11-20");
        ServiceRecord service3 = new ServiceRecord("Ford Ranger", "Engine Check", "2024-02-10");

        // 3. We load the cargo into the train (Adding to the Linked List)
        myTrain.addRecord(service1);
        myTrain.addRecord(service2);
        myTrain.addRecord(service3);

        // 4. We ask the train to show us everything inside!
        System.out.println("\nHere is the current Service History:");
        myTrain.displayAll();

        // 5. Use Selection Sort to fix the dates!
        System.out.println("\n--- Performing Selection Sort... ---");
        myTrain.sortHistoryByDate();

        // 6. Look at the train again to see if it worked!
        System.out.println("\nHere is the SORTED Service History:");
        myTrain.displayAll();
    }
}