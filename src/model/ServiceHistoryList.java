package model;

public class ServiceHistoryList {

    // This is the "Engine" (The very first Train Car on the track)
    public Node head;

    // The Builder: When we create the list, the track is empty!
    public ServiceHistoryList() {
        this.head = null;
    }

    // --- ACTION 1: ADD A NEW RECORD (Attach a new car to the train) ---
    public void addRecord(ServiceRecord newRecord) {
        // 1. Put the cargo into a new Train Car
        Node newCar = new Node(newRecord);

        // 2. Is the track empty? Make this car the Engine!
        if (this.head == null) {
            this.head = newCar;
            return; // We are done!
        }

        // 3. If there are already cars, we need to walk to the end of the train
        Node currentCar = this.head;
        while (currentCar.next != null) {
            currentCar = currentCar.next; // Walk to the next car
        }

        // 4. We found the last car! Hook the new car to the end.
        currentCar.next = newCar;
    }

    // --- ACTION 2: DISPLAY EVERYTHING (Look inside all the cars) ---
    public void displayAll() {
        if (this.head == null) {
            System.out.println("The train is empty! No service history.");
            return;
        }

        // Start at the Engine and walk down the train
        Node currentCar = this.head;
        while (currentCar != null) {
            currentCar.data.printRecord(); // Print what is inside this car
            currentCar = currentCar.next;  // Move to the next car
        }
    }
    // --- ACTION 3: SORT THE TRAIN (Selection Sort by Date) ---
    public void sortHistoryByDate() {
        // If the train is empty or only has one car, it's already sorted!
        if (this.head == null || this.head.next == null) {
            return;
        }

        // 1. Start looking from the very first car
        Node current = this.head;

        while (current != null) {
            // 2. We guess that the current car has the oldest date
            Node oldestNode = current;

            // 3. We send a 'checker' down the rest of the train to look for older dates
            Node checker = current.next;

            while (checker != null) {
                // compareTo is a Java trick. If the checker's date is mathematically less than the oldest date...
                if (checker.data.getDate().compareTo(oldestNode.data.getDate()) < 0) {
                    oldestNode = checker; // We found a new oldest car!
                }
                checker = checker.next; // Move to the next car to keep looking
            }

            // 4. If we found an older car further down, we SWAP their cargo!
            if (oldestNode != current) {
                ServiceRecord tempCargo = current.data; // Hold current cargo in a temporary box
                current.data = oldestNode.data;         // Put the oldest cargo into current car
                oldestNode.data = tempCargo;            // Put the temporary cargo into the oldest car
            }

            // 5. Move to the next car in line and do it all again!
            current = current.next;
        }
    }
    // --- ACTION 4: DELETE A RECORD (Unhook a car from the train) ---
    public void deleteRecord(String date, String serviceType) {
        // 1. If the train is empty, do nothing
        if (this.head == null) {
            return;
        }

        // 2. If the very first car (the Engine) is the one we want to delete
        if (this.head.data.getDate().equals(date) && this.head.data.getServiceType().equals(serviceType)) {
            this.head = this.head.next; // The second car becomes the new Engine!
            return;
        }

        // 3. Send two inspectors down the train: one looks at the current car, one remembers the previous car
        Node current = this.head;
        Node previous = null;

        while (current != null) {
            // Did we find the matching car?
            if (current.data.getDate().equals(date) && current.data.getServiceType().equals(serviceType)) {
                // UNHOOK IT: Tell the previous car to hook directly to the car AFTER the current one
                previous.next = current.next;
                return; // We deleted it, so stop looking!
            }
            // Move both inspectors down one car
            previous = current;
            current = current.next;
        }
    }
}