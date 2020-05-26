/**
* @group TestBuilder
* @description Test class to cover ByPassLogicModel class.
* @author Vamsi Velampati (vvelampati@deloitte.com)
* @date 05/04/2020
* @version 1.0
*/
@isTest public class ByPassLogicModelTest {
    
    /**
* @description this is the setup method which create some data that to be
* used in test methods
*/
    @testSetup public static void setupData() {
        new TestBypassSettingBuilder()
            .setIsContactAddressBypassed(false)
            .setSetupOwnerId(userInfo.getUserId())
            .buildAndSave();
    }
    
    /**
* @description this method tests if there is no custom setting for user trigger
*/
    public
        static testmethod void testCustomSettingWithTrueValue() {
            new TestBypassSettingBuilder()
                .setIsContactAddressBypassed(false)
                .setSetupOwnerId(userInfo.getUserId())
                .buildAndSave();
            Test.startTest();
            System.assertEquals(false, ByPassLogicModel.isContactAddressTriggerByPassed(), 'Contact Address Trigger should be enabled');
            Test.stopTest();
        }
    
    /**
* @description Test method for user level bypass logic for Account trigger
*/
    public
        static testmethod void userByPasssShouldByPassContactAddressTrigger() {
            new TestBypassSettingBuilder()
                .setIsContactAddressBypassed(true)
                .setSetupOwnerId(userInfo.getUserId())
                .buildAndSave();
            Test.StartTest();
            System.assertEquals(true, ByPassLogicModel.isContactAddressTriggerByPassed(), 'Contact Address Trigger should be Disabled');
            Test.StopTest();
        }
    
    /**
* @description Test method for profile level bypass logic for Account trigger
*/
    public
        static testmethod void profileByPassAccountShouldByPassAccountTrigger() {
            new TestBypassSettingBuilder()
                .setIsContactAddressBypassed(true)
                .setSetupOwnerId(userInfo.getProfileId())
                .buildAndSave();
            Test.StartTest();
            System.assertEquals(true, ByPassLogicModel.isContactAddressTriggerByPassed(), 'Account Trigger should be Disabled');
            Test.StopTest();
        }
    
    
    
    
    /**
* @description Test method for org level bypass logic for triggers
*/
    static testmethod void byPassingAtOrgLevelShouldByPassTriggers() {
        new TestBypassSettingBuilder()
            .setIsContactAddressBypassed(true)
            .setSetupOwnerId(userInfo.getOrganizationId())
            .buildAndSave();
        Test.StartTest();
        System.assertEquals(true, ByPassLogicModel.isContactAddressTriggerByPassed(), 'Failed to disable Contact Address Trigger');
        Test.StopTest();
    }
    
    /**
* @description Test method for org level bypass logic for Triggers
*/
    static testmethod void byPassingAtProfileLevelShouldByPassTriggers() {
        new TestBypassSettingBuilder()
            .setIsContactAddressBypassed(true)
            .setSetupOwnerId(userInfo.getProfileId())
            .buildAndSave();
        Test.StartTest();
        System.assertEquals(true,ByPassLogicModel.isContactAddressTriggerByPassed(),'Failed to disable Contact Address Trigger');
        Test.StopTest();
    }
}