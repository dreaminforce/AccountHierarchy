trigger AccountTrigger on Account (after insert,after update ,after delete) { 
    //This Trigger also consist of handler class
    AccountTriggerHandler handler = new AccountTriggerHandler();
    if(trigger.isinsert){
         handler.afterInsert(Trigger.new);
    }
    if(trigger.isUpdate){
        handler.afterInsert(Trigger.new);
    }
    if(trigger.isDelete){
        handler.afterInsert(Trigger.old);
    }
}
