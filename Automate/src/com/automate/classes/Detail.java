package com.automate.classes;

import javax.persistence.Embeddable;
import javax.xml.bind.annotation.*;


@XmlRootElement
@Embeddable
public class Detail {

	private String etatActuel;
	
	private double temperature;
	
	private String monnayeur;
	
	private String cartesMagnetiques;
	
	private String cartesSansContact;
	
	private String erreurs;
	
	//constructeurs
	
	public Detail() {
		
	}
	
	public Detail(String ea, double t, String m, String cm, String csc, String e) {
		this.setEtatActuel(ea);
		this.setTemperature(t);
		this.setMonnayeur(m);
		this.setCartesMagnetiques(cm);
		this.setCartesSansContact(csc);
		this.setErreurs(e);
	}
	
	//getters
	
	public String getEtatActuel() {
		return this.etatActuel;
	}
	public double getTemperature() {
		return this.temperature;
	}
	public String getMonnayeur() {
		return this.monnayeur;
	}
	public String getCartesMagnetiques() {
		return this.cartesMagnetiques;
	}
	public String getCartesSansContact() {
		return this.cartesSansContact;
	}
	public String getErreurs(){
		return this.erreurs;
	}
	
	//setters
	
	@XmlElement
	public void setEtatActuel(String e) {
		this.etatActuel=e;
	}
	@XmlElement
	public void setTemperature(double t) {
		this.temperature=t;
	}
	@XmlElement
	public void setMonnayeur(String m) {
		this.monnayeur=m;
	}
	@XmlElement
	public void setCartesMagnetiques(String c) {
		this.cartesMagnetiques=c;
	}
	@XmlElement
	public void setCartesSansContact(String c) {
		this.cartesSansContact=c;
	}
	@XmlElement
	public void setErreurs(String e){
		this.erreurs=e;
	}
	
}
