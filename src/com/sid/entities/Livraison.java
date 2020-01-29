package com.sid.entities;

import java.io.Serializable;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.ManyToOne;
import javax.persistence.OneToOne;
import javax.persistence.Table;

@Entity @Table(name = "livraison")
public class Livraison implements Serializable{

	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	@Id @GeneratedValue(strategy = GenerationType.IDENTITY)
	@Column(nullable = false)
	private int livid;
	private String livdescription;
	private Date livdate;
	@OneToOne
	private Commande commande;
	@ManyToOne
	private Boutique boutique;
	public Livraison() {
		super();
		// TODO Auto-generated constructor stub
	}
	
	public Livraison(String livdescription, Date livdate, Commande commande) {
		super();
		this.livdescription = livdescription;
		this.livdate = livdate;
		this.commande = commande;
	}
	public Boutique getBoutique() {
		return boutique;
	}
	public void setBoutique(Boutique boutique) {
		this.boutique = boutique;
	}
	public int getLivid() {
		return livid;
	}
	public void setLivid(int livid) {
		this.livid = livid;
	}
	public String getLivdescription() {
		return livdescription;
	}
	public void setLivdescription(String livdescription) {
		this.livdescription = livdescription;
	}
	public Date getLivdate() {
		return livdate;
	}
	public void setLivdate(Date livdate) {
		this.livdate = livdate;
	}
	public Commande getCommande() {
		return commande;
	}
	public void setCommande(Commande commande) {
		this.commande = commande;
	}
	

}
