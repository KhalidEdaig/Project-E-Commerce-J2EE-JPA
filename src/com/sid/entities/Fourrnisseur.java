package com.sid.entities;

import java.io.Serializable;
import java.util.ArrayList;
import java.util.List;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.ManyToOne;
import javax.persistence.OneToMany;
import javax.persistence.Table;
@Entity @Table(name = "fourrnisseur")
public class Fourrnisseur implements Serializable {

	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	//Les attributs de  Fourrnisseur:
	@Id @GeneratedValue(strategy = GenerationType.IDENTITY)
	@Column(nullable = false)
	private int fourid;
	private String fourname;
	private String fouremail;
	private String fourphone;
	private String fouraddresse;
	private String fourdescription;
	//Liste des article
	@OneToMany(mappedBy = "fourrnisseur")
	private List<Article> listArticle;
	public List<Article> getListArticle() {
		return listArticle;
	}
	public void setListArticle(List<Article> listArticle) {
		this.listArticle = listArticle;
	}
	public Fourrnisseur() {
		super();
		// TODO Auto-generated constructor stub
	}
	
	public Fourrnisseur(int fourid, String fourname, String fouremail, String fourphone, String fouraddresse,
			String fourdescription) {
		super();
		this.fourid = fourid;
		this.fourname = fourname;
		this.fouremail = fouremail;
		this.fourphone = fourphone;
		this.fouraddresse = fouraddresse;
		this.fourdescription = fourdescription;
	}
	public Fourrnisseur(String fourname, String fouremail, String fourphone, String fouraddresse,String fourdescription) {
		super();
		this.fourname = fourname;
		this.fouremail = fouremail;
		this.fourphone = fourphone;
		this.fouraddresse = fouraddresse;
		this.fourdescription = fourdescription;
	}
	public int getFourid() {
		return fourid;
	}
	public void setFourid(int fourid) {
		this.fourid = fourid;
	}
	public String getFourname() {
		return fourname;
	}
	public void setFourname(String fourname) {
		this.fourname = fourname;
	}
	public String getFouremail() {
		return fouremail;
	}
	public void setFouremail(String fouremail) {
		this.fouremail = fouremail;
	}
	public String getFourphone() {
		return fourphone;
	}
	public void setFourphone(String fourphone) {
		this.fourphone = fourphone;
	}
	public String getFouraddresse() {
		return fouraddresse;
	}
	public void setFouraddresse(String fouraddresse) {
		this.fouraddresse = fouraddresse;
	}
	public String getFourdescription() {
		return fourdescription;
	}
	public void setFourdescription(String fourdescription) {
		this.fourdescription = fourdescription;
	}
	
	

}
