trigger FindContactsCountOnAccount on Contact (after insert, after update, after delete) {
    
   List<Contact> modContacts = Trigger.isDelete ? Trigger.old:Trigger.new;
    Set<Id> accIds  = new Set<Id>();
    for (Contact c: modContacts)  {
        accIds.add(c.AccountId);
    }
   List<Account> modAccounts = [Select Name,Number_of_Contacts__c, (Select Id from Contacts)  from Account WHERE Id in: accIds ];

    for (Account acc: modAccounts) {
         acc.Number_of_Contacts__c= acc.Contacts.size();
    }
    update modAccounts;
}
