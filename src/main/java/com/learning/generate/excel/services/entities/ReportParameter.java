package com.learning.generate.excel.services.entities;

import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
public class ReportParameter {

	private String category;
	private String startDate;
	private String endDate;
	
}
