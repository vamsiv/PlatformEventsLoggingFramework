/**
* @group Test Class
* @description  This class contains the test for error logging method.
* @author Vamsi Velampati (vvelampati@deloitte.com)
* @date 05/25/2020
* @version 1.0
*/
@isTest public class ErrorLoggerTest {
    private
        static final String CLASS_NAME = ErrorLoggerTest.class.getName();
    private
        static final String TEST_ID = 'Test-Id';
    private
        static final String TEST_MESSAGE = 'This is a Test Message';
    
    /**
* @description Test Method for different Finest level of error log
*/
    @isTest static void itShouldLogFinestMessage() {
        InvalidOperationException e = new InvalidOperationException(TEST_MESSAGE);
        Test.startTest();
        ErrorLogger.finestMsg(CLASS_NAME, 'itShouldLogFinestMessage', TEST_ID, e);
        Test.stopTest();
        Apex_Error_Log__c log = getLog();
        System.assertEquals('Level.FINEST', log.Level__c, 'Log level should be FINEST');
        System.assertEquals(
            e.getTypeName(), log.Exception_Type__c, 'Exception type is not as Exception occured');
        System.assertEquals(
            e.getMessage(), log.Message__c, 'Exception message is not as Exception occured');
    }
    
    /**
* @description Test Method for different Finer level of error log
*/
    @isTest static void itShouldLogFinerMessage() {
        InvalidOperationException e = new InvalidOperationException(TEST_MESSAGE);
        Test.startTest();
        ErrorLogger.finerMsg(CLASS_NAME, 'itShouldLogFinerMessage', TEST_ID, e);
        Test.stopTest();
        Apex_Error_Log__c log = getLog();
        System.assertEquals('Level.FINER', log.Level__c, 'Log level should be FINER');
        System.assertEquals(
            e.getTypeName(), log.Exception_Type__c, 'Exception type is not as Exception occured');
        System.assertEquals(
            e.getMessage(), log.Message__c, 'Exception message is not as Exception occured');
    }
    
    /**
* @description Test Method for different Fine level of error log
*/
    @isTest static void itShouldLogFineMessage() {
        InvalidOperationException e = new InvalidOperationException(TEST_MESSAGE);
        Test.startTest();
        ErrorLogger.fineMsg(CLASS_NAME, 'itShouldLogFineMessage', TEST_ID, e);
        Test.stopTest();
        Apex_Error_Log__c log = getLog();
        System.assertEquals('Level.FINE', log.Level__c, 'Log level should be FINE');
        System.assertEquals(
            e.getTypeName(), log.Exception_Type__c, 'Exception type is not as Exception occured');
        System.assertEquals(
            e.getMessage(), log.Message__c, 'Exception message is not as Exception occured');
    }
    
    /**
* @description Test Method for different Config level of error log
*/
    @isTest static void itShouldLogConfigMessage() {
        InvalidOperationException e = new InvalidOperationException(TEST_MESSAGE);
        Test.startTest();
        ErrorLogger.configMsg(CLASS_NAME, 'itShouldLogConfigMessage', TEST_ID, e);
        Test.stopTest();
        Apex_Error_Log__c log = getLog();
        System.assertEquals('Level.CONFIG', log.Level__c, 'Log level should be CONFIG');
        System.assertEquals(
            e.getTypeName(), log.Exception_Type__c, 'Exception type is not as Exception occured');
        System.assertEquals(
            e.getMessage(), log.Message__c, 'Exception message is not as Exception occured');
    }
    
    /**
* @description Test Method for different Info level of error log
*/
    @isTest static void itShouldLogInfoMessage() {
        InvalidOperationException e = new InvalidOperationException(TEST_MESSAGE);
        Test.startTest();
        ErrorLogger.infoMsg(CLASS_NAME, 'itShouldLogInfoMessage', TEST_ID, e);
        Test.stopTest();
        Apex_Error_Log__c log = getLog();
        System.assertEquals('Level.INFO', log.Level__c, 'Log level should be INFO');
        System.assertEquals(
            e.getTypeName(), log.Exception_Type__c, 'Exception type is not as Exception occured');
        System.assertEquals(
            e.getMessage(), log.Message__c, 'Exception message is not as Exception occured');
    }
    
    /**
* @description Test Method for different warning level of error log
*/
    @isTest static void itShouldLogWarningMessage() {
        InvalidOperationException e = new InvalidOperationException(TEST_MESSAGE);
        Test.startTest();
        ErrorLogger.warningMsg(CLASS_NAME, 'itShouldLogWarningMessage', TEST_ID, e);
        Test.stopTest();
        Apex_Error_Log__c log = getLog();
        System.assertEquals('Level.WARNING', log.Level__c, 'Log level should be WARNING');
        System.assertEquals(
            e.getTypeName(), log.Exception_Type__c, 'Exception type is not as Exception occured');
        System.assertEquals(
            e.getMessage(), log.Message__c, 'Exception message is not as Exception occured');
    }
    
    /**
* @description Test Method for different severe level of error log
*/
    @isTest static void itShouldLogSevereMessage() {
        InvalidOperationException e = new InvalidOperationException(TEST_MESSAGE);
        Test.startTest();
        ErrorLogger.severeMsg(CLASS_NAME, 'itShouldLogSevereMessage', TEST_ID, e);
        Test.stopTest();
        Apex_Error_Log__c log = getLog();
        System.assertEquals('Level.SEVERE', log.Level__c, 'Log level should be SEVERE');
        System.assertEquals(
            e.getTypeName(), log.Exception_Type__c, 'Exception type is not as Exception occured');
        System.assertEquals(
            e.getMessage(), log.Message__c, 'Exception message is not as Exception occured');
    }
    
    
    
    public
        static integer getClassLevelErrorCount(String className) {
            return [SELECT id FROM Apex_Error_Log__c WHERE Class__c =:className].size();
        }
    
    private
        static Apex_Error_Log__c getLog() {
            return [
                SELECT Id,
                Exception_Type__c,
                Method__c,
                Level__c,
                Message__c,
                Stack_Trace__c FROM Apex_Error_Log__c LIMIT 1
            ];
        }
}