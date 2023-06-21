package com.processPensionMicroservice.service;

import org.springframework.stereotype.Service;

import com.processPensionMicroservice.model.PensionDetail;
import com.processPensionMicroservice.model.PensionerDetail;
import com.processPensionMicroservice.model.PensionerInput;
import com.processPensionMicroservice.model.ProcessPensionResponse;

@Service
public class ProcessPensionService {

	public PensionDetail getresult(PensionerDetail pensionerDetail) {

		PensionDetail pensionDetail;
		double pensionAmount = 0;

		/*
		 * Check whether pension type is 'self' or 'family Calculate pension accordingly
		 */
		if (pensionerDetail.getPensionType().equalsIgnoreCase("self")) // For self, 80% of last income
			pensionAmount = (pensionerDetail.getSalary() * 0.8 + pensionerDetail.getAllowance());
		else if (pensionerDetail.getPensionType().equalsIgnoreCase("family")) // For family, 50% of last income
			pensionAmount = (pensionerDetail.getSalary() * 0.5 + pensionerDetail.getAllowance());

		// Return new PensionDetail object with info on calculated pension
		pensionDetail = new PensionDetail(pensionerDetail.getName(), pensionerDetail.getDateOfBirth(),
				pensionerDetail.getPan(), pensionerDetail.getPensionType(), pensionAmount);
		
		System.out.println("Before PensionDetail");
		
		return pensionDetail;

	}

	@SuppressWarnings("deprecation")
	public ProcessPensionResponse checkdetails(PensionerInput pensionerInput, PensionerDetail pensionerDetail) {

		ProcessPensionResponse ppr = new ProcessPensionResponse();

		/*
		 * Verify form details by matching them against data present in the csv file
		 * (Date class is deprecated, suppressed warnings for now)
		 */
		if (pensionerInput.getName().equalsIgnoreCase(pensionerDetail.getName())
				&& (pensionerInput.getDateOfBirth().getDay() == pensionerDetail.getDateOfBirth().getDay()
						&& pensionerInput.getDateOfBirth().getMonth() == pensionerDetail.getDateOfBirth().getMonth()
						&& pensionerInput.getDateOfBirth().getYear() == pensionerDetail.getDateOfBirth().getYear())
				&& pensionerInput.getPan().equalsIgnoreCase(pensionerDetail.getPan())
				&& pensionerInput.getPensionType().equalsIgnoreCase(pensionerDetail.getPensionType())) {

			ppr.setPensionStatusCode(10); // Success
		}

		else {
			ppr.setPensionStatusCode(21); // Pension amount calculated is wrong, Please redo the calculation
		}
		System.out.print("Status OK");
		return ppr;
	}
}
