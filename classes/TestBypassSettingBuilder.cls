/**
* @group TestBuilder
* @description A test Bypass Setting builder that improve test method
* readability and reduce duplicate setup logic
* @author Vamsi Velampati (vvelampati@deloitte.com)
* @date 05/04/2020
* @version 1.0
*/
@isTest public class TestBypassSettingBuilder {
    
    private Boolean isContactAddressTriggerBypassed = false;
    private Id setupOwnerId;
    
    
    /**
* @description Method to set isContactAddressBypassed.
* @param isContactAddressBypassed
* @return TestBypassSettingBuilder
*/
    public TestBypassSettingBuilder setIsContactAddressBypassed(Boolean isContactAddressTriggerBypassed) {
        this.isContactAddressTriggerBypassed = isContactAddressTriggerBypassed;
        return this;
    }
    /**
* @description Method to create Bypass Custom Setting object using fields.
* @return Bypass_Settings__c
*/
    public Bypass_Settings__c build() {
        Bypass_Settings__c bypassCS = Bypass_Settings__c.getInstance();
        if (bypassCS == null) {
            bypassCS = new Bypass_Settings__c();
        }
        byPassCS.is_Contact_Address_Trigger_Bypassed__c = isContactAddressTriggerBypassed;
        
        return bypassCS;
    }
    
    /**
* @description Method to set setupOwnerId.
* @param setupOwnerId
* @return TestBypassSettingBuilder
*/
    public TestBypassSettingBuilder setSetupOwnerId(Id setupOwnerId) {
        this.setupOwnerId = setupOwnerId;
        return this;
    }
    
    /**
* @description Method to create Bypass Custom Setting record fetched from
* build method.
* @return Bypass_Settings__c
*/
    public Bypass_Settings__c buildAndSave() {
        Bypass_Settings__c bypassCS = build();
        upsert bypassCS;
        return bypassCS;
    }
}