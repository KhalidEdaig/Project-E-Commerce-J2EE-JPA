package com.sid.entities;

import java.io.Serializable;
import java.util.List;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToMany;
import javax.persistence.ManyToOne;
import javax.persistence.OneToMany;
import javax.persistence.Table;
@Entity
@Table(name = "article")
public class Article implements Serializable {

	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	//Les attributs de Article
	@Id @GeneratedValue(strategy = GenerationType.IDENTITY)
	@Column(nullable = false)
	private int artid;
	private String artdesignation;
	private String artdescription;
	private double prix;
	private int qtestock;
	@ManyToOne
	private Marque marque;
	@ManyToOne
	private Categorie categorie;
	@ManyToOne
	private Fourrnisseur fourrnisseur;
	@ManyToMany(mappedBy="artlists")
	private List<Commande> cmdlist;
	public Article() {
		super();
		// TODO Auto-generated constructor stub
	}
	public Article(String artdesignation, double prix, int qtestock, String artdescription, Marque marque,
			Categorie categorie, Fourrnisseur fourrnisseur) {
		super();
		this.artdesignation = artdesignation;
		this.prix = prix;
		this.qtestock = qtestock;
		this.artdescription = artdescription;
		this.marque = marque;
		this.categorie = categorie;
		this.fourrnisseur = fourrnisseur;
	}
	public int getArtid() {
		return artid;
	}
	public void setArtid(int artid) {
		this.artid = artid;
	}
	public String getArtdesignation() {
		return artdesignation;
	}
	public void setArtdesignation(String artdesignation) {
		this.artdesignation = artdesignation;
	}
	public double getPrix() {
		return prix;
	}
	public void setPrix(double prix) {
		this.prix = prix;
	}
	public int getQtestock() {
		return qtestock;
	}
	public void setQtestock(int qtestock) {
		this.qtestock = qtestock;
	}
	public String getArtdescription() {
		return artdescription;
	}
	public void setArtdescription(String artdescription) {
		this.artdescription = artdescription;
	}
	public Marque getMarque() {
		return marque;
	}
	public void setMarque(Marque marque) {
		this.marque = marque;
	}
	public Categorie getCategorie() {
		return categorie;
	}
	public void setCategorie(Categorie categorie) {
		this.categorie = categorie;
	}
	public Fourrnisseur getFourrnisseur() {
		return fourrnisseur;
	}
	public void setFourrnisseur(Fourrnisseur fourrnisseur) {
		this.fourrnisseur = fourrnisseur;
	}
	

}
