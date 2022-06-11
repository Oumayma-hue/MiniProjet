package com.gsnotes.utils.export;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.ServletOutputStream;
import javax.servlet.http.HttpServletResponse;

import org.apache.poi.ss.usermodel.BorderStyle;
import org.apache.poi.ss.usermodel.Cell;
import org.apache.poi.ss.usermodel.CellStyle;
import org.apache.poi.ss.usermodel.FillPatternType;
import org.apache.poi.ss.usermodel.HorizontalAlignment;
import org.apache.poi.ss.usermodel.IndexedColors;
import org.apache.poi.ss.usermodel.Row;
import org.apache.poi.ss.usermodel.VerticalAlignment;
import org.apache.poi.ss.util.CellRangeAddress;
import org.apache.poi.xssf.usermodel.XSSFFont;
import org.apache.poi.xssf.usermodel.XSSFSheet;
import org.apache.poi.xssf.usermodel.XSSFWorkbook;

import com.gsnotes.bo.Element;
import com.gsnotes.bo.Etudiant;
import com.gsnotes.bo.Niveau;
import com.gsnotes.bo.Module;


public class ExcelDeliberationExporter {
	
	private final XSSFWorkbook workbook;
	private XSSFSheet sheet;
	private final List<String> columnNames;
	private final String[][] data;
	private String sheetName ;
	private Niveau niveau;
	
	public List<String> createColumnsNamesByNiveau(Niveau niveau){
		List<String> columnNames = new ArrayList<>();
        columnNames.add("ID Etudiant");
        columnNames.add("CNE");
        columnNames.add("NOM");
        columnNames.add("PRENOM");
        for(Module m : niveau.getModules()) columnNames.add(m.getTitre());
        columnNames.add("Moyenne");
        columnNames.add("Rang");
        return columnNames;
	}
	
	public ExcelDeliberationExporter(Niveau niveau, String[][] data,String sheetName) {
		this.niveau = niveau;
		this.columnNames = createColumnsNamesByNiveau(niveau);
		this.data = data;
		this.sheetName = sheetName;
		workbook = new XSSFWorkbook();
	}

	private void createCell(Row row, int columnCount, Object value, CellStyle style) {
		sheet.setDefaultColumnWidth(20);
		Cell cell = row.createCell(columnCount);
		if (value instanceof Integer) {
			cell.setCellValue((Integer) value);
		} else if (value instanceof Boolean) {
			cell.setCellValue((Boolean) value);
		} else if(value instanceof Double) {
			cell.setCellValue((Double) value);
		}else {
			cell.setCellValue((String) value);
		}
		cell.setCellStyle(style); 
	}
		
	public CellStyle createStyle(boolean isBold,int fontSize, String fontName, short backgroundColor) {
		CellStyle style = workbook.createCellStyle();
		
		// Font
		XSSFFont font = workbook.createFont();
		font.setBold(isBold);
		font.setFontHeight(fontSize);
		font.setFontName(fontName);
		style.setFont(font);
		
		// background Color
		style.setFillForegroundColor(backgroundColor);
	    style.setFillPattern(FillPatternType.SOLID_FOREGROUND);
		
		// text-align : center;
		style.setAlignment(HorizontalAlignment.CENTER);
		style.setVerticalAlignment(VerticalAlignment.CENTER);
		
		// border : thin black
		style.setBorderRight(BorderStyle.THIN);
        style.setRightBorderColor(IndexedColors.BLACK.getIndex());
        style.setBorderBottom(BorderStyle.THIN);
        style.setBottomBorderColor(IndexedColors.BLACK.getIndex());
        style.setBorderLeft(BorderStyle.THIN);
        style.setLeftBorderColor(IndexedColors.BLACK.getIndex());
        style.setBorderTop(BorderStyle.THIN);
        style.setTopBorderColor(IndexedColors.BLACK.getIndex());
		
        return style;
	}

	public void writeHeaderLine(Niveau niveau) {
		sheet = workbook.createSheet(sheetName);
		CellStyle style = createStyle(true, 12, "Calibri", IndexedColors.LIGHT_GREEN.getIndex());
		CellStyle style2 = createStyle(false, 10, "Arial", IndexedColors.WHITE.getIndex());
		
		// First Row
		Row row = sheet.createRow(0);
		row.setHeightInPoints(2 * sheet.getDefaultRowHeightInPoints());
	    createCell(row,0,"Année Universitaire",style);
		createCell(row,1,"2021/2022",style2);
		createCell(row,2,"Date Deliberation",style);
		createCell(row,3,"30/07/2022",style2);
		
		// Second Row
		row = sheet.createRow(1);
		row.setHeightInPoints(2 * sheet.getDefaultRowHeightInPoints());
		createCell(row,0,"Classe",style);
		createCell(row,1,niveau.getAlias(),style2);
        
		// the black row
		row = sheet.createRow(2);
        style2 = createStyle(false, 9, "Arial", IndexedColors.BLACK.index);
        for(int j = 0; j < columnNames.size(); j++) createCell(row,j,"",style2);
        
        // the rows of modules and elements names
        style = createStyle(true,12,"Calibri",IndexedColors.LIGHT_CORNFLOWER_BLUE.index);
		row = sheet.createRow(3);
		Row row1 = sheet.createRow(4);
		row.setHeightInPoints(2 * sheet.getDefaultRowHeightInPoints());
		row1.setHeightInPoints(2 * sheet.getDefaultRowHeightInPoints());
		
		int i = 0;
		int m = 0;
		for (String it : columnNames) {
			if(i<4 || "Moyenne".equals(it) || "Rang".equals(it)) {
				createCell(row1, i, "", style);
				createCell(row, (i++), it, style);
			} else {
				List<Element> elements = niveau.getModules().get(m++).getElements();
				for(Element e : elements) {
					createCell(row1, i, e.getNom(), style);
					createCell(row, (i++), it, style);
				}
				createCell(row1, i, "Moyenne", style);
				createCell(row, (i++), it, style);
				createCell(row1, i, "Validation", style);
				createCell(row, (i++), "", style);
				sheet.addMergedRegion(new CellRangeAddress(3,3,i-2-elements.size(),i-1));
			}
		}
	}
			
	private void writeDataLines() {
		int rowCount = 5;
		CellStyle style = createStyle(false, 12, "Arial", IndexedColors.WHITE.index);
		// style.setDataFormat(workbook.getCreationHelper().createDataFormat().getFormat("0.00"));
		for (String[] datum : data) {
			Row row = sheet.createRow(rowCount++);
			int columnCount = 0;
			for (String s : datum) {
				createCell(row, columnCount++, s, style);
			}
		}
	}
	
	public void exportDelibeartion(HttpServletResponse response, Niveau niveau) throws IOException {
		writeHeaderLine(niveau);
		writeDataLines();
		
		ServletOutputStream outputStream = response.getOutputStream();
		workbook.write(outputStream);
		workbook.close();

		outputStream.close();
	}
	
}
