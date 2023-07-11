import ballerinax/trigger.google.calendar;
import ballerina/http;
import ballerina/io;

configurable calendar:ListenerConfig config = ?;

listener http:Listener httpListener = new(8090);
listener calendar:Listener webhookListener =  new(config,httpListener);

service calendar:CalendarService on webhookListener {
  
    remote function onNewEvent(calendar:Event payload ) returns error? {
      io:println("onNewEvent");
    }
    remote function onEventUpdate(calendar:Event payload ) returns error? {
      io:println("onEventUpdate");
    }
    remote function onEventDelete(calendar:Event payload ) returns error? {
      io:println("onEventDelete");
    }
}

service /ignore on httpListener {}
