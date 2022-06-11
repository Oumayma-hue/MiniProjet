package com.gsnotes.services.impl;

import java.util.List;

import javax.transaction.Transactional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.gsnotes.bo.Element;
import com.gsnotes.bo.Module;
import com.gsnotes.dao.IModuleDao;
import com.gsnotes.services.IModuleService;

@Service
@Transactional
public class ModuleServiceImpl implements IModuleService{

	@Autowired
	private IModuleDao moduleDao;
	
	@Override
	public void addModule(Module pModule) {
		moduleDao.save(pModule);
		
	}

	@Override
	public void updateModule(Module pModule) {
		moduleDao.save(pModule);
	}

	@Override
	public List<Module> getAllModules() {
		return moduleDao.findAll();
	}

	@Override
	public void deleteModule(Long id) {
		moduleDao.deleteById(id);
	}

	@Override
	public Module getModuleById(Long id) {
		return moduleDao.findById(id).get();
	}

	@Override
	public Module getModuleByTitre(String titre) {
		return moduleDao.getModuleByTitre(titre);
	}

	@Override
	public List<Element> getElementsByModuleTitre(String titre) {
		return moduleDao.getModuleByTitre(titre).getElements();
	}

	
	
}
