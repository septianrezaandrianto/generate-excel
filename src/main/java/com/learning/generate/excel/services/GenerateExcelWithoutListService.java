package com.learning.generate.excel.services;

import java.io.IOException;
import java.sql.SQLException;
import java.text.ParseException;

import com.learning.generate.excel.services.entities.ReportParameter;
import com.learning.generate.excel.services.entities.ReportResponse;

public interface GenerateExcelWithoutListService {

	ReportResponse generateExcel(ReportParameter reportParameter) throws ParseException, SQLException, IOException;
}
