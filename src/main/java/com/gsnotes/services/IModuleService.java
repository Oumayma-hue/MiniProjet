package com.gsnotes.services;

import java.util.List;

import com.gsnotes.bo.Module;
import com.gsnotes.bo.Element;


public interface IModuleService {

	void addModule(Module pModule);

    void updateModule(Module pModule);

    List<Module> getAllModules();

    void deleteModule(Long id);

    Module getModuleById(Long id);
    
    Module getModuleByTitre(String titre);
    
    List<Element> getElementsByModuleTitre(String titre);
}
