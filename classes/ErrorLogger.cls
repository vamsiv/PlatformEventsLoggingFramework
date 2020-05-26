/**
* @group Error Logging
* @description: This is a General Error Report Class
* which will publish Platform Events with appropriate
* severity
* @author Vamsi Velampati (vvelampati@deloitte.com)
* @date 05/25/2020
* @version 1.0
*/

global class ErrorLogger {
    
    private static Log_Settings__c settingInstance = Log_Settings__c.getInstance();
    
    /**
* @description Call this method if  severity level is WARNING.
* @param  className  name of Apex Class in which Exception occured
* @param  methodName name of Apex Method in which Exception occured
* @param  recordId   Record Id for which Exception is occured
* @param  e          Exception object
*/
    global static void warningMsg(String className, String methodName, String recordId, Exception e) {
        publishLogMessage(e,className,'Level.WARNING', methodName, recordId);
    }
    
    /**
* @description  Call this method if you severity level is INFO.
* @param  className  name of Apex Class in which Exception occured
* @param  methodName name of Apex Method in which Exception occured
* @param  recordId   Record Id for which Exception is occured
* @param  e          Exception object
*/
    public static void infoMsg(String className, String methodName, String recordId, Exception e) {
        publishLogMessage(e,className,'Level.INFO', methodName, recordId);
    }
    
    /**
* @description Call this method if severity level is CONFIG.
* @param  className  name of Apex Class in which Exception occured
* @param  methodName name of Apex Method in which Exception occured
* @param  recordId   Record Id for which Exception is occured
* @param  e          Exception object
*/
    public static void configMsg(String className, String methodName, String recordId, Exception e) {
        publishLogMessage(e,className,'Level.CONFIG', methodName, recordId); 
    }
    
    /**
* @description Call this method if  severity level is FINE.
* @param  className  name of Apex Class in which Exception occured
* @param  methodName name of Apex Method in which Exception occured
* @param  recordId   Record Id for which Exception is occured
* @param  e          Exception object
*/
    public static void fineMsg(String className, String methodName, String recordId, Exception e) {
        publishLogMessage(e,className,'Level.FINE', methodName, recordId); 
    }
    
    /**
* @description Call this method if  severity level is FINER.
* @param  className  name of Apex Class in which Exception occured
* @param  methodName name of Apex Method in which Exception occured
* @param  recordId   Record Id for which Exception is occured
* @param  e          Exception object
*/
    public static void finerMsg(String className, String methodName, String recordId, Exception e) {
        publishLogMessage(e,className,'Level.FINER', methodName, recordId); 
    }
    
    /**
* @description Call this method if  severity level is FINEST.
* @param  className  name of Apex Class in which Exception occured
* @param  methodName name of Apex Method in which Exception occured
* @param  recordId   Record Id for which Exception is occured
* @param  e          Exception object
*/
    public static void finestMsg(String className, String methodName, String recordId, Exception e) {
        publishLogMessage(e,className,'Level.FINEST', methodName, recordId); 
    }
    
    /**
* @description Call this method if  severity level is SEVERE.
* @param  className  name of Apex Class in which Exception occured
* @param  methodName name of Apex Method in which Exception occured
* @param  recordId   Record Id for which Exception is occured
* @param  e          Exception object
*/
    public static void severeMsg(String className, String methodName, String recordId, Exception e) {
        publishLogMessage(e,className,'Level.SEVERE', methodName, recordId); 
    }
    
    
    global static void publishLogMessage(Exception e, String className, String level, String methodName, String recordId){
        
        Platform_Log_Event__e exceptionEvent = new Platform_Log_Event__e();
        
        
        exceptionEvent.Class_Name__c = className;
        exceptionEvent.Exception_Type__c = e.getTypeName();
        exceptionEvent.Level__c = level;
        exceptionEvent.Line_Number__c = e.getLineNumber();
        exceptionEvent.Message__c = e.getMessage();
        exceptionEvent.Method__c = methodName;
        exceptionEvent.Record_URL__c = recordId;
        exceptionEvent.Stack_Trace__c = e.getStackTraceString();
        exceptionEvent.User_Email__c = UserInfo.getUserEmail();
        
        if(isPublishingEventLogsEnabled()){
            EventBus.publish(exceptionEvent);
        }
        
    }
    
    
    /**
* @description Method to publish a platform event record for Database methods with
* Database.Error.
* @param  Level      error log level
* @param  className  name of Apex Class in which error occured
* @param  methodName name of Apex Method in which error occured
* @param  lineNum    Line Number in which error is occured
* @param  e          Database.Error object
*/
    public static void publishDatabaseError(String level, String className, String methodName, Integer lineNum, Database.Error e) {
        
        Platform_Log_Event__e exceptionEvent = new Platform_Log_Event__e(Class_Name__c = className,
                                                                         Exception_Type__c = String.valueOf(e.getStatusCode()),
                                                                         Line_Number__c = lineNum,
                                                                         Method__c = methodName,
                                                                         Message__c = e.getMessage(),
                                                                         Level__c = String.valueOf(level),
                                                                         Stack_Trace__c = e.getMessage(),
                                                                         User_Email__c = UserInfo.getUserEmail());
        
        if(isPublishingEventLogsEnabled()){
            EventBus.publish(exceptionEvent);
        }
    }
    
    public static boolean isPublishingEventLogsEnabled(){
        return settingInstance != null && !settingInstance.Is_Publishing_Event_Log_Bypassed__c;
    }
    
}