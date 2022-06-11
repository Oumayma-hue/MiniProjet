package com.gsnotes.services;

import java.util.List;

import com.gsnotes.bo.Compte;
import com.gsnotes.bo.Role;
import com.gsnotes.utils.export.ExcelExporter;


public interface ICompteService {
	
	List<Role> getAllRoles();
	
	List<Compte> getAllAccounts();

	Compte getAccountByUserName(String login);
	
	String createUser(Long idRole, Long idPerson);
	
	ExcelExporter prepareCompteExport(List<Compte> comptes) ;
}
