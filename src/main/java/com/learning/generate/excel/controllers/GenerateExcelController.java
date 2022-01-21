package com.learning.generate.excel.controllers;

import java.io.IOException;
import java.text.ParseException;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.MediaType;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import com.learning.generate.excel.services.GenerateExcelUsingListService;
import com.learning.generate.excel.services.entities.ReportParameter;
import com.learning.generate.excel.services.entities.ReportResponse;

@RestController
@RequestMapping("/api")
public class GenerateExcelController {

	@Autowired
	private GenerateExcelUsingListService generateExcelUsingListService;
	
	@PostMapping(path="/generateExcelUsingList", produces = MediaType.APPLICATION_JSON_VALUE, consumes = MediaType.APPLICATION_JSON_VALUE)
	public ReportResponse generateExcelUsingList(@RequestBody ReportParameter reportParameter) throws IOException, ParseException{
		return generateExcelUsingListService.generateExcel(reportParameter);
	}
	
}
