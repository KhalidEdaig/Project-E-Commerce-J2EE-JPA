package com.sid.entities;

import java.io.Serializable;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import javax.persistence.CascadeType;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.JoinTable;
import javax.persistence.ManyToMany;
import javax.persistence.ManyToOne;
import javax.persistence.OneToMany;
import javax.persistence.OneToOne;
import javax.persistence.Table;
@Entity
@Table(name = "commande")
public class Commande implements Serializable {

	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	//Les attributs de la commande
	@Id @GeneratedValue(strategy = GenerationType.IDENTITY)
	@Column(nullable = false)
	private int cmdid;
	private Date cmddate;
	private double totalcmd;
	private String cmddescription;

	@OneToOne(mappedBy = "commande")
	private Livraison livraison;
	@ManyToOne
	private Client client;
	//Liste des article
	@ManyToMany
	@JoinTable(name = "lignecmd", joinColumns = @JoinColumn(name ="cmdid"),
    inverseJoinColumns = @JoinColumn(name = "artid"))
	private List<Article> artlists=new ArrayList<Article>();
	public Commande() {
		super();
		// TODO Auto-generated constructor stub
	}
	public Commande(Date cmddate, double totalcmd, String cmddescription, Client client) {
		super();
		this.cmddate = cmddate;
		this.totalcmd = totalcmd;
		this.cmddescription = cmddescription;
		this.client = client;
	}
	public int getCmdid() {
		return cmdid;
	}
	public void setCmdid(int cmdid) {
		this.cmdid = cmdid;
	}
	public Date getCmddate() {
		return cmddate;
	}
	public void setCmddate(Date cmddate) {
		this.cmddate = cmddate;
	}
	public double getTotalcmd() {
		return totalcmd;
	}
	public void setTotalcmd(double totalcmd) {
		this.totalcmd = totalcmd;
	}
	public String getCmddescription() {
		return cmddescription;
	}
	public void setCmddescription(String cmddescription) {
		this.cmddescription = cmddescription;
	}
	public Client getClient() {
		return client;
	}
	public void setClient(Client client) {
		this.client = client;
	}
	public List<Article> getArtlist() {
		return artlists;
	}
	public void setArtlist(List<Article> artlist) {
		this.artlists = artlist;
	}
	public Livraison getLivraison() {
		return livraison;
	}
	public void setLivraison(Livraison livraison) {
		this.livraison = livraison;
	}
	public List<Article> getArtlists() {
		return artlists;
	}
	public void setArtlists(List<Article> artlists) {
		this.artlists = artlists;
	}

}
