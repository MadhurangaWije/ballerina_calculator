import ballerina/test;

@test:Config {}
function testApp1() returns error?{
    var result = check executeRequest("sort 3 2 1");
    int[] rx=[1,2,3];
    test:assertEquals(result,rx);

}

@test:Config {}
function testApp2() returns error?{
    var result = check executeRequest("fact 5");
    int rx=120;
    test:assertEquals(result,rx);

}

@test:Config {}
function testApp3() returns error?{
    var result = check executeRequest("sort 3");
    int[] rx=[3];
    test:assertEquals(result,rx);
}

@test:Config {}
function testApp4() returns error?{
    var result = executeRequest("sort");
    if result is error{
        test:assertTrue(true);
    }else{
        test:assertTrue(false);
    }
}

@test:Config {}
function testApp5() returns error?{
    var result = executeRequest("fact");
    if result is error{
        test:assertTrue(true);
    }else{
        test:assertTrue(false);
    }
}

