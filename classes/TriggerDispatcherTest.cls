/**
* @group Utility
* @description Test class for TriggerDispatcher which assigns different event
* to ITriggerHandler based on the flags stored in TriggerContextData object
*/
@isTest public class TriggerDispatcherTest {
    enum TriggerEvent {
        BEFORE_INSERT,
            BEFORE_UPDATE,
            BEFORE_DELETE,
            AFTER_INSERT,
            AFTER_UPDATE,
            AFTER_DELETE,
            AFTER_UNDELETE,
            NOT_TRIGGERED
            }
    
    class FakeHandler implements ITriggerHandler {
        public TriggerEvent eventTriggered;
        
        public FakeHandler() {
            eventTriggered = TriggerEvent.NOT_TRIGGERED;
        }
        
        public void onBeforeInsert(List<sObject> newObjects) {
            eventTriggered = TriggerEvent.BEFORE_INSERT;
        }
        
        public void onAfterInsert(List<sObject> newObjects, Map<ID, sObject> newMap) {
            eventTriggered = TriggerEvent.AFTER_INSERT;
        }
        
        public void onBeforeUpdate(List<sObject> newObjects,
                                   List<sObject> oldObjects,
                                   Map<ID, sObject> newMap,
                                   Map<ID, sObject> oldMap) {
                                       eventTriggered = TriggerEvent.BEFORE_UPDATE;
                                   }
        
        public void onAfterUpdate(List<sObject> newObjects,
                                  List<sObject> oldObjects,
                                  Map<ID, sObject> newMap,
                                  Map<ID, sObject> oldMap) {
                                      eventTriggered = TriggerEvent.AFTER_UPDATE;
                                  }
        
        public void onBeforeDelete(List<sObject> oldObjects, Map<ID, sObject> oldMap) {
            eventTriggered = TriggerEvent.BEFORE_DELETE;
        }
        
        public void onAfterDelete(List<sObject> oldObjects, Map<ID, sObject> oldMap) {
            eventTriggered = TriggerEvent.AFTER_DELETE;
        }
        
        public void onAfterUndelete(List<sObject> newObjects, Map<ID, sObject> newMap) {
            eventTriggered = TriggerEvent.AFTER_UNDELETE;
        }
    }
    
    static testMethod void constructorShouldThrowNullExceptionWhenHandlerIsNull() {
        TriggerDispatcher sut = null;
        
        try {
            sut = new TriggerDispatcher(null, new TriggerContextBuilder().build());
        } catch (IllegalArgumentException e) {
        }
        
        System.assertEquals(null, sut, 'Constructor should throw IllegalArgumentException');
    }
    
    static testMethod void constructorShouldThrowNullExceptionWhenContextDataIsNull() {
        TriggerDispatcher sut = null;
        
        try {
            FakeHandler handler = new FakeHandler();
            sut = new TriggerDispatcher(handler, null);
        } catch (IllegalArgumentException e) {
        }
        
        System.assertEquals(null, sut, 'Constructor should throw IllegalArgumentException');
    }
    
    static testMethod void dispatchShouldNotTriggerEventWhenIsExecutingIsFalse() {
        TriggerContextData contextData = new TriggerContextBuilder()
            .setIsExecuting(false)
            .setIsBefore(true)
            .setIsDelete(true)
            .build();
        FakeHandler handler = new FakeHandler();
        TriggerDispatcher sut = new TriggerDispatcher(handler, contextData);
        
        try {
            sut.dispatch();
        } catch (Exception e) {
        }
        
        System.assertNotEquals(TriggerEvent.NOT_TRIGGERED, handler.eventTriggered);
    }
    
    static testMethod void dispatchShouldTriggerBeforeInsert() {
        TriggerContextData contextData = new TriggerContextBuilder()
            .setIsExecuting(true)
            .setIsBefore(true)
            .setIsInsert(true)
            .build();
        FakeHandler handler = new FakeHandler();
        TriggerDispatcher sut = new TriggerDispatcher(handler, contextData);
        
        sut.dispatch();
        
        System.assertEquals(
            TriggerEvent.BEFORE_INSERT, handler.eventTriggered, 'BEFORE_INSERT event is not triggered');
    }
    
    static testMethod void dispatchShouldTriggerBeforeUpdate() {
        TriggerContextData contextData = new TriggerContextBuilder()
            .setIsExecuting(true)
            .setIsBefore(true)
            .setIsUpdate(true)
            .build();
        FakeHandler handler = new FakeHandler();
        TriggerDispatcher sut = new TriggerDispatcher(handler, contextData);
        
        sut.dispatch();
        
        System.assertEquals(
            TriggerEvent.BEFORE_UPDATE, handler.eventTriggered, 'BEFORE_UPDATE event is not triggered');
    }
    
    static testMethod void dispatchShouldTriggerBeforeDelete() {
        TriggerContextData contextData = new TriggerContextBuilder()
            .setIsExecuting(true)
            .setIsBefore(true)
            .setIsDelete(true)
            .build();
        FakeHandler handler = new FakeHandler();
        TriggerDispatcher sut = new TriggerDispatcher(handler, contextData);
        
        sut.dispatch();
        
        System.assertEquals(
            TriggerEvent.BEFORE_DELETE, handler.eventTriggered, 'BEFORE_DELETE event is not triggered');
    }
    
    static testMethod void dispatchShouldTriggerAfterInsert() {
        TriggerContextData contextData =
            new TriggerContextBuilder().setIsExecuting(true).setIsAfter(true).setIsInsert(true).build();
        FakeHandler handler = new FakeHandler();
        TriggerDispatcher sut = new TriggerDispatcher(handler, contextData);
        
        sut.dispatch();
        
        System.assertEquals(
            TriggerEvent.AFTER_INSERT, handler.eventTriggered, 'AFTER_INSERT event is not triggered');
    }
    
    static testMethod void dispatchShouldTriggerAfterUpdate() {
        TriggerContextData contextData =
            new TriggerContextBuilder().setIsExecuting(true).setIsAfter(true).setIsUpdate(true).build();
        FakeHandler handler = new FakeHandler();
        TriggerDispatcher sut = new TriggerDispatcher(handler, contextData);
        
        sut.dispatch();
        
        System.assertEquals(
            TriggerEvent.AFTER_UPDATE, handler.eventTriggered, 'AFTER_UPDATE event is not triggered');
    }
    
    static testMethod void dispatchShouldTriggerAfterDelte() {
        TriggerContextData contextData =
            new TriggerContextBuilder().setIsExecuting(true).setIsAfter(true).setIsDelete(true).build();
        FakeHandler handler = new FakeHandler();
        TriggerDispatcher sut = new TriggerDispatcher(handler, contextData);
        
        sut.dispatch();
        
        System.assertEquals(
            TriggerEvent.AFTER_DELETE, handler.eventTriggered, 'AFTER_DELETE is not triggered');
    }
    
    static testMethod void dispatchShouldTriggerAfterUndelete() {
        TriggerContextData contextData = new TriggerContextBuilder()
            .setIsExecuting(true)
            .setIsAfter(true)
            .setIsUndelete(true)
            .build();
        FakeHandler handler = new FakeHandler();
        TriggerDispatcher sut = new TriggerDispatcher(handler, contextData);
        
        sut.dispatch();
        
        System.assertEquals(TriggerEvent.AFTER_UNDELETE,
                            handler.eventTriggered,
                            'AFTER_UNDELETE event is not triggered');
    }
}