package com.learning.generate.excel.services;

import java.math.BigDecimal;
import java.text.DecimalFormat;
import java.text.NumberFormat;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.Locale;

import org.apache.poi.ss.usermodel.CellStyle;
import org.apache.poi.ss.usermodel.FillPatternType;
import org.apache.poi.ss.usermodel.Font;
import org.apache.poi.ss.usermodel.HorizontalAlignment;
import org.apache.poi.ss.usermodel.IndexedColors;
import org.apache.poi.ss.usermodel.Row;
import org.apache.poi.ss.usermodel.Sheet;
import org.apache.poi.ss.usermodel.VerticalAlignment;
import org.apache.poi.ss.util.CellRangeAddress;
import org.apache.poi.xssf.streaming.SXSSFSheet;
import org.apache.poi.xssf.streaming.SXSSFWorkbook;
import org.apache.poi.xssf.usermodel.XSSFCellStyle;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

import com.learning.generate.excel.constant.Constant;
import com.learning.generate.excel.services.entities.ReportParameter;

public class CommonService {
	
	Logger logger = LoggerFactory.getLogger(CommonService.class);
	
	protected final SimpleDateFormat DATE_FORMATTER_REPORT = new SimpleDateFormat("dd/MM/yyyy");
	protected final SimpleDateFormat DATE_FORMATTER_REQUEST = new SimpleDateFormat("yyyy-MM-dd");
	protected final SimpleDateFormat DATE_FORMATTER_DETAIL = new SimpleDateFormat("dd MMM yyyy");
	
	protected void generateHeader(SXSSFWorkbook workBook, SXSSFSheet sxssfSheet, ReportParameter reportParameter) throws ParseException {
		Row rowTitle = sxssfSheet.createRow(Constant.RowColumn.REPORT_ROW_TITLE);
		rowTitle.createCell(0).setCellValue(Constant.RowValue.REPORT_NAME.toUpperCase());
		Font fontTitle = workBook.createFont();
		fontTitle.setFontHeightInPoints((short) 20);
		fontTitle.setBold(true);
		
		CellStyle styleTitle = workBook.createCellStyle();
		styleTitle.setFont(fontTitle);
		rowTitle.getCell(0).setCellStyle(styleTitle);
		
		Row rowDate = sxssfSheet.createRow(Constant.RowColumn.REPORT_ROW_DATE);
		rowDate.createCell(0).setCellValue(Constant.RowValue.REPORT_DATE_NAME);
		String date = setDate(reportParameter.getStartDate(), reportParameter.getEndDate());
		rowDate.createCell(2).setCellValue(": " + date);
		
		//	for merge column
		sxssfSheet.addMergedRegion(new CellRangeAddress(
				Constant.RowColumn.REPORT_ROW_DATE,
				Constant.RowColumn.REPORT_ROW_DATE,
				0,1));
	}
	
	protected String setDate(String startDate, String endDate) throws ParseException {
		Date dateStart = DATE_FORMATTER_REQUEST.parse(startDate);
		Date dateEnd = DATE_FORMATTER_REQUEST.parse(endDate);
		String result = DATE_FORMATTER_REPORT.format(dateStart) + " s/d " + DATE_FORMATTER_REPORT.format(dateEnd);
		return result;
	}
	
	protected void generateHeaderStyleColumn(Font font, CellStyle cellStyle) {
		cellStyle.setFont(font);
		cellStyle.setAlignment(HorizontalAlignment.CENTER);
		cellStyle.setFillBackgroundColor(IndexedColors.GREY_80_PERCENT.getIndex());
		cellStyle.setFillPattern(FillPatternType.NO_FILL);
		cellStyle.setFillForegroundColor(IndexedColors.GREY_80_PERCENT.getIndex());
		cellStyle.setVerticalAlignment(VerticalAlignment.CENTER);
		cellStyle.setBorderTop(Constant.Style.BORDER_THIN);
		cellStyle.setBorderRight(Constant.Style.BORDER_THIN);
		cellStyle.setBorderLeft(Constant.Style.BORDER_THIN);
		cellStyle.setBorderBottom(Constant.Style.BORDER_THIN);
		
	}
	
	
	protected void setHeaderStyle(Row row, CellStyle cellStyle, SXSSFSheet sxssfSheet, int totalColumn) {
		for (int i=0; i<totalColumn; i++) {
			row.getCell(i).setCellStyle(cellStyle);
//			sxssfSheet.autoSizeColumn(i, true);
		}
	}
	
	
	protected void setBodyStyle(Row row, CellStyle cellStyle, int totalColumn) {
		for (int i=0 ; i<totalColumn; i++) {
			row.getCell(i).setCellStyle(cellStyle);
		}
	}
	
	
	protected String[] generateValueHeader() {
		return new String[] {
			Constant.RowValue.PRODUCT_NUMBER,
			Constant.RowValue.PRODUCT_DATE,
			Constant.RowValue.PRODUCT_NAME,
			Constant.RowValue.PRODUCT_CODE,
			Constant.RowValue.PRODUCT_CATEGORY,
			Constant.RowValue.PRODUCT_PRICE
		};
	}
	
	
	protected String convertBigDecimalToString(BigDecimal nominal) {
		if (nominal == null) {
			return "";
		}
		DecimalFormat decimalFormat = (DecimalFormat) NumberFormat.getNumberInstance(Locale.ITALY);
		return decimalFormat.format(nominal);
	}
	
	
	protected void generateTotal(SXSSFSheet sxssfSheet, Integer rowNumber, int total) {
		rowNumber +=1;
		Row rowTotal = sxssfSheet.createRow(rowNumber);
		rowTotal.createCell(0).setCellValue(Constant.RowValue.DATA_TOTAL);
		String totalData = String.valueOf(total);
		rowTotal.createCell(2).setCellValue(" : " + totalData);
		
	}
	
}
