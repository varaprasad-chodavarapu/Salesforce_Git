@IsTest
public class TestRestrictContactByName {
    @isTest static void createBadConact(){
        Contact c=new Contact(FirstName='John',LastName='INVALIDNAME');
        Test.startTest();
        Database.SaveResult result = Database.insert(c, false);
        Test.stopTest();
        System.assert(!result.isSuccess());
    }

}