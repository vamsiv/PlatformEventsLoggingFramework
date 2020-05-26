/**
* @group ByPassLogicModel
* @description Return boolean based on data present in the hierarchial
* custom setting ByPass_Setting__c
* @author Vamsi Velampati (vvelampati@deloitte.com)
* @date 05/04/2020
* @version 1.0
*/
public
class ByPassLogicModel {
    private static Bypass_Settings__c settingInstance = Bypass_Settings__c.getInstance();



/**
* @description Method checks for custom setting data related to trigger
* bypass for Platform Event Log object.
* @return Boolean
* This will return true if custom setting checkbox Is_Platform_Event_Log_Trigger_Bypassed__c is checked.
*/
    public static Boolean isPlatformEventLogTriggerByPassed() {
        return settingInstance != null && settingInstance.Is_Platform_Event_Log_Bypassed__c;
    }
    
}