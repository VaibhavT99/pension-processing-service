package com.processPensionMicroservice.controller;

import java.io.IOException;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.MediaType;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.RestController;
import com.processPensionMicroservice.client.PensionDisbursementClient;
import com.processPensionMicroservice.client.PensionerDetailClient;
import com.processPensionMicroservice.exception.NotFoundException;
import com.processPensionMicroservice.model.PensionDetail;
import com.processPensionMicroservice.model.PensionerDetail;
import com.processPensionMicroservice.model.PensionerInput;
import com.processPensionMicroservice.model.ProcessPensionInput;
import com.processPensionMicroservice.model.ProcessPensionResponse;
import com.processPensionMicroservice.service.ProcessPensionService;

@RestController
public class processPensionController {

	@Autowired
	PensionerDetailClient pensionerDetailClient;
	@Autowired
	PensionDisbursementClient pensionDisbursementClient;
	@Autowired
	ProcessPensionService processPensionService;

	/*
	 * Takes form data as input
	 * Extracts pensioner details by matching aadhaar number against csv file
	 * Calls disbursement service to get bank code 
	 */
	@PostMapping(value = "/pensionerInput")//, produces = MediaType.APPLICATION_FORM_URLENCODED_VALUE)
	//@ResponseBody
	public PensionDetail getPensionDetails(@RequestBody PensionerInput pensionerInput) {

		System.out.println(pensionerInput); // Display form input on console

		PensionerDetail pensionerDetail = pensionerDetailClient.getPensionerDetailByAadhaar(pensionerInput.getAadharNumber());

		System.out.println(pensionerDetail); // Display pensioner detail on the console

		PensionDetail pensionDetail = null;

		// Return null if aadhaar not matched
		if (pensionerDetail == null) {
			return pensionDetail;
		}

		// verify pensioner details
		ProcessPensionResponse processPensionResponse = processPensionService.checkdetails(pensionerInput, pensionerDetail);

		System.out.println("Check Status Code" + processPensionResponse.getPensionStatusCode());
		
		if (processPensionResponse.getPensionStatusCode() == 10) {
			
			
			
			pensionDetail = processPensionService.getresult(pensionerDetail); // Success

			ProcessPensionInput processPensionInput = new ProcessPensionInput(pensionerInput.getAadharNumber(), pensionDetail.getPensionAmount(), 500); // 500 is the service charge

			System.out.println(processPensionInput); // Display aadhaar and pension in the console

			try {
				processPensionResponse = this.getcode(processPensionInput);
				if (processPensionResponse.getPensionStatusCode() == 21) {
					pensionDetail.setPensionAmount(pensionDetail.getPensionAmount() - 550); // private bank
				} else if (processPensionResponse.getPensionStatusCode() == 10) {
					pensionDetail.setPensionAmount(pensionDetail.getPensionAmount() - 500); // public bank
				}
			} catch (IOException | NotFoundException e) {
				return null;
			}
		}
		// Display pension details on the console
		System.out.println(pensionDetail);
		return pensionDetail;
	}

	@PostMapping("/ProcessPension")
	public ProcessPensionResponse getcode(@RequestBody ProcessPensionInput processPensionInput)
			throws IOException, NotFoundException {
		return pensionDisbursementClient.getcode(processPensionInput);
	}

}
