public class AccountTriggerHandler{
    Account acct = new Account();
    Map<Id,Account> mapAccIdToAccount = new Map<Id,Account>();
    Map<Id,Account> mapAccIdToAccountDelete = new Map<Id,Account>();
    Map<Id,Account> mapAccIdToAccountUpdate = new Map<Id,Account>();
    list<account> updatelist = new list<account>();
    public void afterInsert(list<account> acc1)
    {  
        for(account acc:acc1){
            if(acc.parentid!=null){        
                mapAccIdToAccount.put(acc.ParentId,acc);               
            }
        }
        for(account acc:[select Id,OneSync_TCM_Fee__c,OneSync_PBF_Fee__c,OneSync_MMS_Fee__c,OneSync_MDS_Fee__c,OneSync_ITS_Fee__c from account where Id in:mapAccIdToAccount.keySet()]){
        if (acc.OneSync_TCM_Fee__c != null && mapAccIdToAccount.get(acc.Id).OneSync_TCM_Fee__c != null){
            acc.OneSync_TCM_Fee__c += mapAccIdToAccount.get(acc.Id).OneSync_TCM_Fee__c; 
        } else if (acc.OneSync_TCM_Fee__c == null && mapAccIdToAccount.get(acc.Id).OneSync_TCM_Fee__c != null){
            acc.OneSync_TCM_Fee__c = mapAccIdToAccount.get(acc.Id).OneSync_TCM_Fee__c; 
        }
        if (acc.OneSync_PBF_Fee__c != null && mapAccIdToAccount.get(acc.Id).OneSync_PBF_Fee__c != null){
            acc.OneSync_PBF_Fee__c += mapAccIdToAccount.get(acc.Id).OneSync_PBF_Fee__c; 
        } else if (acc.OneSync_PBF_Fee__c == null && mapAccIdToAccount.get(acc.Id).OneSync_PBF_Fee__c != null){
            acc.OneSync_PBF_Fee__c = mapAccIdToAccount.get(acc.Id).OneSync_PBF_Fee__c; 
        }
        if (acc.OneSync_MMS_Fee__c != null && mapAccIdToAccount.get(acc.Id).OneSync_MMS_Fee__c != null){
            acc.OneSync_MMS_Fee__c += mapAccIdToAccount.get(acc.Id).OneSync_MMS_Fee__c; 
        } else if (acc.OneSync_MMS_Fee__c == null && mapAccIdToAccount.get(acc.Id).OneSync_MMS_Fee__c != null){
            acc.OneSync_MMS_Fee__c = mapAccIdToAccount.get(acc.Id).OneSync_MMS_Fee__c; 
        }
        if (acc.OneSync_MDS_Fee__c != null && mapAccIdToAccount.get(acc.Id).OneSync_MDS_Fee__c != null){
            acc.OneSync_MDS_Fee__c += mapAccIdToAccount.get(acc.Id).OneSync_MDS_Fee__c; 
        } else if (acc.OneSync_MDS_Fee__c == null && mapAccIdToAccount.get(acc.Id).OneSync_MDS_Fee__c != null){
            acc.OneSync_MDS_Fee__c = mapAccIdToAccount.get(acc.Id).OneSync_MDS_Fee__c; 
        }
        if (acc.OneSync_ITS_Fee__c != null && mapAccIdToAccount.get(acc.Id).OneSync_ITS_Fee__c != null){
            acc.OneSync_ITS_Fee__c += mapAccIdToAccount.get(acc.Id).OneSync_ITS_Fee__c; 
        } else if (acc.OneSync_ITS_Fee__c == null && mapAccIdToAccount.get(acc.Id).OneSync_ITS_Fee__c != null){
            acc.OneSync_ITS_Fee__c = mapAccIdToAccount.get(acc.Id).OneSync_ITS_Fee__c; 
        }       
        updatelist.add(acc);                            
     }  
         update updatelist;
   } 
        
