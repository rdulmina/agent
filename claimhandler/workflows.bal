import ballerina/ai;
import ballerina/workflow;

final ai:Wso2ModelProvider wso2ModelProvider = check ai:getDefaultModelProvider();

final workflow:DurableAgent claimAgent = check new ({
    systemPrompt: {
        role: string `Expense claim assistant`,
        instructions: string `Process expense claims end to end. Validate each claim with validateClaim human task first and
reject invalid claims with a clear reason. When a claim is valid, pay it with payClaim
using the claimed amount. Finish with a one-line summary of the outcome.`
    },
    model: wso2ModelProvider
,
    activities: [
        {activity: validateClaim, name: "validateClaim"}
,
        {activity: payClaim, name: string `payClaim`, approvalPolicy: {userRoles: "Finance"}}
    ]
});

@workflow:Workflow
function OrderWorkflow(workflow:Context ctx, OrderInfo input) returns json|error {
    AdminResponse result = check ctx->awaitHumanTask("Validate Order", userRoles = "Admin", taskInput = input, administratorRoles = "Admin");
}

@workflow:Workflow
function FileProcessor(workflow:Context ctx) returns json|error {
    boolean booleanResult = check ctx->callActivity(processBatch, {offset: 0}, retryPolicy = {userRoles: "Admin"});
}
