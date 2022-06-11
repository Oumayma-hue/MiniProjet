package com.gsnotes.web.controllers;

import com.gsnotes.bo.Niveau;
import com.gsnotes.services.INiveauService;
import com.gsnotes.utils.export.ExcelDeliberationExporter;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import java.io.IOException;
import javax.servlet.http.HttpServletResponse;

@Controller
@RequestMapping("/test")
public class TestController {

    @Autowired
    private INiveauService niveauService;
    
    @GetMapping("exportdeliberation")
    public void exportdeliberation(HttpServletResponse response,@RequestParam(name="idNiveau", defaultValue="4") Long idNiveau) throws IOException{
    	response.setContentType("application/octet-stream");

    	Niveau niveau = niveauService.getNiveauById(idNiveau);
    	
		String headerKey = "Content-Disposition";
		String headerValue = "attachment; filename=deliberation_" + niveau.getAlias() + ".xlsx";
		response.setHeader(headerKey, headerValue);
		
		ExcelDeliberationExporter excelExporter = niveauService.prepareDelibeartionExport(niveau);

		excelExporter.exportDelibeartion(response, niveau);
    }

}
