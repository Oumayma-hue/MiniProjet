package com.gsnotes.services.impl;

import com.gsnotes.bo.Etudiant;
import com.gsnotes.bo.InscriptionAnnuelle;
import com.gsnotes.bo.InscriptionMatiere;
import com.gsnotes.bo.InscriptionModule;
import com.gsnotes.bo.Niveau;
import com.gsnotes.bo.Module;
import com.gsnotes.dao.INiveauDao;
import com.gsnotes.services.IEtudiantService;
import com.gsnotes.services.INiveauService;
import com.gsnotes.utils.export.ExcelDeliberationExporter;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import java.util.List;

@Service
@Transactional
public class NiveauServiceImpl implements INiveauService {

    @Autowired
    private INiveauDao niveauService;
    
    @Autowired
    private IEtudiantService etudiantService;

    @Override
    public void addNiveau(Niveau pNiveau) {
        niveauService.save(pNiveau);
    }

    @Override
    public void updateNiveau(Niveau pNiveau) {
        niveauService.save(pNiveau);
    }

    @Override
    public List<Niveau> getAllNiveaux() {
        return niveauService.findAll();
    }

    @Override
    public void deleteNiveau(Long id) {
        niveauService.deleteById(id);
    }
    
	@Override
    public Niveau getNiveauById(Long id) {
        return niveauService.getById(id);
    }
    
	/*
    @Override
    public ExcelDeliberationExporter prepareDelibeartionExport(Niveau niveau){
        List<String> columnNames = new ArrayList<>();
        columnNames.add("ID Etudiant");
        columnNames.add("CNE");
        columnNames.add("NOM");
        columnNames.add("PRENOM");
        for(Module m : niveau.getModules()) columnNames.add(m.getTitre());
        columnNames.add("Moyenne");
        columnNames.add("Rang");
        List<Etudiant> etudiants = etudiantService.getEtudiantsByNiveau(niveau);
        String[][] data = new String[etudiants.size()][columnNames.size()];

        int i = 0;
        for (Etudiant e : etudiants) {
            data[i][0] = String.valueOf(e.getIdUtilisateur());
            data[i][1] = e.getCne();
            data[i][2] = e.getNom();
            data[i][3] = e.getPrenom();
            List<Double> notes = etudiantService.getAllNotes(e);
            for(int j = 0; j < notes.size(); j++) {
            	data[i][j+4] = Double.toString(notes.get(j));
            }
            i++;
        }

        return new ExcelDeliberationExporter(columnNames, data, "etudiants", niveau.getModules());
    }
    */
	
	public double getNote(String cne, String nomModule) {
		
		return 0;
	}

	@Override
    public ExcelDeliberationExporter prepareDelibeartionExport(Niveau niveau){
		List<Etudiant> etudiants = etudiantService.getEtudiantsByNiveau(niveau);
		int numberColumns = 0;
		for(Module m : niveau.getModules()) numberColumns += 2 + m.getElements().size();
        String[][] data = new String[etudiants.size()][4 + numberColumns + 2];

        int i = 0;
        for (Etudiant e : etudiants) {
        	int j=0;
        	data[i][j++] = String.valueOf(e.getIdUtilisateur());
            data[i][j++] = e.getCne();
            data[i][j++] = e.getNom();
            data[i][j++] = e.getPrenom();
            double k;
            double m;
            List<InscriptionAnnuelle> list = e.getInscriptions();
        	for(InscriptionAnnuelle a : list) {
        		m=a.getMoy();
        		k=a.getRang();
        		for(InscriptionModule b: a.getInscriptionModules()) {
        			if(b.getInscriptionMatieres().size()==1) {
        				data[i][j++] = ""+b.getNoteFinale();
            			data[i][j++] = b.getValidation();	
        			}
        			else {
        				for(InscriptionMatiere c : b.getInscriptionMatieres()) {
            				data[i][j++] = a.getIdInscription() + "/"+ b.getIdInscriptionModule() + "/" + c.getNoteFinale();
            			}
            			data[i][j++] = ""+b.getNoteFinale();
            			data[i][j++] = b.getValidation();
            			
           
        			}
        			
        		}
        		data[i][j++] =String.valueOf(m);
        		data[i][j++] =String.valueOf(k);
        		
        	}
        	/*;*/
        	
            i++;
        }
        return new ExcelDeliberationExporter(niveau, data,"etudiants");
    }
	
}
