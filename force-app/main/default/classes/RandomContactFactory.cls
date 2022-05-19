public class RandomContactFactory {
    public static  List<Contact> generateRandomContacts(Integer numofContacts,String lastname){
        List<Contact> contacts=new List<Contact>();
        for(Integer i=0;i<numofcontacts;i++) {
            Contact c= new Contact(FirstName='Test' + i,LastName=lastname);
            contacts.add(c);
}
system.debug(contacts);
return contacts;
}
}