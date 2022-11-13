global class AccountByPhoneNumber
{
    webService static Account getAccount(String phoneNo,String a, String b, String c)
    {
        System.debug(a);
        System.debug(b);
        System.debug(c);
        System.debug(phoneNo);
        Account acct = [SELECT Id,Name,Phone FROM Account WHERE Phone=:phoneNo LIMIT 1];
        return acct;
    }
    
    webService static String lockAccount(String accountID)
    {
        //Account acct = [SELECT Id,Name,Phone FROM Account WHERE Id=:accountID];
        if(!Approval.isLocked(accountID))
        {
            System.debug('Account was unlocked, now its locked and is waiting to be updated');
            Approval.lock(accountID);
        }
        String output = 'Locked';
        return output;
    }
    
    webService static Account updateAccount(String phoneNo,String newPhoneNo)
    {
        String phoneNum = newPhoneNo;
        Account acct = [SELECT Id,Name,Phone FROM Account WHERE Phone=:phoneNo LIMIT 1];
        //if(Approval.isLocked(acct.Id))
        //{
       	//	  System.debug('Account was unlocked, now its locked and is waiting to be updated')
        //    Approval.unlock(acct.Id);
        //}
        //if(!Approval.isLocked(acct.Id))
        //{
        //    System.debug('Account was unlocked, now its locked and is waiting to be updated');
        //    Approval.lock(acct.Id);
        //}

        if(phoneNum != null)
        {
            acct.Phone = phoneNum;
            update acct;
        }
        return acct;
    }
      

    
    
    webservice static void createAccount(AccountInfo info) 
    {
        Account acct = new Account();
        acct.Name = info.AcctName;
        acct.AccountNumber = String.valueOf(info.AcctNumber);
        acct.Phone = info.phoneNumber;
        acct.IsDemo__c = info.isDemo;
        acct.Location__Latitude__s = info.Latitude;
        acct.Location__Longitude__s = info.Longitude;
        acct.Email__c = info.email;
        insert acct;
        //return acct;
    }
    
    webservice static Id [] createAccounts(Account parent, Account child, Account grandChild) 
    {
        insert parent;
        child.parentId = parent.Id;
        insert child;
        grandChild.parentId = child.Id;
        insert grandChild;
        
        Id [] results = new Id[3];
        results[0] = parent.Id;
        results[1] = child.Id;
        results[2] = grandChild.Id;
        return results;
    }

    global class AccountInfo 
    {
        webservice String AcctName;
        webservice Integer AcctNumber;
        webservice String phoneNumber;
        webservice Boolean isDemo;
        webservice String email;
        webservice Decimal Longitude;
        webservice Decimal Latitude;
    }

}