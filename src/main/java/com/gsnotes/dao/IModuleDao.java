package com.gsnotes.dao;

import org.springframework.data.jpa.repository.JpaRepository;
import com.gsnotes.bo.Module;


public interface IModuleDao extends JpaRepository<Module ,Long>{

	Module getModuleByTitre(String titre);
	
}
