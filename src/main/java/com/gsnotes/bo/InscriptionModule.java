package com.gsnotes.bo;

import java.util.List;

import javax.persistence.CascadeType;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;

import javax.persistence.ManyToOne;
import javax.persistence.OneToMany;

@Entity
public class InscriptionModule {

	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private Long idInscriptionModule;

	private double noteSN;
	private double noteSR;
	private double noteFinale;
	private String validation;
	private String plusInfos;

	@ManyToOne
	@JoinColumn(name = "idModule")
	private Module module;

	@ManyToOne
	@JoinColumn(name = "idInscription")
	private InscriptionAnnuelle inscriptionAnnuelle;

	@OneToMany(mappedBy = "inscriptionModule", cascade = CascadeType.ALL, targetEntity = InscriptionMatiere.class)
	private List<InscriptionMatiere> inscriptionMatieres;
	
	public InscriptionModule() {
	}

	public Long getIdInscriptionModule() {
		return idInscriptionModule;
	}

	public void setIdInscriptionModule(Long idInscriptionModule) {
		this.idInscriptionModule = idInscriptionModule;
	}

	public double getNoteSN() {
		return noteSN;
	}

	public void setNoteSN(double noteSN) {
		this.noteSN = noteSN;
	}

	public double getNoteSR() {
		return noteSR;
	}

	public void setNoteSR(double noteSR) {
		this.noteSR = noteSR;
	}

	public double getNoteFinale() {
		return noteFinale;
	}

	public void setNoteFinale(double noteFinale) {
		this.noteFinale = noteFinale;
	}

	public String getValidation() {
		return validation;
	}

	public void setValidation(String validation) {
		this.validation = validation;
	}

	public String getPlusInfos() {
		return plusInfos;
	}

	public void setPlusInfos(String plusInfos) {
		this.plusInfos = plusInfos;
	}

	public Module getModule() {
		return module;
	}

	public void setModule(Module module) {
		this.module = module;
	}

	public InscriptionAnnuelle getInscriptionAnnuelle() {
		return inscriptionAnnuelle;
	}

	public void setInscriptionAnnuelle(InscriptionAnnuelle inscriptionAnnuelle) {
		this.inscriptionAnnuelle = inscriptionAnnuelle;
	}
	
	public List<InscriptionMatiere> getInscriptionMatieres() {
		return inscriptionMatieres;
	}

	public void setInscriptionMatieres(List<InscriptionMatiere> inscriptionMatieres) {
		this.inscriptionMatieres = inscriptionMatieres;
	}



}
