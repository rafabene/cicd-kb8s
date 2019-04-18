package com.rafabene.example;

import java.util.List;
import java.util.stream.Collectors;
import java.util.stream.IntStream;

import javax.ws.rs.GET;
import javax.ws.rs.Path;
import javax.ws.rs.PathParam;
import javax.ws.rs.Produces;
import javax.ws.rs.core.MediaType;

@Path("prime/")
public class PrimeNumberResource {
	
	@GET
	@Produces(MediaType.TEXT_PLAIN)
	@Path("/{number}")
	public static List<Integer> primeNumbersTill(@PathParam("number") int n) {
	    return IntStream.rangeClosed(2, n)
	      .filter(x -> isPrime(x)).boxed()
	      .collect(Collectors.toList());
	}

	private static boolean isPrime(int number) {
	    return IntStream.rangeClosed(2, (int) (Math.sqrt(number)))
	      .filter(n -> (n & 0X1) != 0)
	      .allMatch(n -> number % n != 0);
	}
}
