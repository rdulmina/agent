import ballerina/workflow;

@workflow:Activity
function validateClaim(ExpenseClaim claim) returns boolean {
    return claim.amount > 0d;
}

@workflow:Activity
function payClaim(string claimId, decimal amount) returns string {
    return string `PAY-${claimId}`;
}

@workflow:Activity
function processBatch(int offset) returns boolean|error {
    if offset == 0 {
        return error("Incorrect offset");
    }
    return true;
}
