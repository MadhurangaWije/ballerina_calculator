import ballerina/stringutils;
import ballerina/lang.'int as ints;

public type Algorithm ALGO_FACT|ALGO_SORT;

# This represent the decoded calculator request from a user
# 
# +algorithm - This represent the algorithm that was chosen as an 'Algorithm' type.
# 
# +data - The data is the input data provided by the user for te given algorithm.
public type Request record {
    Algorithm algorithm;
    int[] data;
};

# Parses the user entered request to a 'Request' type
# 
# +request - the request string entered by the user
# 
# +return - parsed 'Request' if success. otherwise error
public function parseRequest(string request)returns Request|error {
    string trimReq=request.trim();
    if trimReq.length()<=4{
        return error(ERROR_INVALID_REQUEST);
    }
    int[] data=check parseArray(trimReq.substring(5));

    if (trimReq.startsWith("fact")) {
        return {algorithm:ALGO_FACT, data:data};
    }else if (trimReq.startsWith("sort")){
        return {algorithm:ALGO_SORT, data:data};
    }else{
        return error(ERROR_INVALID_REQUEST);
    }
}

# Parses the numbered string to an array of integers
# 
# + array - number array string
# 
# + return - integer number array if parse success otherwise an error
function parseArray(string array)returns int[]|error{
    string[] items = stringutils:split(array, " ");
    int[] results=[];
    foreach var item in items{
        var intItem = ints:fromString(item);
        if intItem is int{
            results.push(intItem);
        }else{
            return error(ERROR_INVALID_REQUEST);
        }
    }
    return results;
}