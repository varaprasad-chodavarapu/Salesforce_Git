@isTest
private class ParkLocatorTest {
    @isTest static void testCallout() {              
        // This causes a fake response to be generated
        Test.setMock(WebServiceMock.class, new ParkServiceMock());
        // Call the method that invokes a callout
        String country = 'United States';
        //Double y = 2.0;
        List<String> result = ParkLocator.country(country);
        // Verify that a fake result is returned
        List<String> parks=new List<String>();
        parks.add('Yosemite');
        parks.add('Yelow Stone');
        parks.add('Another park');
        System.assertEquals(parks, result); 
    }
}