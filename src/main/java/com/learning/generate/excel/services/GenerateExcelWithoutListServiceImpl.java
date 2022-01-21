package com.learning.generate.excel.services;

import java.io.ByteArrayOutputStream;
import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.text.ParseException;
import java.util.Objects;
import java.util.concurrent.TimeUnit;

import org.apache.poi.ss.usermodel.Cell;
import org.apache.poi.ss.usermodel.CellStyle;
import org.apache.poi.ss.usermodel.Font;
import org.apache.poi.ss.usermodel.Row;
import org.apache.poi.xssf.streaming.SXSSFSheet;
import org.apache.poi.xssf.streaming.SXSSFWorkbook;
import org.apache.poi.xssf.usermodel.XSSFSheet;
import org.apache.poi.xssf.usermodel.XSSFWorkbook;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.core.env.Environment;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.stereotype.Service;

import com.learning.generate.excel.constant.Constant;
import com.learning.generate.excel.persistence.services.ProductDaoService;
import com.learning.generate.excel.services.entities.ReportParameter;
import com.learning.generate.excel.services.entities.ReportResponse;

@Service
public class GenerateExcelWithoutListServiceImpl extends CommonService implements GenerateExcelWithoutListService {

	private static final String QUERY_REPORT_PRODUCT = "SELECT p.created_on, p.product_name, p.product_code, "
			+ "c.category_name, p.product_price FROM product p JOIN category c ON p.category_id = c.category_id "
			+ "WHERE c.category_name LIKE (':category') AND to_char(p.created_on, 'yyyy-MM-dd') >= (':startDate') "
			+ "AND to_char(p.created_on, 'yyyy-MM-dd') <= (':endDate') AND p.is_deleted = false "
			+ "OFFSET (':offset') ROWS FETCH NEXT (':row') ROWS ONLY";
	
	private static int ROW_NUM = Constant.RowColumn.REPORT_ROW_START +1;
	private static int CURRENT_NUMBER = 1;
	
	@Autowired
	private ProductDaoService productDaoService;
	@Autowired
	private JdbcTemplate jdbcTemplate;
	@Autowired
	private Environment env;

	@Override
	public ReportResponse generateExcel(ReportParameter reportParameter) throws ParseException, SQLException, IOException {
		long startGenerate = System.nanoTime();
		
		ReportResponse result = new ReportResponse();
		
		XSSFWorkbook wb = new XSSFWorkbook();
		XSSFSheet xssfSheet = wb.createSheet(Constant.SHEETNAME);
		
		SXSSFWorkbook sxssfWorkbook = new SXSSFWorkbook(wb, 100);
		sxssfWorkbook.setCompressTempFiles(true);
		
		SXSSFSheet sxssfSheet = sxssfWorkbook.getSheet(Constant.SHEETNAME);
		ByteArrayOutputStream bos = new ByteArrayOutputStream();
		
		sxssfSheet.setRandomAccessWindowSize(100); // keep 100 rows in memory, exceeding rows will be flushed
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
		
		generateBody(sxssfSheet, styleBody, reportParameter.getStartDate(), reportParameter.getEndDate(), 
				reportParameter.getCategory());
		setHeaderStyle(rowHeader, styleBody, sxssfSheet, Constant.RowColumn.REPORT_TOTAL_COLUMN);
		sxssfWorkbook.write(bos);
		bos.close();
		sxssfWorkbook.dispose();
		
		result.setBody(bos.toByteArray());
		result.setFileType(Constant.XLSX_FORMAT);
		String date = setDate(reportParameter.getStartDate(), reportParameter.getEndDate());
		result.setFileName(Constant.RowValue.REPORT_NAME + "[ " + date + " ]." + result.getFileType());
		
		long endGenerate = System.nanoTime();
		long finishGenerate = TimeUnit.SECONDS.convert((endGenerate - startGenerate), TimeUnit.NANOSECONDS);
		logger.info("{}{} CONSUME TIME FOR GENERATE EXCEL WITHOUT LIST {}{} : " + finishGenerate);
		return result;
	}
	
	
	private void generateBody(SXSSFSheet sxssfSheet, CellStyle cellStyle, String startDate, String endDate, String category) throws SQLException {	
		Integer totalData = Integer.valueOf(productDaoService.getTotalData(startDate, endDate, category));
		ResultSet data = null;
		
		try (Connection connection = Objects.requireNonNull(jdbcTemplate.getDataSource().getConnection())) {
			Integer offset = 0;
			Integer rowPerPart = Integer.valueOf(env.getProperty(Constant.ROW_PER_PART));
			
			while (offset < rowPerPart) {
				boolean endOfCurrentBatch = false;
				
				while (!endOfCurrentBatch) {
					if (data == null) {
						data = initializeResultSetForCurrentBatch(connection, startDate, endDate, category, offset);
					}
					
					boolean hasNextResultSet = data.next();
					if (hasNextResultSet) {
						generateDetailBody(data, sxssfSheet, cellStyle, totalData);
						ROW_NUM++;
						CURRENT_NUMBER++;
					}
					else {
						// end off current batch
						data = null;
						endOfCurrentBatch = true;
					}
				}
				offset += rowPerPart;
			}
		}
		generateTotal(sxssfSheet, ROW_NUM, totalData);
		ROW_NUM = Constant.RowColumn.REPORT_ROW_START + 1;
		CURRENT_NUMBER = 1;
		
	}
	
	
	private void generateDetailBody(ResultSet data, SXSSFSheet sxssfSheet, CellStyle cellStyle, int totalData) throws SQLException {
		Row row = sxssfSheet.createRow(ROW_NUM);
		row.createCell(0).setCellValue(CURRENT_NUMBER);
		row.createCell(1).setCellValue(DATE_FORMATTER_DETAIL.format(data.getDate("created_on")));
		row.createCell(2).setCellValue(data.getString("product_name"));
		row.createCell(3).setCellValue(data.getString("product_code"));
		row.createCell(4).setCellValue(data.getString("category_name"));
		row.createCell(5).setCellValue(convertBigDecimalToString(data.getBigDecimal("product_price")));
		setBodyStyle(row, cellStyle, Constant.RowColumn.REPORT_TOTAL_COLUMN);
	}
	private ResultSet initializeResultSetForCurrentBatch(Connection connection, String startDate, 
			String endDate, String category, Integer offset) throws SQLException {
		Integer row = Integer.valueOf(env.getProperty(Constant.ROW_PER_PART));
		String pagingQuery = getQuery(startDate, endDate, category, offset, row);
		PreparedStatement preparedStatement = connection.prepareStatement(pagingQuery); //NOSONAR
		ResultSet resultSet = preparedStatement.executeQuery();
		return resultSet;
	}
	
	private String getQuery(String startDate, String endDate, String category, Integer offset, Integer row) {
		String batch = offset.toString();
		String rowPerBatch = row.toString();
		return QUERY_REPORT_PRODUCT.replace(":startDate", startDate)
				.replace(":endDate", endDate)
				.replace(":category", category)
				.replace(":offset", batch)
				.replace(":row", rowPerBatch);
	}
	
}
