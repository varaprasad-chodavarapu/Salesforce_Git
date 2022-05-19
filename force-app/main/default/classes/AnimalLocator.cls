public class AnimalLocator {
    public static String  getAnimalNameById(Integer Id) {
       string animalName;
       
        Http http = new Http();
        HttpRequest request = new HttpRequest();
        request.setEndpoint('https://th-apex-http-callout.herokuapp.com/animals/'+Id);
        request.setMethod('GET');
        HttpResponse response = http.send(request);
        // If the request is successful, parse the JSON response.
        if(response.getStatusCode() == 200) {
            Map<String ,Object> r=(Map<String,Object>)
                JSON.deserializeUntyped(response.getBody());
            Map<String,Object> animal=  (Map<String,Object>)r.get('animal');
            animalName=String.valueOf(animal.get('name'));
          //  System.debug('animalName');
             
        }
       return animalName;
    }
}

//Apex Rest Callouts