     public void afterUpdate(list<account> acc1){  
        for(account acc:acc1){ 
            if(acc.parentid!=null){  
               acct = (account)Trigger.oldMap.get(acc.Id);
                mapAccIdToAccountUpdate.put(acc.ParentId,acc);               
            }
        }
        for(account acc:[select Id,OneSync_TCM_Fee__c,OneSync_PBF_Fee__c,OneSync_MMS_Fee__c,OneSync_MDS_Fee__c,OneSync_ITS_Fee__c from account where Id in:mapAccIdToAccountUpdate.keySet()]){
        if (acc.OneSync_TCM_Fee__c != null && mapAccIdToAccountUpdate.get(acc.Id).OneSync_TCM_Fee__c != null){
            if( mapAccIdToAccountUpdate.get(acc.Id).OneSync_TCM_Fee__c > acct.OneSync_TCM_Fee__c ) {
                acc.OneSync_TCM_Fee__c = acc.OneSync_TCM_Fee__c + ( mapAccIdToAccountUpdate.get(acc.Id).OneSync_TCM_Fee__c - acct.OneSync_TCM_Fee__c );
            }
            else if(acct.OneSync_TCM_Fee__c !=null){
                acc.OneSync_TCM_Fee__c = acc.OneSync_TCM_Fee__c - ( acct.OneSync_TCM_Fee__c - mapAccIdToAccountUpdate.get(acc.Id).OneSync_TCM_Fee__c);
            }
            else if(acct.OneSync_TCM_Fee__c == null){
                acc.OneSync_TCM_Fee__c = acc.OneSync_TCM_Fee__c + mapAccIdToAccountUpdate.get(acc.Id).OneSync_TCM_Fee__c;
            }           
        }
            else if(mapAccIdToAccountUpdate.get(acc.Id).OneSync_TCM_Fee__c == null){
                acc.OneSync_TCM_Fee__c = acc.OneSync_TCM_Fee__c - acct.OneSync_TCM_Fee__c;
            }
            //update pbf fee
         if (acc.OneSync_PBF_Fee__c != null && mapAccIdToAccountUpdate.get(acc.Id).OneSync_PBF_Fee__c != null){
            if( mapAccIdToAccountUpdate.get(acc.Id).OneSync_PBF_Fee__c > acct.OneSync_PBF_Fee__c ) {
                acc.OneSync_PBF_Fee__c = acc.OneSync_PBF_Fee__c + ( mapAccIdToAccountUpdate.get(acc.Id).OneSync_PBF_Fee__c - acct.OneSync_PBF_Fee__c );
            }
            else if(acct.OneSync_PBF_Fee__c !=null){
                acc.OneSync_PBF_Fee__c = acc.OneSync_PBF_Fee__c - ( acct.OneSync_PBF_Fee__c - mapAccIdToAccountUpdate.get(acc.Id).OneSync_PBF_Fee__c);
            }
            else if(acct.OneSync_PBF_Fee__c == null){
                acc.OneSync_PBF_Fee__c = acc.OneSync_PBF_Fee__c + mapAccIdToAccountUpdate.get(acc.Id).OneSync_PBF_Fee__c;
            }           
        }
            else if(mapAccIdToAccountUpdate.get(acc.Id).OneSync_PBF_Fee__c == null){
                acc.OneSync_PBF_Fee__c = acc.OneSync_PBF_Fee__c - acct.OneSync_PBF_Fee__c;
            }   
            //update mms fee
          if (acc.OneSync_MMS_Fee__c != null && mapAccIdToAccountUpdate.get(acc.Id).OneSync_MMS_Fee__c != null){
            if( mapAccIdToAccountUpdate.get(acc.Id).OneSync_MMS_Fee__c > acct.OneSync_MMS_Fee__c ) {
                acc.OneSync_MMS_Fee__c = acc.OneSync_MMS_Fee__c + ( mapAccIdToAccountUpdate.get(acc.Id).OneSync_MMS_Fee__c - acct.OneSync_MMS_Fee__c );
            }
            else if(acct.OneSync_MMS_Fee__c !=null){
                acc.OneSync_MMS_Fee__c = acc.OneSync_MMS_Fee__c - ( acct.OneSync_MMS_Fee__c - mapAccIdToAccountUpdate.get(acc.Id).OneSync_MMS_Fee__c);
            }
            else if(acct.OneSync_MMS_Fee__c == null){
                acc.OneSync_MMS_Fee__c = acc.OneSync_MMS_Fee__c + mapAccIdToAccountUpdate.get(acc.Id).OneSync_MMS_Fee__c;
            }           
        }
            else if(mapAccIdToAccountUpdate.get(acc.Id).OneSync_MMS_Fee__c == null){
                acc.OneSync_MMS_Fee__c = acc.OneSync_MMS_Fee__c - acct.OneSync_MMS_Fee__c;
            } 
          //update mds fee  
          if (acc.OneSync_MDS_Fee__c != null && mapAccIdToAccountUpdate.get(acc.Id).OneSync_MDS_Fee__c != null){
            if( mapAccIdToAccountUpdate.get(acc.Id).OneSync_MDS_Fee__c > acct.OneSync_MDS_Fee__c ) {
                acc.OneSync_MDS_Fee__c = acc.OneSync_MDS_Fee__c + ( mapAccIdToAccountUpdate.get(acc.Id).OneSync_MDS_Fee__c - acct.OneSync_MDS_Fee__c );
            }
            else if(acct.OneSync_MDS_Fee__c !=null){
                acc.OneSync_MDS_Fee__c = acc.OneSync_MDS_Fee__c - ( acct.OneSync_MDS_Fee__c - mapAccIdToAccountUpdate.get(acc.Id).OneSync_MDS_Fee__c);
            }
            else if(acct.OneSync_MDS_Fee__c == null){
                acc.OneSync_MDS_Fee__c = acc.OneSync_MDS_Fee__c + mapAccIdToAccountUpdate.get(acc.Id).OneSync_MDS_Fee__c;
            }           
        }
            else if(mapAccIdToAccountUpdate.get(acc.Id).OneSync_MDS_Fee__c == null){
                acc.OneSync_MDS_Fee__c = acc.OneSync_MDS_Fee__c - acct.OneSync_MDS_Fee__c;
            } 
          //update its fee  
         if (acc.OneSync_ITS_Fee__c != null && mapAccIdToAccountUpdate.get(acc.Id).OneSync_ITS_Fee__c != null){
            if( mapAccIdToAccountUpdate.get(acc.Id).OneSync_ITS_Fee__c > acct.OneSync_ITS_Fee__c ) {
                acc.OneSync_ITS_Fee__c = acc.OneSync_ITS_Fee__c + ( mapAccIdToAccountUpdate.get(acc.Id).OneSync_ITS_Fee__c - acct.OneSync_ITS_Fee__c );
            }
            else if(acct.OneSync_ITS_Fee__c !=null){
                acc.OneSync_ITS_Fee__c = acc.OneSync_ITS_Fee__c - ( acct.OneSync_ITS_Fee__c - mapAccIdToAccountUpdate.get(acc.Id).OneSync_ITS_Fee__c);
            }
            else if(acct.OneSync_ITS_Fee__c == null){
                acc.OneSync_ITS_Fee__c = acc.OneSync_ITS_Fee__c + mapAccIdToAccountUpdate.get(acc.Id).OneSync_ITS_Fee__c;
            }           
        }
            else if(mapAccIdToAccountUpdate.get(acc.Id).OneSync_ITS_Fee__c == null){
                acc.OneSync_ITS_Fee__c = acc.OneSync_ITS_Fee__c - acct.OneSync_ITS_Fee__c;
            }             
        updatelist.add(acc);               
    }
         update updatelist;
   } 
    
