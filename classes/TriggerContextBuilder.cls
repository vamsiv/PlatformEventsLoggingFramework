@isTest public class TriggerContextBuilder {
    private
        boolean isExecuting = false;
    private
        boolean isInsert = false;
    private
        boolean isUpdate = false;
    private
        boolean isDelete = false;
    private
        boolean isUndelete = false;
    private
        boolean isBefore = false;
    private
        boolean isAfter = false;
    private
        List<sObject> newObjects = null;
    private
        List<sObject> oldObjects = null;
    private
        Map<ID, sObject> newMap = null;
    private
        Map<ID, sObject> oldMap = null;
    
    public
        TriggerContextBuilder setIsExecuting(Boolean isExecuting) {
            this.isExecuting = isExecuting;
            return this;
        }
    
    public
        TriggerContextBuilder setIsInsert(Boolean isInsert) {
            this.isInsert = isInsert;
            return this;
        }
    
    public
        TriggerContextBuilder setIsUpdate(Boolean isUpdate) {
            this.isUpdate = isUpdate;
            return this;
        }
    
    public
        TriggerContextBuilder setIsDelete(Boolean isDelete) {
            this.isDelete = isDelete;
            return this;
        }
    
    public
        TriggerContextBuilder setIsUndelete(Boolean isUndelete) {
            this.isUndelete = isUndelete;
            return this;
        }
    
    public
        TriggerContextBuilder setIsBefore(Boolean isBefore) {
            this.isBefore = isBefore;
            return this;
        }
    
    public
        TriggerContextBuilder setIsAfter(Boolean isAfter) {
            this.isAfter = isAfter;
            return this;
        }
    
    public
        TriggerContextBuilder setNewObjects(List<sObject> newObject) {
            this.newObjects = newObject;
            return this;
        }
    
    public
        TriggerContextBuilder setNewMap(Map<Id, sObject> newMap) {
            this.newMap = newMap;
            return this;
        }
    
    public
        TriggerContextBuilder setOldObjects(List<sObject> oldObjects) {
            this.oldObjects = oldObjects;
            return this;
        }
    
    public
        TriggerContextBuilder setOldMap(Map<Id, sObject> oldMap) {
            this.oldMap = oldMap;
            return this;
        }
    
    public
        TriggerContextData build() {
            return new TriggerContextData(isExecuting,
                                          isInsert,
                                          isUpdate,
                                          isDelete,
                                          isUndelete,
                                          isBefore,
                                          isAfter,
                                          newObjects,
                                          oldObjects,
                                          newMap,
                                          oldMap);
        }
}