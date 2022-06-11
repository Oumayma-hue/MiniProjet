package com.gsnotes.services;

import com.gsnotes.bo.Niveau;
import com.gsnotes.utils.export.ExcelDeliberationExporter;

import java.util.List;

public interface INiveauService {

    void addNiveau(Niveau pNiveau);

    void updateNiveau(Niveau pNiveau);

    List<Niveau> getAllNiveaux();

    void deleteNiveau(Long id);

    Niveau getNiveauById(Long id);
            
    ExcelDeliberationExporter prepareDelibeartionExport(Niveau niveau);
}
