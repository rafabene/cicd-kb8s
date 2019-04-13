package com.rafabene.exemplo;

import io.quarkus.test.junit.QuarkusTest;
import org.junit.jupiter.api.Test;

import static io.restassured.RestAssured.given;
import static org.hamcrest.CoreMatchers.is;

@QuarkusTest
public class OlaResourceTest {

    @Test
    public void testHelloEndpoint() {
        given()
          .when().get("/ola")
          .then()
             .statusCode(200)
             .body(is("hello"));
    }

}