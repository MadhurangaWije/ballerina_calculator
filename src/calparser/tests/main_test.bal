import ballerina/test;

@test:Config {}
function testParse1()returns error? {
    Request req = check parseRequest("sort 3 2 1");
    test:assertEquals(req.algorithm, ALGO_SORT);
    int[] rx=[3,2,1];
    test:assertEquals(req.data,rx);
}

@test:Config {}
function testParse2()returns error? {
    Request req = check parseRequest("sort 1");
    test:assertEquals(req.algorithm, ALGO_SORT);
    int[] rx=[1];
    test:assertEquals(req.data,rx);
}

@test:Config {}
function testParse3()returns error? {
    Request req = check parseRequest("fact 5");
    test:assertEquals(req.algorithm, ALGO_FACT);
    int[] rx=[5];
    test:assertEquals(req.data,rx);
}

@test:Config {}
function testParse4()returns error? {
    Request req = check parseRequest("fact 14");
    test:assertEquals(req.algorithm, ALGO_FACT);
    int[] rx=[14];
    test:assertEquals(req.data,rx);
}

@test:Config {}
function testParse5()returns error? {
    var req = parseRequest("fact ");
    if req is error{
        test:assertTrue(true);
    }else{
        test:assertTrue(false);
    }
}

@test:Config {}
function testParse6()returns error? {
    var req = parseRequest("sort ");
    if req is error{
        test:assertTrue(true);
    }else{
        test:assertTrue(false);
    }
}

@test:Config {}
function testParse7()returns error? {
    var req = parseRequest("sort a b 10");
    if req is error{
        test:assertTrue(true);
    }else{
        test:assertTrue(false);
    }
}

@test:Config {}
function testParse8()returns error? {
    var req = parseRequest("run 1 2 40");
    if req is error{
        test:assertTrue(true);
    }else{
        test:assertTrue(false);
    }
}