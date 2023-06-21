package com.pensionManagementSystem.client;

import org.springframework.cloud.openfeign.FeignClient;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;

import com.pensionManagementSystem.model.PensionDetail;
import com.pensionManagementSystem.model.PensionerInput;

@FeignClient(name= "ProcessPensionService", url="http://pod2processpensionmicroservice-env-1.eba-zypfbrcu.ap-south-1.elasticbeanstalk.com")
public interface ProcessPensionMicroserviceClient {

	@PostMapping("/pensionerInput")
	public PensionDetail getPensionDetails(@RequestBody PensionerInput pensionerInput);

}
