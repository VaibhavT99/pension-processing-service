package com.pensionerDisbursementMicroservice.client;

import org.springframework.cloud.openfeign.FeignClient;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;

@FeignClient(name = "AuthorizationService", url = "http://pod2authorizationmicroservice-env.eba-tmyxdbbg.ap-south-1.elasticbeanstalk.com")
public interface AuthorizationServiceClient {

	@PostMapping("/validate")
	public Boolean validateToken(@RequestBody String token);
}
