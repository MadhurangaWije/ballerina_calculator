import ballerina/test;

@test:Config {}
function testFunctions1()returns error? {
    int res = fact(5);
    test:assertEquals(res,120);
}

@test:Config {}
function testFunctions2()returns error? {
    int res = fact(1);
    test:assertEquals(res,1);
}

@test:Config {}
function testFunctions3()returns error? {
    int res = fact(0);
    test:assertEquals(res,1);
}

@test:Config {}
function testFunctions4()returns error? {
    int[] arr = [3,2,1];
    sort(arr);
    int[] sortedArr = [1,2,3];
    test:assertEquals(arr,sortedArr);
}



