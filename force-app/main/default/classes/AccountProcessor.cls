public class AccountProcessor {
    @future
    public static void  countContacts(List<Id> accountids){
        List<Account> accList=[select Id,Number_Of_Contacts__c,(select Id from Contacts) from 
                              Account where Id in:accountids];  
            for(Account acc: accList){
                acc.Number_Of_Contacts__c=acc.Contacts.size();
            }
        update accList;
    }
}