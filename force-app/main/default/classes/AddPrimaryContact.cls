public class AddPrimaryContact implements Queueable{
	private Contact c;
    private String state;
    public AddPrimaryContact(Contact c,String state){
        this.c=c;
        this.state=state;
    }
    public void execute(QueueableContext context){
        List<Account> ListAccount=[select Id,name,(select FirstName,LastName from Contacts) from Account where
                                  Billingstate =:state LIMIT 200];
        List<Contact> lscont=new List<Contact>();
        for(Account acc:ListAccount){
            Contact cont=c.clone(false,false,false,false);
            cont.AccountId=acc.Id;
            lscont.add(cont);
            if(lscont.size()>0)	{
                insert lscont;
            }
            
            
        }
    }
}