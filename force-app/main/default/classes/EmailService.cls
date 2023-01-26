public class EmailService {

    public void notifyAttendee(){
        Integer randomNumber = Integer.valueof((Math.random() * 5));
        if(randomNumber == 3){
            Log.error('Could not send mail to attendee');
            throw new Execption('Mail error stack message!');
        }
        Log.debug('mail sent!');
    }
    
}