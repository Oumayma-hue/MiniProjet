package com.gsnotes.utils.export;

import javax.servlet.http.HttpServletResponse;

import org.apache.poi.ss.usermodel.CellStyle;
import org.apache.poi.ss.usermodel.Row;

public interface IExcelExporter {

	void writeHeaderLine();
	
	void createCell(Row row, int columnCount, Object value, CellStyle style);
	
	void writeDataLines();
	
	void export(HttpServletResponse response);
	
}
