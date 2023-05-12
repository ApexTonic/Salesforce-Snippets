public class DeleteBulkLogs_batchClass implements Database.Batchable <sObject>, Database.AllowsCallouts{

    public Database.QueryLocator start(Database.BatchableContext BC){
        return Database.getQueryLocator([SELECT Id, LogLength FROM ApexLog ORDER BY LogLength DESC]);
    }
    
    public void execute(Database.BatchableContext BC, List<ApexLog> scope){
        System.debug('scope: '+ scope.size());
        for(Apexlog al: scope){
            Http h = new Http();
            HttpRequest req = new HttpRequest();
            req.setEndpoint(Url.getOrgDomainUrl().toExternalForm()+ '/services/data/v54.0/sobjects/Apexlog/'+al.Id);
            req.setMethod('DELETE');
            req.setHeader('Authorization', 'Bearer ' + UserInfo.getSessionId());
            HttpResponse res = h.send(req);
            System.debug(res.getStatusCode());
        }
    }
    
    public void finish(Database.BatchableContext BC){
        
        System.debug('DeleteBulkLogs_batchClass Finish');
    }
}