public class CaseTriggerHelper {

    public static void runPreInsert(List<Case> reservationRequests) {

    }

    public static void runPreUpdate(Map<Id, Case> reservationRequests) {

    }

    private static boolean validateReservationRequests(List<Case> reservationRequests){
        for (Case reservationRequest : reservationRequests){
            List<Contact> reservationRequestAttendees = AccountService.getAccountById(reservationRequest).Contacts;
            if(reservationRequestAttendees.size() == 0){
                //error
            }
            if(reservationRequest.Origin == 'Web' reservationRequestAttendees.size() != 1){
                //error
            }
            if(reservationRequest.Origin == 'Phone' reservationRequestAttendees.size() > 3){
                //error
            }
        }
    }
    
    private static boolean registerAttendees(List<Case> reservationRequests){
        for (Case reservationRequest : reservationRequests){
            if(resRequest.Status == EventBooking_Utils.CLOSED_CASE){
                List<Contact> attendees = ContactService.getContactsByAccountId(resRequest.AccountId);
                fo(Contact attendee : attendees){
                    try{
                        HerokuSystemService.registerAttendee(attendee);
                        EmailService.notifyAttendee();
                    }catch(Error error){

                    }
                }
            }
        }
    }
}