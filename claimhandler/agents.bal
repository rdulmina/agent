import ballerina/ai;

final ai:Agent aiAgent = check new (
    systemPrompt = {role: string `fd`, instructions: string `vdc`}, model = check ai:getDefaultModelProvider()
);
final ai:Agent aiAgentre = check new (
    systemPrompt = {role: string `rer`, instructions: string `re`}, model = check ai:getDefaultModelProvider()
);

final ai:Agent aiAgenti = check new (
    systemPrompt = {role: string `i`, instructions: string `i`}, model = check ai:getDefaultModelProvider()
);
