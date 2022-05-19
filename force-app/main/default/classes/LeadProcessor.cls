public class LeadProcessor implements
    Database.Batchable<sObject>, Database.Stateful {
    // instance member to retain state across transactions
    public Integer recordsProcessed = 0;
    public Database.QueryLocator start(Database.BatchableContext bc) {
        return Database.getQueryLocator(
            'SELECT ID from Lead'
        );
    }
    public void execute(Database.BatchableContext bc, List<Lead> scope){
        // process each batch of records
        //  LeadProcessorTest
        List<Lead> leads=new List<Lead>(); 
        for (Lead lead : scope) {
          lead.LeadSource='Dreamforce'; 
            leads.add(lead);
		            
        }
        update leads;
        
    }
    public void finish(Database.BatchableContext bc){
       
      
    }
}