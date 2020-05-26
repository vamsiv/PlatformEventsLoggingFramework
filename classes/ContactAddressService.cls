/**
* @group ContactAddress
* @description Service class for Contact_Address__c custom object
* @author Vamsi Velampati (vvelampati@deloitte.com)
* @date 05/04/2020
* @version 1.0
*/
public class ContactAddressService {
   
    private final static String IsActiveAddressErrorMsg = 'An active address already exists for this contact. Please deactivate the active record prior to marking this record as active';
    private final static Integer maxNumberActiveAddressesPerContact = 1;
    private static ContactAddressService instance = null;
    
    
    public static ContactAddressService getInstance(){
        if(instance == null){
            instance = new ContactAddressService();
        }
        
        return instance;
    }
    
    
    public void checkForMultipleActiveAddresses(List<Contact_Address__c> newContactAddressList){
        
        Map<Id, Integer> contacToNumContactAddressesMap = new Map<Id, Integer>();
        for (AggregateResult aggRes : [
            SELECT COUNT(ID) numContactAddresses, Contact__c contactId
            FROM Contact_Address__c
            WHERE Is_Active_Address__c = true
            GROUP BY Contact__c
        ]) {
            Id contactId = (Id) aggRes.get('contactId');
            Integer numContactAddresses = (Integer) aggRes.get('numContactAddresses');
            contacToNumContactAddressesMap.put(contactId, numContactAddresses);
        }
        
        for(Contact_Address__c newContactAddress: newContactAddressList){
            if(contacToNumContactAddressesMap.get(newContactAddress.Contact__c)>= maxNumberActiveAddressesPerContact && newContactAddress.Is_Active_Address__c == true){
                newContactAddress.is_active_address__c.addError(IsActiveAddressErrorMsg);                
            }
        }
    }
}