    public void afterDelete(list<account> acc1)
    {  
        for(account acc:acc1){
            if(acc.parentid!=null){        
                mapAccIdToAccountDelete.put(acc.ParentId,acc);               
            }
        }
       for(account acc:[select Id,OneSync_TCM_Fee__c,OneSync_PBF_Fee__c,OneSync_MMS_Fee__c,OneSync_MDS_Fee__c,OneSync_ITS_Fee__c from account where Id in:mapAccIdToAccountdelete.keySet()]){
        if (acc.OneSync_TCM_Fee__c != null && mapAccIdToAccountDelete.get(acc.Id).OneSync_TCM_Fee__c != null){
            acc.OneSync_TCM_Fee__c -= mapAccIdToAccountDelete.get(acc.Id).OneSync_TCM_Fee__c; 
        } 
        if (acc.OneSync_PBF_Fee__c != null && mapAccIdToAccountDelete.get(acc.Id).OneSync_PBF_Fee__c != null){
            acc.OneSync_PBF_Fee__c -= mapAccIdToAccountDelete.get(acc.Id).OneSync_PBF_Fee__c; 
        } 
        if (acc.OneSync_MMS_Fee__c != null && mapAccIdToAccountDelete.get(acc.Id).OneSync_MMS_Fee__c != null){
            acc.OneSync_MMS_Fee__c -= mapAccIdToAccountDelete.get(acc.Id).OneSync_MMS_Fee__c; 
        } 
        if (acc.OneSync_MDS_Fee__c != null && mapAccIdToAccountDelete.get(acc.Id).OneSync_MDS_Fee__c != null){
            acc.OneSync_MDS_Fee__c -= mapAccIdToAccountDelete.get(acc.Id).OneSync_MDS_Fee__c; 
        } 
        if (acc.OneSync_ITS_Fee__c != null && mapAccIdToAccountDelete.get(acc.Id).OneSync_ITS_Fee__c != null){
            acc.OneSync_ITS_Fee__c -= mapAccIdToAccountDelete.get(acc.Id).OneSync_ITS_Fee__c; 
        }  
        updatelist.add(acc);
    } 
         update updatelist;
   }
    }
