/**
* @group Utility
* @description ITriggerHandler is a public interface to enforce consistent
* function names across all trigger handlers. It's also used in
* TriggerDispatcher to reduce duplicate flow control code in the
* Trigger definition
* @author Vamsi Velampati (vvelampati@deloitte.com)
* @date 05/04/2020
* @version 1.0
*/
public interface ITriggerHandler 
{
    void onBeforeInsert(List<SObject> newList);
    void onAfterInsert(List<SObject> newList, Map<Id, SObject> newMap);
    
    void onBeforeUpdate(List<SObject> oldList, List<SObject> newList, 
                      Map<Id, SObject> newMap, Map<Id, SObject> oldMap);
    
    void onAfterUpdate(List<SObject> oldList, List<SObject> newList, 
                     Map<Id, SObject> newMap, Map<Id, SObject> oldMap);
    
    
    void onBeforeDelete(List<SObject> oldList, Map<Id, SObject> oldMap);
    void onAfterDelete(List<SObject> oldList, Map<Id, SObject> oldMap);
    
    void onAfterUndelete(List<SObject> oldList, Map<Id, SObject> oldMap);
    
}