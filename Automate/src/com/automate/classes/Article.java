package com.automate.classes;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.Table;
import javax.xml.bind.annotation.*;

import com.fasterxml.jackson.annotation.JsonBackReference;
import com.fasterxml.jackson.annotation.JsonIgnoreProperties;


@Entity
@Table(name="Article")
@XmlRootElement
@JsonIgnoreProperties(value = { "idRapport" })
public class Article {

	@Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
	@Column(name="num")
	private int num;
	
	@JsonBackReference
	@ManyToOne(fetch = FetchType.EAGER)
	@JoinColumn(name="idRapport")
	private Rapport rapport;
	
	@Column(name="nom")
	private String nom;
	
	@Column(name="prix")
	private double prix;
	
	@Column(name="qstock")
	private int qstock;
	
	
	//constructeurs
	public Article() {
		
	}
	
	public Article(String n, double p, int q) {
		this.setNom(n);
		this.setPrix(p);
		this.setQstock(q);
	}
	
	//getters
	public Rapport getRapport() {
		return this.rapport;
	}
	public String getNom() {
		return this.nom;
	}
	public double getPrix() {
		return this.prix;
	}
	public int getQstock() {
		return this.qstock;
	}
	
	//setters
	@XmlElement
	public void setNom(String n) {
		this.nom=n;
	}
	@XmlElement
	public void setPrix(double p) {
		this.prix=p;
	}
	@XmlElement
	public void setQstock(int q) {
		this.qstock=q;
	}
	public void setRapport(Rapport r) {
		this.rapport=r;
	}
}
