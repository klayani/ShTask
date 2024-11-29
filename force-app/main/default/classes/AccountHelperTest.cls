@isTest
public class AccountHelperTest {
    @isTest
    static void testCreateAccount() {
        // Test with valid account name
        String accountName = 'Test Account';
        String result = AccountHelper.createAccount(accountName);
        System.assert(result.startsWith('Account created with Id:'), 'Account creation failed.');

        // Verify the account was inserted
        Account insertedAccount = [SELECT Id, Name FROM Account WHERE Name = :accountName];
        System.assertEquals(accountName, insertedAccount.Name);

        // Test with blank account name (expecting an exception)
        Test.startTest();
        try {
            AccountHelper.createAccount('');
            System.assert(false, 'Expected exception was not thrown.');
        } catch (IllegalArgumentException e) {
            System.assertEquals('Account name cannot be blank', e.getMessage());
        }
        Test.stopTest();
    }
}