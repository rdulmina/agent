
type ExpenseClaim record {|
    string claimId;
    decimal amount;
    string purpose;
|};

type AdminResponse record {|
    boolean valid;
    string reason?;
|};

type OrderInfo record {|
    string id;
    int total;
    string customerEmail;
|};
