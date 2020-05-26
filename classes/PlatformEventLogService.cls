/**
* @group Error Logging
* @description Service class for Platform Event Log Platform Event object
* @author Vamsi Velampati (vvelampati@deloitte.com)
* @date 05/25/2020
* @version 1.0
*/
public class PlatformEventLogService {
  
    private static PlatformEventLogService instance = null;
    
    public static PlatformEventLogService getInstance(){
        if(instance == null){
            instance = new PlatformEventLogService();
        }
        
        return instance;
    }
    
    public void logEventsFromList(List<Platform_Log_Event__e> logEventsList){
        List<Apex_Error_Log__c> errorLogs = new List<Apex_Error_Log__c>();
        
        for(Platform_Log_Event__e logEvent : logEventsList){
            Apex_Error_Log__c logLineItem = new Apex_Error_Log__c();
          
            logLineItem.Class_Name__c = logEvent.Class_Name__c;
            logLineItem.Exception_Type__c = logEvent.Exception_Type__c;
            logLineItem.Level__c = logEvent.Level__c;
            logLineItem.Line_Number__c = logEvent.Line_Number__c;
            logLineItem.Message__c = logEvent.Message__c;
            logLineItem.Method__c = logEvent.Method__c;
            logLineItem.Record_URL__c = logEvent.Record_URL__c;
            logLineItem.Stack_Trace__c = logEvent.Stack_Trace__c;
            logLineItem.User_Email__c = logEvent.User_Email__c;
            
            errorLogs.add(logLineItem);
        }
        
        insert errorLogs;
    }
   	
    public void logEventsFromMap(Map<Id,Platform_Log_Event__e> platformEventsMap){
        
    }
    
    public void logEvents(List<Platform_Log_Event__e> platformEventsList, Map<Id, Platform_Log_Event__e> platformEventsMap){
        
    }
}