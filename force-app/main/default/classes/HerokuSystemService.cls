public class HerokuSystemService {

    private String webServiceURL;

    public HerokuSystemService(){
        this.webServiceURL = 'https://th-apex-http-callout.herokuapp.com/animals';
    }

    public void registerAttendee(Contact attendee){
        HttpClient httpClient = new HttpClient(this.webServiceURL);
        try{
            HerokuAttendeeRequestBody herokuAttendeeRequestBody = new HerokuAttendeeRequestBody(attendee.name, attendee.email);
            httpClient.post(herokuAttendeeRequestBody);
        }catch(Error error){
            throw new Exception(error.getMessage());
        }
    }

    public class HerokuAttendeeRequestBody {
        public String name {get; set;}
        public String email {get; set;}

        public HerokuAttendeeRequestBody(String name, String email){
            this.name = name;
            this.email = email;
        }
    } 

}
