public class ContactService {

    public static List<Contact> getContactsByAccountId(Id accountId){
        return [SELECT Id, Name, Email FROM Contact WHERE accountid = accountId];
    }
    
}