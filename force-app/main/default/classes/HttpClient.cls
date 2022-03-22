public class HttpClient {

    private Http httpInstance = new Http();

    public HttpClient(String endpoint){
        Http http = new Http();
        
    }

    public void post(object body){
        HttpRequest request = new HttpRequest();
        request.setEndpoint(endpoint);
        request.setMethod('POST');
        request.setHeader('Content-Type', 'application/json;charset=UTF-8');
        request.setBody(JSON.serialize(body));
        HttpResponse response = http.send(request);
        if (response.getStatusCode() != 201) {
            System.debug('The status code returned was not expected: ' +
                response.getStatusCode() + ' ' + response.getStatus());
            //throw error;
        }
    }
}