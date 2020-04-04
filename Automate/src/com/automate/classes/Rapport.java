package com.automate.classes;

import java.util.List;
import java.util.Date;

import javax.persistence.*;
import javax.xml.bind.annotation.*;

import com.fasterxml.jackson.annotation.JsonBackReference;
import com.fasterxml.jackson.annotation.JsonIgnoreProperties;
import com.fasterxml.jackson.annotation.JsonManagedReference;

@XmlRootElement
@JsonIgnoreProperties(value = { "idRapport" })
@Entity
@Table(name="Rapport")
public class Rapport {
	
	@Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
	@Column(name="idRapport")
	private int idRapport;
	
	@JsonBackReference
	@ManyToOne(fetch = FetchType.EAGER)
	@JoinColumn(name="numeroSerie")
	private Machine machine;
	
	@Column(name="dateRapport")
	private Date dateRapport;
	
	@Column(name="enService")
	private boolean enService;
	
	@Embedded
	@AttributeOverrides({
		  @AttributeOverride( name = "etatActuel", column = @Column(name = "etatActuel")),
		  @AttributeOverride( name = "temperature", column = @Column(name = "temperature")),
		  @AttributeOverride( name = "monnayeur", column = @Column(name = "monnayeur")),
		  @AttributeOverride( name = "cartesMagnetiques", column = @Column(name = "cartesMagnetiques")),
		  @AttributeOverride( name = "cartesSansContact", column = @Column(name = "cartesSansContact")),
		  @AttributeOverride( name = "erreurs", column = @Column(name = "erreurs"))
		})
	private Detail details;
	
	@JsonManagedReference
	@OneToMany(cascade = {CascadeType.ALL}, orphanRemoval = true, mappedBy="rapport", fetch = FetchType.EAGER)
	private List<Article> articles;
	
	@Column(name="chiffreAffaires")
	private double chiffreAffaires;
	
	
	//constructeurs
	
	public Rapport() {
		
	}

	public Rapport(Date dt, boolean b, Detail d, List<Article> a, double ca) {
		this.setDateRapport(dt);
		this.setEnService(b);
		this.setDetails(d);
		this.setArticles(a);
		this.setChiffreAffaires(ca);;
	}
	
	//getters
	
	public int getIdRapport() {
		return this.idRapport;
	}
	
	public Machine getMachine() {
		return this.machine;
	}
	
	public Date getDateRapport() {
		return this.dateRapport;
	}
	
	public boolean getEnService() {
		return this.enService;
	}
	
	public Detail getDetails() {
		return this.details;
	}
	
	public List<Article> getArticles(){
		return this.articles;
	}
	
	public double getChiffreAffaires() {
		return this.chiffreAffaires;
	}
	
	//setters
	@XmlElement
	public void setMachine(Machine m) {
		this.machine=m;
	}
	@XmlElement
	public void setDateRapport(Date dt) {
		this.dateRapport=dt;
	}
	@XmlElement
	public void setEnService(boolean b) {
		this.enService=b;
	}
	@XmlElement
	public void setDetails(Detail d) {
		this.details=d;
	}
	@XmlElement
	public void setArticles(List<Article> a){
		this.articles=a;
	}
	@XmlElement
	public void setChiffreAffaires(double ca) {
		this.chiffreAffaires=ca;
	}
}
