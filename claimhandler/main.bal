import ballerina/http;
import ballerina/workflow.management.rest as _;

listener http:Listener httpDefaultListener = http:getDefaultListener();

service / on httpDefaultListener {
    resource function post claim(@http:Payload ExpenseClaim payload) returns json|error {
        do {
            string instanceId = check claimAgent.run("Process Claim", payload);
            return instanceId;
        } on fail error err {
            // handle error
            return error("unhandled error", err);
        }
    }

}

