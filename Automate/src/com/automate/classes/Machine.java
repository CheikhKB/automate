package com.automate.classes;

import java.util.List;

import javax.persistence.*;

import org.hibernate.annotations.Fetch;
import org.hibernate.annotations.FetchMode;

import com.fasterxml.jackson.annotation.JsonManagedReference;

@Entity
@Table(name="Machine")
public class Machine {
	
	@Id
	@Column(name="numeroSerie")
	private String numeroSerie;
	
	@Column(name="type")
	private int type; 
	
	@Column(name="adresseInstallation")
	private String adresseInstallation;
	
	@Column(name="emplacement")
	private String emplacement;
	
	@Column(name="latitude")
	private String latitude; 
	
	@Column(name="longitude")
	private String longitude;
	
	@Column(name="module")
	private String module;
	
	@JsonManagedReference
	@OneToMany(mappedBy = "machine", fetch = FetchType.EAGER, cascade = {CascadeType.REMOVE})
	@Fetch(value = FetchMode.SUBSELECT)
	private List<Note> notes; 
	
	@JsonManagedReference
	@OneToMany(mappedBy = "machine", fetch = FetchType.EAGER, cascade = {CascadeType.REMOVE})
	@Fetch(value = FetchMode.SUBSELECT)
	private List<Rapport> rapports;
	
	//constructeurs
	public Machine() {
		
	}
	
	public Machine(String ns, int t, String ai, String e, String la, String lo, String m) {
		this.setType(t);
		this.setNumeroSerie(ns);
		this.setAdresseInstallation(ai);
		this.setEmplacement(e);
		this.setLatitude(la);
		this.setLongitude(lo);
		this.setModule(m);
	}
	
	//getters
	public String getNumeroSerie() {
		return this.numeroSerie;
	}
	public int getType() {
		return this.type;
	}
	public String getAdresseInstallation() {
		return this.adresseInstallation;
	}
	public String getEmplacement() {
		return this.emplacement;
	}
	public String getLatitude() {
		return this.latitude;
	}
	public String getLongitude() {
		return this.longitude;
	}
	public List<Note> getNotes(){
		return this.notes;
	}
	public String getModule() {
		return this.module;
	}
	public List<Rapport> getRapports(){
		return this.rapports;
	}
	
	//setters
	public void setType(int t) {
		this.type=t;
	}
	public void setNumeroSerie(String ns) {
		this.numeroSerie=ns;
	}
	public void setAdresseInstallation(String ai) {
		this.adresseInstallation=ai;
	}
	public void setEmplacement(String e) {
		this.emplacement=e;
	}
	public void setLatitude(String l) {
		this.latitude=l;
	}
	public void setLongitude(String l) {
		this.longitude=l;
	}
	public void addNotes(Note n){
		this.notes.add(n);
	}
	public void setModule(String m) {
		this.module=m;
	}
	public void addRapports(Rapport r){
		this.rapports.add(r);
	}
	
}
