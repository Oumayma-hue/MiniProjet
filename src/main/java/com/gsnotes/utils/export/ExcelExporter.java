package com.gsnotes.utils.export;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletOutputStream;
import javax.servlet.http.HttpServletResponse;

import org.apache.poi.ss.usermodel.Cell;
import org.apache.poi.ss.usermodel.CellStyle;
import org.apache.poi.ss.usermodel.HorizontalAlignment;
import org.apache.poi.ss.usermodel.Row;
import org.apache.poi.xssf.usermodel.XSSFFont;
import org.apache.poi.xssf.usermodel.XSSFSheet;
import org.apache.poi.xssf.usermodel.XSSFWorkbook;



public class ExcelExporter {
	private final XSSFWorkbook workbook;
	private XSSFSheet sheet;

	private final List<String> columnNames;
	private final String[][] data;
	private String sheetName = "";

	public ExcelExporter(List<String> columnNames, String[][] data, String sheetName) {
		this.columnNames = columnNames;
		this.data = data;
		this.sheetName = sheetName;
		workbook = new XSSFWorkbook();
	}

	private void writeHeaderLine() {
		sheet = workbook.createSheet(sheetName);
		
		Row row = sheet.createRow(0);

		CellStyle style = workbook.createCellStyle();
		XSSFFont font = workbook.createFont();
		font.setBold(true);
		font.setFontHeight(14);
		style.setFont(font);
		int i = 0;
		for (String it : columnNames) {
			createCell(row, (i++), it, style);
		}
	}

	private void createCell(Row row, int columnCount, Object value, CellStyle style) {
		sheet.autoSizeColumn(columnCount);
		Cell cell = row.createCell(columnCount);
		if (value instanceof Integer) {
			cell.setCellValue((Integer) value);
		} else if (value instanceof Boolean) {
			cell.setCellValue((Boolean) value);
		} else {
			cell.setCellValue((String) value);
		}
		cell.setCellStyle(style);
	}

	private void writeDataLines() {
		int rowCount = 1;

		CellStyle style = workbook.createCellStyle();
		XSSFFont font = workbook.createFont();
		font.setFontHeight(12);
		style.setFont(font);
		style.setAlignment(HorizontalAlignment.CENTER);

		for (String[] datum : data) {
			Row row = sheet.createRow(rowCount++);
			int columnCount = 0;
			for (String s : datum) {
				createCell(row, columnCount++, s, style);
			}
		}

	}
	
	public void export(HttpServletResponse response) throws IOException {
		writeHeaderLine();
		writeDataLines();

		ServletOutputStream outputStream = response.getOutputStream();
		workbook.write(outputStream);
		workbook.close();

		outputStream.close();
	}
}
