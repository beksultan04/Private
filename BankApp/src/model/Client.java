package model;

public class Client {
    private String firstName;
    private String lastName;
    private String passportNumber;
    private Account account;

    public Client(String firstName, String lastName, String passportNumber, Account account) {
        this.firstName = firstName;
        this.lastName = lastName;
        this.passportNumber = passportNumber;
        this.account = account;
    }

    public String getFullName() {
        return firstName + " " + lastName;
    }

    public String getPassportNumber() {
        return passportNumber;
    }

    public Account getAccount() {
        return account;
    }

    public Object[] toArray() {
        return new Object[]{firstName, lastName, passportNumber, account.getAccountNumber(), account.getBalance()};
    }
}