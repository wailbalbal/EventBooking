public class CaseTriggerHelper {

    public static Account getAccountById(Id accId){
        return [SELECT Id, (SELECT Id FROM Contacts) FROM Account WHERE Id = :accId LIMIT 1];
    }
    
}