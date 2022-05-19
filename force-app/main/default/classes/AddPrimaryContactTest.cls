@IsTest
public class AddPrimaryContactTest {
    @isTest static void TestList(){
        List<Account> teste=new  List<Account>();
        for(integer i=0;i<50;i++){
            teste.add(new Account(Billingstate='CA',name='Test' + i));
        }
        for(integer j=0;j<50;j++){
            teste.add(new Account(Billingstate='CA',name='Test' + j));  
        }
        insert teste;
        
        Contact co=new Contact();
        co.FirstName='demo';
        co.LastName='demo';
        insert co;
        
        string state='CA';
        
        AddPrimaryContact apc= new AddPrimaryContact(co,state);
        Test.startTest();
        system.enqueueJob(apc);
        Test.stopTest();
        
    }
}