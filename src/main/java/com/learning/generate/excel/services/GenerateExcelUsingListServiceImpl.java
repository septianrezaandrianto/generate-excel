package com.learning.generate.excel.services;

import java.io.ByteArrayOutputStream;
import java.io.IOException;
import java.text.ParseException;
import java.util.List;

import org.apache.poi.ss.usermodel.Cell;
import org.apache.poi.ss.usermodel.CellStyle;
import org.apache.poi.ss.usermodel.Font;
import org.apache.poi.ss.usermodel.Row;
import org.apache.poi.xssf.streaming.SXSSFSheet;
import org.apache.poi.xssf.streaming.SXSSFWorkbook;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.learning.generate.excel.constant.Constant;
import com.learning.generate.excel.persistence.services.ProductDaoService;
import com.learning.generate.excel.services.entities.ReportParameter;
import com.learning.generate.excel.services.entities.ReportResponse;
import com.learning.generate.excel.services.entities.custommapping.ProductSpesific;

@Service
public class GenerateExcelUsingListServiceImpl extends CommonService implements GenerateExcelUsingListService {
	
	@Autowired
	private ProductDaoService productDaoService;
	
	
	@Override
	public ReportResponse generateExcel(ReportParameter reportParameter) throws IOException, ParseException {
		ReportResponse result = new ReportResponse();
		
		ByteArrayOutputStream bos = new ByteArrayOutputStream();
		SXSSFWorkbook sxssfWorkbook = new SXSSFWorkbook(100);
		SXSSFSheet sxssfSheet = sxssfWorkbook.createSheet(Constant.SHEETNAME);
		sxssfSheet.getTrackedColumnsForAutoSizing();
		Font font = sxssfWorkbook.createFont();
		Font fontBody = sxssfWorkbook.createFont();
		
		generateHeader(sxssfWorkbook, sxssfSheet, reportParameter);
		
		font.setBold(true);
		CellStyle styleHeader = sxssfWorkbook.createCellStyle();
		CellStyle styleBody = sxssfWorkbook.createCellStyle();
		
		generateHeaderStyleColumn(font, styleHeader);
		generateHeaderStyleColumn(fontBody, styleBody);
		
		Row rowHeader = sxssfSheet.createRow(Constant.RowColumn.REPORT_ROW_START);
		String[] headerList = generateValueHeader();
		for (int i=0 ; i < headerList.length; i++) {
			Cell cell = rowHeader.createCell(i);
			rowHeader.getCell(i).setCellStyle(styleHeader);
			cell.setCellValue(headerList[i]);
		}
		
		List<ProductSpesific> listData = productDaoService
				.findProductByFilter(reportParameter.getStartDate(), reportParameter.getEndDate(), reportParameter.getCategory());
		
		generateBody(listData, sxssfSheet, styleBody);
		setHeaderStyle(rowHeader, styleBody, sxssfSheet, Constant.RowColumn.REPORT_TOTAL_COLUMN);
		sxssfWorkbook.write(bos);
		bos.close();
		
		result.setBody(bos.toByteArray());
		result.setFileType(Constant.XLSX_FORMAT);
		String date = setDate(reportParameter.getStartDate(), reportParameter.getEndDate());
		result.setFileName(Constant.RowValue.REPORT_NAME + "[ " + date + " ]." + result.getFileType());
		return result;
	}

	
	private void generateBody(List<ProductSpesific> listData, SXSSFSheet sxssfSheet, CellStyle cellStyle) {
		int rowNumber = Constant.RowColumn.REPORT_ROW_START +1;
		int currentNumber = 1;
		
		for (ProductSpesific data : listData) {
			Row row = sxssfSheet.createRow(rowNumber++);
			row.createCell(0).setCellValue(String.valueOf(currentNumber));
			row.createCell(1).setCellValue(DATE_FORMATTER_DETAIL.format(data.getCreatedOn()));
			row.createCell(2).setCellValue(data.getProductName());
			row.createCell(3).setCellValue(data.getProductCode());
			row.createCell(4).setCellValue(data.getCategoryName());
			row.createCell(5).setCellValue(convertBigDecimalToString(data.getProductPrice()));
			setBodyStyle(row, cellStyle, Constant.RowColumn.REPORT_TOTAL_COLUMN);
			currentNumber++;
		}
		
		generateTotal(sxssfSheet, rowNumber, listData.size());
		
	}
	
	
	private void generateTotal(SXSSFSheet sxssfSheet, Integer rowNumber, int total) {
		rowNumber +=3;
		Row rowTotal = sxssfSheet.createRow(rowNumber);
		rowTotal.createCell(0).setCellValue(Constant.RowValue.DATA_TOTAL);
		String totalData = String.valueOf(total);
		rowTotal.createCell(2).setCellValue(" : " + totalData);
		
	}
	
}
