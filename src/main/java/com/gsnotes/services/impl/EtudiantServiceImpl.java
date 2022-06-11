package com.gsnotes.services.impl;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.gsnotes.bo.Etudiant;
import com.gsnotes.bo.InscriptionAnnuelle;
import com.gsnotes.bo.Niveau;
import com.gsnotes.dao.IEtudiantDao;
import com.gsnotes.services.IEtudiantService;


@Service
@Transactional
public class EtudiantServiceImpl implements IEtudiantService{
	
	@Autowired
	private IEtudiantDao etudiantDao;
	
	@Override
	public void addEtudiant(Etudiant pEtudiant) {
		etudiantDao.save(pEtudiant);
	}

	@Override
	public void updateEtudiant(Etudiant pEtudiant) {
    	etudiantDao.save(pEtudiant);
    }

	@Override
	public List<Etudiant> getAllEtudiants(){
    	return etudiantDao.findAll();
    }

	@Override
	public void deleteEtudiant(Long id) {
    	etudiantDao.deleteById(id);
    }

	@Override
	public Etudiant getEtudiantById(Long id) {
    	return etudiantDao.getById(id);
    }
    
    @Override
    public List<Etudiant> getEtudiantsByNiveau(Niveau pNiveau){
    	List<InscriptionAnnuelle> listes = pNiveau.getInscriptions();
		List<Etudiant> etudiants = new ArrayList<>();
		for(InscriptionAnnuelle a : listes) etudiants.add(a.getEtudiant());
		return etudiants;
    }

}
