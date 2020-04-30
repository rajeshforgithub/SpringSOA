Public Class AccountController{
@AuraEnabled
public static List<Account> getRecentAccounts(){
       List<Account> listOfRecentAccounts=New List<Account>([select id,name,phone,type from Account ORDER BY CreatedDate DESC limit 10]);
       return listOfRecentAccounts;
}
}
