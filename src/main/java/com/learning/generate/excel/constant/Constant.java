package com.learning.generate.excel.constant;

import org.apache.poi.ss.usermodel.BorderStyle;

public interface Constant {

	final String XLSX_FORMAT = "xlsx";
	final String SHEETNAME = "Sheet1";
	final String ROW_PER_PART = "row.per.part";		
	
	class RowColumn {
		public static final Integer REPORT_ROW_TITLE = 0;
		public static final Integer REPORT_ROW_DATE = 2;
		public static final Integer REPORT_ROW_START = 3;
		public static final Integer REPORT_TOTAL_COLUMN = 6;
	}
	
	class RowValue {
		public static final String REPORT_NAME = "Report Laporan Produk";
		public static final String REPORT_DATE_NAME = "Tanggal Download";
		public static final String DATA_TOTAL = "Total data";
		
		public static final String PRODUCT_NUMBER = "No";
		public static final String PRODUCT_NAME = "Nama Produk";
		public static final String PRODUCT_CODE = "Kode Produk";
		public static final String PRODUCT_DATE = "Tanggal Input Produk";
		public static final String PRODUCT_CATEGORY = "Kategori Produk";
		public static final String PRODUCT_PRICE = "Harga Produk";
	}
	
	class Style {
		public static final BorderStyle BOLDWEIGHT_BOLD = BorderStyle.THICK;
		public static final BorderStyle BORDER_THIN = BorderStyle.THIN;
	}
}
