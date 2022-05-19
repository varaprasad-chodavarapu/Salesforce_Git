@IsTest
private class DialyLeadProcessorTest{
    // Dummy CRON expression: midnight on March 15.
    // Because this is a test, job executes
    // immediately after Test.stopTest().
    public static String CRON_EXP = '0 0 0 15 3 7 ? 2022';
    static testmethod void testScheduledJob() {
        // Create some out of date Opportunity records
        List<Lead> leads = new List<Lead>();
       // Date closeDate = Date.today().addDays(-7);
        for (Integer i=0; i<200; i++) {
            Lead l= new Lead(
                FirstName = 'First' + i,
               LastName= 'LastName',
                Company= 'The Inc'
            );
            leads.add(l);
        }
        insert leads;
        
        Test.startTest();
        // Schedule the test job
        String jobId = System.schedule('ScheduledApexTest',CRON_EXP,new DailyLeadProcessor());
        
       // System.assertEquals(0, lt.size(), 'Tasks exist before job has run');
        // Stopping the test will run the job synchronously
        Test.stopTest();
        // Now that the scheduled job has executed,
        // check that we 200 leadswith dreamforce
	List<Lead> checkleads= new List<Lead>();
        checkleads= [SELECT Id FROM Lead
            WHERE LeadSource='Dreamforce' and Company='The Inc'];
            
        System.assertEquals(200,
            checkleads.size(),
            'leads were not created');
    }
}