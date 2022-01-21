package com.learning.generate.excel.services;

import java.io.IOException;
import java.text.ParseException;

import com.learning.generate.excel.services.entities.ReportParameter;
import com.learning.generate.excel.services.entities.ReportResponse;

public interface GenerateExcelUsingListService {

	ReportResponse generateExcel(ReportParameter reportParameter) throws IOException, ParseException;
}
