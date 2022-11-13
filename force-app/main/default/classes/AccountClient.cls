/**
 * @Description         : 
 * @Created By          : Meric Asaner (meric.asaner@ritmus.com)
 * @Last Modified Date  : 09/08/2022
**/
@RestResource(urlmapping='/Accounts/*')
global with sharing class AccountClient {
    @HttpGet
    global static List<Account> AccountClient() {
        List<Account> accounts = [SELECT ID,NAME,Phone,Email__c,Location__c,IsDemo__c FROM Account WHERE IsDemo__c = TRUE];
        return accounts;
    }
}