/**
* @group Utility
* @description  TriggerContextData is a Parameter Object for Trigger Context
* Variables. It servces the purpose to hold the information from
* Trigger to TriggerDispatcher.
* @author Vamsi Velampati (vvelampati@deloitte.com)
* @date 05/04/2020
* @version 1.0
*/
public
class TriggerContextData {
    /*
* The properties are defined with private modifier to prevent changes outside of Trigger
* contexts. The only place a developer should touch TriggerContextData is inside the Trigger
* definition using TriggerContextData constructor.
*/
    
    /**
* @description true if the current context for the Apex code is a trigger,
* not a Visualforce page, a Web service, or an executeanonymous() API call.
*/
    public boolean isExecuting {
        get;
        private set;
    }
    
    /**
* @description true if this trigger was fired due to an insert operation,
* from the Salesforce user interface, Apex, or the API.
*/
    public boolean isInsert {
        get;
        private set;
    }
    
    /**
* @description true if this trigger was fired due to an update operation,
* from the Salesforce user interface, Apex, or the API.
*/
    public boolean isUpdate {
        get;
        private set;
    }
    
    /**
* @description true if this trigger was fired due to a delete operation,
* from the Salesforce user interface, Apex, or the API.
*/
    public boolean isDelete {
        get;
        private set;
    }
    
    /**
* @description true if this trigger was fired after a record is recovered
* from the Recycle Bin (that is, after an undelete operation from the
* Salesforce user interface, Apex, or the API.)
*/
    public boolean isUndelete {
        get;
        private set;
    }
    
    /**
* @description true if this trigger was fired before any record was saved.
*/
    public boolean isBefore {
        get;
        private set;
    }
    
    /**
* @description true if this trigger was fired after all records were saved.
*/
    public boolean isAfter {
        get;
        private set;
    }
    
    /**
* @description A list of the new versions of the sObject records. This
* sObject list is only available in insert, update, and undelete triggers,
* and the records can only be modified in before triggers.
*/
    public List<sObject> newObjects {
        get;
        private set;
    }
    
    /**
* @description A list of the old versions of the sObject records.
* This sObject list is only available in update and delete triggers.
*/
    public List<sObject> oldObjects {
        get;
        private set;
    }
    
    /**
* @description A map of IDs to the new versions of the sObject records.
* This map is only available in before update, after insert, after update,
* and after undelete triggers.
*/
    public Map<ID, sObject> newMap {
        get;
        private set;
    }
    
    /**
* @description A map of IDs to the old versions of the sObject records.
* This map is only available in update and delete triggers.
*/
    public Map<ID, sObject> oldMap {
        get;
        private set;
    }
    
    /**
* Constructor of TriggerContextData. The consturctor assigns
* all trigger context information in this data class.
* All properties are private set and public get, so developer
* cannot and should not modify values once the object is initialized.
*
* Due to Salesforce limitations, there is no compile time check
* for the parameters passed into constructor.
* Please make sure to pass all context variables in the right order!
*/
    public TriggerContextData(boolean isExecuting,
                              boolean isInsert,
                              boolean isUpdate,
                              boolean isDelete,
                              boolean isUndelete,
                              boolean isBefore,
                              boolean isAfter,
                              List<sObject> newObjects,
                              List<sObject> oldObjects,
                              Map<ID, sObject> newMap,
                              Map<ID, sObject> oldMap) {
                                  this.isExecuting = isExecuting;
                                  this.isInsert = isInsert;
                                  this.isUpdate = isUpdate;
                                  this.isDelete = isDelete;
                                  this.isUndelete = isUndelete;
                                  this.isBefore = isBefore;
                                  this.isAfter = isAFter;
                                  this.newObjects = newObjects;
                                  this.oldObjects = oldObjects;
                                  this.newMap = newMap;
                                  this.oldMap = oldMap;
                              }
}