public class CaseTriggerHelper {

    public static void runPreInsert(List<Case> reservationRequests) {
        validateReservationRequests(reservationRequests);
    }

    public static void runPreUpdate(Map<Id, Case> reservationRequests) {
        registerAttendees(reservationRequests);
    }

    private static void validateReservationRequests(List<Case> reservationRequests){
        for (Case reservationRequest : reservationRequests){
            Account requestAccount = AccountService.getAccountById(reservationRequest);
            if(requestAccount == null){
                this.hundleReservationRequestError(reservationRequest, 'You cannot create a request without attaching an account');
                return;
            }
            List<Contact> reservationRequestAttendees = AccountService.getAccountById(reservationRequest).Contacts;
            if(reservationRequestAttendees.size() == 0){
                this.hundleReservationRequestError(reservationRequest, 'You cannot create a request for accounts without contacts');
                return;
            }
            if(reservationRequest.Origin == 'Web' reservationRequestAttendees.size() != 1){
                this.hundleReservationRequestError(reservationRequest, 'Web request are only allowed to have one attendee');
                return;
            }
            if(reservationRequest.Origin == 'Phone' reservationRequestAttendees.size() > 3){
                this.hundleReservationRequestError(reservationRequest, 'Phone request are only allowed to have three attendee');
                return;
            }
        }
    }
    
    private static boolean registerAttendees(List<Case> reservationRequests){
        for (Case reservationRequest : reservationRequests){
            if(resRequest.Status == 'CLOSED'){
                List<Contact> attendees = ContactService.getContactsByAccountId(resRequest.AccountId);
                fo(Contact attendee : attendees){
                    try {
                        HerokuSystemService.registerAttendee(attendee);
                        EmailService.notifyAttendee();
                    } catch(Error error){
                        Log.debug(error);
                        Log.error('Could not register attendees');
                    }
                }
            }
        }
    }

    private static void hundleReservationRequestError(Case reservationRequest, string errorMessage){
        Log.error(errorMessage);
        reservationRequest.addError(errorMessage);
    }
}