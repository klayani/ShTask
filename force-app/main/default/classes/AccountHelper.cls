public class AccountHelper {
    // Method to create a new account
    public static String createAccount(String accountName) {
        if (String.isBlank(accountName)) {
            throw new IllegalArgumentException('Account name cannot be blank');
        }
        
        Account acc = new Account(Name = accountName);
        insert acc;
        return 'Account created with Id: ' + acc.Id;
    }
}