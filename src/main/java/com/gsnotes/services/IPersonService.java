package com.gsnotes.services;

import java.util.List;

import com.gsnotes.bo.Utilisateur;
import com.gsnotes.utils.export.ExcelExporter;

public interface IPersonService {

	void addPerson(Utilisateur pPerson);

	void updatePerson(Utilisateur pPerson);

	List<Utilisateur> getAllPersons();

	void deletePerson(Long id);

	Utilisateur getPersonById(Long id);
	
	Utilisateur getPersonByCin(String cin);
	
	ExcelExporter preparePersonExport(List<Utilisateur> persons);

}
