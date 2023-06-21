package com.pensionerDisbursementMicroservice.service;

import org.springframework.stereotype.Service;

import com.pensionerDisbursementMicroservice.Model.Bank;
import com.pensionerDisbursementMicroservice.Model.ProcessPensionResponse;

@Service
public class PensionDisbursmentService {

	public ProcessPensionResponse code(Bank bank, double serviceCharge) {
		ProcessPensionResponse ppr = new ProcessPensionResponse();
		double x = bank.getBankType().equalsIgnoreCase("public") ? 500 : 550;
		if (x == serviceCharge)
			ppr.setPensionStatusCode(10); // code 10 to deduct 500, public bank

		else {
			ppr.setPensionStatusCode(21); // code 21 to deduct 550, private bank

		}

		return ppr;
	}

}
