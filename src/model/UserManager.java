package model;

import java.io.BufferedWriter;
import java.io.FileWriter;
import java.io.IOException;
import java.io.BufferedReader;
import java.io.FileReader;

public class UserManager {

    // This is our "Save" action. It takes a model.User blueprint as a rule.
    public void registerUser(User newUser) {

        // We use a "try" block because sometimes files get stuck or broken
        try {
            // "users.txt" is the name of our file.
            // The word "true" means "add to the bottom of the list, don't erase the old ones!"
            FileWriter file = new FileWriter("users.txt", true);
            BufferedWriter writer = new BufferedWriter(file);

            // We write the username, then a comma, then the password
            writer.write(newUser.getUsername() + "," + newUser.getPassword());

            // This presses the "Enter" key to start a new line for the next person
            writer.newLine();

            // We MUST close the file to lock it and save it!
            writer.close();

            System.out.println("Success! The user was saved to the file.");

        } catch (IOException error) {
            System.out.println("Oops! Could not save the file.");
        }
    }
    // You will need to add these two imports at the very top of your file if they aren't there:
    // import java.io.BufferedReader;
    // import java.io.FileReader;

    // This is our "Read" action. It checks if the username and password match.
    public boolean loginUser(String searchUsername, String searchPassword) {
        try {
            // BufferedReader is like a scanner that reads the file line by line
            FileReader file = new FileReader("users.txt");
            BufferedReader reader = new BufferedReader(file);

            String line;
            // This loop says: "Keep reading until there are no more lines"
            while ((line = reader.readLine()) != null) {

                // We split the line at the comma.
                // parts[0] is the username, parts[1] is the password.
                String[] parts = line.split(",");

                // If both the username AND the password match, let them in!
                if (parts[0].equals(searchUsername) && parts[1].equals(searchPassword)) {
                    System.out.println("Welcome back, " + searchUsername + "!");
                    reader.close();
                    return true; // Yes, they are allowed in!
                }
            }

            // If it checks the whole file and finds nothing...
            System.out.println("Wrong username or password.");
            reader.close();

        } catch (IOException error) {
            System.out.println("Oops! Could not read the file.");
        }
        return false; // No, they are not allowed in.
    }
}
