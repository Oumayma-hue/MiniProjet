package com.gsnotes.services;

import java.util.List;

import com.gsnotes.bo.Etudiant;
import com.gsnotes.bo.Niveau;

public interface IEtudiantService {
	
	void addEtudiant(Etudiant pEtudiant);

    void updateEtudiant(Etudiant pEtudiant);

    List<Etudiant> getAllEtudiants();

    void deleteEtudiant(Long id);

    Etudiant getEtudiantById(Long id);
        
    public List<Etudiant> getEtudiantsByNiveau(Niveau pNiveau);
    
}
