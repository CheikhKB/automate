package com.automate.classes;

import java.util.Date;

import javax.persistence.*;
import javax.xml.bind.annotation.*;

import com.fasterxml.jackson.annotation.JsonBackReference;
import com.fasterxml.jackson.annotation.JsonIgnoreProperties;

@XmlRootElement
@JsonIgnoreProperties(value = { "idNote" })
@Entity
@Table(name="Note")
public class Note {
	
	@Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
	@Column(name="idNote")
	private int idNote;
	
	@JsonBackReference
	@ManyToOne(fetch = FetchType.EAGER)
	@JoinColumn(name="numeroSerie")
	private Machine machine;
	
	@Column(name="dateIntervention")
	private Date dateIntervention;
	
	@Column(name="contenu")
	private String contenu;
	
	@Column(name="auteur")
	private String auteur;
	
	//constructeurs
	public Note() {
		
	}

	public Note(Date dt, String c, String a) {
		this.setDateIntervention(dt);
		this.setContenu(c);
		this.setAuteur(a);
	}
	
	//getters
	
	public int getIdNote() {
		return this.idNote;
	}
	
	public Machine getMachine() {
		return this.machine;
	}
	
	public Date getDateIntervention() {
		return this.dateIntervention;
	}
	
	public String getContenu() {
		return this.contenu;
	}
	public String getAuteur() {
		return this.auteur;
	}
	
	
	//setters
	
	@XmlElement
	public void setIdNote(int id) {
		this.idNote=id;
	}
	
	@XmlElement
	public void setMachine(Machine m) {
		this.machine=m;
	}
	
	@XmlElement
	public  void setDateIntervention(Date dt) {
		this.dateIntervention=dt;
	}
	
	@XmlElement
	public  void setContenu(String c) {
		this.contenu=c;
	}
	
	@XmlElement
	public  void setAuteur(String a) {
		this.auteur=a;
	}
}
