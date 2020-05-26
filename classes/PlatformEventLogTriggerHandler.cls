/**
* @group Error Logging
* @description: <<Add description>>
* @author Vamsi Velampati (vvelampati@deloitte.com)
* @date 05/25/2020
* @version 1.0
*/
public class PlatformEventLogTriggerHandler implements ITriggerHandler {
    
    /**
* @description this is the static instance variable to make this class as
* singleton
*/
    private static ITriggerHandler instance;
    private PlatformEventLogService platformEventLogServiceInstance;
    
    /**
* @description Constructor of ContactAddressTriggerHandler to initialize static instance
*/
    
    private PlatformEventLogTriggerHandler(PlatformEventLogService platformEventLogServiceInstance) {
        this.platformEventLogServiceInstance = platformEventLogServiceInstance;
    }
    /**
* @description Method checks for existing instance of handler and if not
* present then creates one.
* @return ITriggerHandler type of object.
*/
    public static ITriggerHandler getInstance() {
        if (instance == null) {
            instance = new PlatformEventLogTriggerHandler(PlatformEventLogService.getInstance());
        }
        return instance;
    }
    
    /**
* @description Handles all the After Insert Events. Only this
* context is valid for platform event triggers
* @param newObjects list of records which has been inserted
* @param newMap map of records which has been inserted
*/
    public void onAfterInsert(List<sObject> newObjects, Map<Id, sObject> newMap) {
        
        List<Platform_Log_Event__e> newPlatformLogEventsList = (List<Platform_Log_Event__e>) newObjects;
        Map<Id,Platform_Log_Event__e> newPlatformLogEventsMap = (Map<Id, Platform_Log_Event__e>) newMap;
        
        platformEventLogServiceInstance.logEventsFromList(newPlatformLogEventsList);
        platformEventLogServiceInstance.LogEventsFromMap(newPlatformLogEventsMap);
        platformEventLogServiceInstance.LogEvents(newPlatformLogEventsList,newPlatformLogEventsMap);
        
    }
    
    /* DO NOT USE
* Platform event triggers only support after insert context
* Given that this trigger handler implements the ITriggerHandler
* interface, they had to be added
*/
    public void onBeforeInsert(List<sObject> newObjects) {}
    
    
    public void onBeforeUpdate(List<sObject> newObjects,
                               List<sObject> oldObjects,
                               Map<Id, sObject> newMap, 
                               Map<Id, sObject> oldMap) {}
    
    public void onAfterUpdate(List<sObject> newObjects,
                              List<sObject> oldObjects,
                              Map<Id, sObject> newMap,
                              Map<Id, sObject> oldMap) {
                                  
                              }
    
    public void onBeforeDelete(List<sObject> oldObjects, 
                               Map<Id, sObject> oldMap) {
                                   
                               }
    
    public void onAfterDelete(List<sObject> oldObjects, Map<Id, 
                              sObject> oldMap) {
                                  
                              }
    
    public void onAfterUndelete(List<sObject> newObjects, 
                                Map<Id, sObject> newMap) {
                                    
                                }
    
}