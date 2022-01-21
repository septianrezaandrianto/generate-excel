package com.learning.generate.excel.services.entities;

import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
public class ReportResponse {

	private byte[] body;
	private String fileType;
	private String fileName;
	
}
