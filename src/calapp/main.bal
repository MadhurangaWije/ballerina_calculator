import ballerina/io;
import kanishkamw/calfunctions;
import kanishkamw/calparser;

public function main() {
    string input = io:readln("Enter calculator request: ");
    var result = executeRequest(input);
    io:println("Result: ",result);
}

# Executes the user entered calculation request
# 
# +input - the calculation request entered by the user
# 
# +return - the result of the execution of the calculation
#           entered by the user.
function executeRequest(string input)returns any|error {
    calparser:Request request=check calparser:parseRequest(input);
    if (request.algorithm == calparser:ALGO_FACT) {
        int data=request.data[0];
        int result = calfunctions:fact(data);
        return result;
    }else if (request.algorithm == calparser:ALGO_SORT) {
        int[] data = request.data;
        calfunctions:sort(data);
        return data;
    }else{
        return error("Unknown Algorithm");
    }

}
