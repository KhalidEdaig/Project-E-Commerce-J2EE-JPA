package com.sid.entities;

import java.io.Serializable;
import java.util.List;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.ManyToOne;
import javax.persistence.OneToMany;
import javax.persistence.Table;
@Entity @Table(name = "boutique")
public class Boutique implements Serializable {

	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	@Id @GeneratedValue(strategy = GenerationType.IDENTITY)
	private int boutid;
	private String boutlib;
	private String boutadresse;
	private String boutphone;
	private String boutemail;
	private String boutdescription;
	@OneToMany(mappedBy = "boutique")
	private List<Livraison> listLivraison;
	public Boutique() {
		super();
		// TODO Auto-generated constructor stub
	}
	public Boutique(String boutlib, String boutadresse, String boutphone, String boutemail, String boutdescription) {
		super();
		this.boutlib = boutlib;
		this.boutadresse = boutadresse;
		this.boutphone = boutphone;
		this.boutemail = boutemail;
		this.boutdescription = boutdescription;
	}
	public int getBoutid() {
		return boutid;
	}
	public void setBoutid(int boutid) {
		this.boutid = boutid;
	}
	public String getBoutlib() {
		return boutlib;
	}
	public void setBoutlib(String boutlib) {
		this.boutlib = boutlib;
	}
	public String getBoutadresse() {
		return boutadresse;
	}
	public void setBoutadresse(String boutadresse) {
		this.boutadresse = boutadresse;
	}
	public String getBoutphone() {
		return boutphone;
	}
	public void setBoutphone(String boutphone) {
		this.boutphone = boutphone;
	}
	public String getBoutemail() {
		return boutemail;
	}
	public void setBoutemail(String boutemail) {
		this.boutemail = boutemail;
	}
	public String getBoutdescription() {
		return boutdescription;
	}
	public void setBoutdescription(String boutdescription) {
		this.boutdescription = boutdescription;
	}
	
	

}
