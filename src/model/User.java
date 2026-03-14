package model;

public class User {

    // We make these 'private' to keep them safe (This is Encapsulation!)
    private String username;
    private String password;

    // This is the "Constructor" - it creates the user
    public User(String username, String password) {
        this.username = username;
        this.password = password;
    }

    // These are "Getters" so we can look at the data later
    public String getUsername() {
        return username;
    }

    public String getPassword() {
        return password;
    }
}