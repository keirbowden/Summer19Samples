public class PlatformEventsDemo {
	public static void PublishDemoEvent(String message)
    {
		Demo_Event__e event = new Demo_Event__e(Message__c=message);
        
        Database.SaveResult result = EventBus.publish(event);
        
        if (!result.isSuccess()) {
            for (Database.Error error : result.getErrors()) {
                System.debug('Error returned: ' +
                             error.getStatusCode() +' - '+
                             error.getMessage());
            }
        }
    }
}