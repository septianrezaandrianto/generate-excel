package com.learning.generate.excel;

import com.learning.generate.excel.services.entities.ReportParameter;
import com.learning.generate.excel.services.entities.ReportResponse;

public class BuildUtil {

	private static BuildUtil ins = null;
	
	private BuildUtil() {
		
	}
	
	public static BuildUtil getInstance() {
		if (ins == null) {
			ins= new BuildUtil();
		}
		return ins;
	}
	
	public ReportParameter reportParameter() {
		ReportParameter data = new ReportParameter();
		data.setCategory("Makanan");
		data.setStartDate("2022-01-01");
		data.setEndDate("2022-01-15");
		return data;
	}
	
	public ReportResponse reportResponse() {
		ReportResponse data = new ReportResponse();
		data.setBody("data".getBytes());
		data.setFileType("xlsx");
		data.setFileName("DUMMY File.xlsx");
		return data;
	}
}
