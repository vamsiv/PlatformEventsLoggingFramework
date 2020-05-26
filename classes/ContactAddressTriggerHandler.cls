/**
* @group ContactAddress
* @description  an implementation of TriggerHandler that handles all trigger
* events for the Contact Address object. Please use getInstance() to get
* a singleton instance instead of using constructor() which will
* fail during compile time.
* @author Vamsi Velampati (vvelampati@deloitte.com)
* @date 05/04/2020
* @version 1.0
*/
public class ContactAddressTriggerHandler implements ITriggerHandler{
    
  
    /**
* @description this is the static instance variable to make this class as
* singleton
*/
    private static ITriggerHandler instance;
    private ContactAddressService contactAddressServiceInstance;
    
    /**
* @description Constructor of ContactAddressTriggerHandler to initialize static instance
*/

    private ContactAddressTriggerHandler(ContactAddressService contactAddressServiceInstance) {
        this.contactAddressServiceInstance = contactAddressServiceInstance;
    }
    /**
* @description Method checks for existing instance of handler and if not
* present then creates one.
* @return ITriggerHandler type of object.
*/
    public static ITriggerHandler getInstance() {
        if (instance == null) {
            instance = new ContactAddressTriggerHandler(ContactAddressService.getInstance());
        }
        return instance;
    }
    /**
* @description Handles all the Before Insert Events
* @param newObjects the list of objects to be inserted
*/
    public void onBeforeInsert(List<sObject> newObjects) {
        List<Contact_Address__c> newContactAddressList = (List<Contact_Address__c>) newObjects;
        contactAddressServiceInstance.checkForMultipleActiveAddresses(newContactAddressList);
        
        
    }
    /**
* @description Handles all the After Insert Events
* @param newObjects list of records which has been inserted
* @param newMap map of records which has been inserted
*/
    public void onAfterInsert(List<sObject> newObjects, Map<Id, sObject> newMap) {
        
    }
    /**
* @description Handles all the Before Update Events
* @param newObjects updated list of records
* @param oldObjects list of records which is getting updated
* @param newMap updated map of records
* @param oldMap map of records which is getting updated
*/
    public void onBeforeUpdate(List<sObject> newObjects,List<sObject> oldObjects,Map<Id, sObject> newMap, Map<Id, sObject> oldMap) {
   		
        List<Contact_Address__c> newContactAddressList = (List<Contact_Address__c>) newObjects;
        contactAddressServiceInstance.checkForMultipleActiveAddresses(newContactAddressList);
        
    }
    /**
* @description Handles all the After Update Events
* @param newObjects updated list of records
* @param oldObjects list of records which is getting updated
* @param newMap updated map of records
* @param oldMap map of records which is getting updated
*/
    public void onAfterUpdate(List<sObject> newObjects,
                              List<sObject> oldObjects,
                              Map<Id, sObject> newMap,
                              Map<Id, sObject> oldMap) {
                                  
                              }
    /**
* @description Handles all the Before Delete Events
* @param oldObjects list of records which is getting deleted
* @param oldMap map of records which is getting deleted
*/
    public void onBeforeDelete(List<sObject> oldObjects, Map<Id, sObject> oldMap) {
        
    }
    /**
* @description Handles all the After Delete Events
* @param oldObjects list of records which has been deleted
* @param oldMap map of records which has been deleted
*/
    public void onAfterDelete(List<sObject> oldObjects, Map<Id, sObject> oldMap) {
        
    }
    /**
* @description Handles all the After Undelete Events
* @param newObjects list of records undeleted
* @param newMap map of records undeleted
*/
    public void onAfterUndelete(List<sObject> newObjects, Map<Id, sObject> newMap) {
    }
}