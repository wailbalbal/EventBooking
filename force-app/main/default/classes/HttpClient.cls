public class HttpClient {

    private Http httpInstance;

    public HttpClient(String endpoint){
        httpInstance = new Http();
        
    }

    public HttpResponse post(object body){
        HttpRequest request = new HttpRequest();
        request.setEndpoint(endpoint);
        request.setMethod('POST');
        request.setHeader('Content-Type', 'application/json;charset=UTF-8');
        request.setBody(JSON.serialize(body));
        HttpResponse response = httpInstance.send(request);
        if (response.getStatusCode() != 201) {
            throw new Exception('The status code returned was not expected: ' +
                response.getStatusCode() + ' ' + response.getStatus());
        }
        return response
    }
}