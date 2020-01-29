package com.sid.entities;

import java.io.Serializable;
import java.util.List;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.ManyToOne;
import javax.persistence.OneToMany;
import javax.persistence.Table;

@Entity @Table(name = "client")
public class Client implements Serializable{

	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	//Les proprietes :
	@Id @GeneratedValue(strategy = GenerationType.IDENTITY) 
	@Column(nullable = false)
	private int cltid;
	private String cltpawd;
	private String cltlogin;
	private String cltsexe;
	private String cltnom;
	private String cltprenom;
	private String cltaddresse;
	private String cltcin;
	private String cltphone;
	private String cltemail;
	@ManyToOne
	private Ville ville;
	@OneToMany(mappedBy = "client")
	private List<Commande> listCmd;
	public Client() {
		super();
		// TODO Auto-generated constructor stub
	}

	public Client(String cltnom, String cltprenom, String cltphone, String cltaddresse, String cltcin, String cltemail,
			Ville cltvile) {
		super();
		this.cltnom = cltnom;
		this.cltprenom = cltprenom;
		this.cltphone = cltphone;
		this.cltaddresse = cltaddresse;
		this.cltcin = cltcin;
		this.cltemail = cltemail;
		this.ville = cltvile;
	}

	public int getCltid() {
		return cltid;
	}

	public void setCltid(int cltid) {
		this.cltid = cltid;
	}

	public String getCltnom() {
		return cltnom;
	}

	public void setCltnom(String cltnom) {
		this.cltnom = cltnom;
	}

	public String getCltprenom() {
		return cltprenom;
	}

	public void setCltprenom(String cltprenom) {
		this.cltprenom = cltprenom;
	}

	public String getCltphone() {
		return cltphone;
	}

	public void setCltphone(String cltphone) {
		this.cltphone = cltphone;
	}

	public String getCltaddresse() {
		return cltaddresse;
	}

	public void setCltaddresse(String cltaddresse) {
		this.cltaddresse = cltaddresse;
	}

	public String getCltcin() {
		return cltcin;
	}

	public void setCltcin(String cltcin) {
		this.cltcin = cltcin;
	}

	public String getCltemail() {
		return cltemail;
	}

	public void setCltemail(String cltemail) {
		this.cltemail = cltemail;
	}

	public Ville getCltvile() {
		return ville;
	}

	public void setCltvile(Ville cltvile) {
		this.ville = cltvile;
	}

	public Client(String cltpawd, String cltlogin, String cltsexe, String cltnom, String cltprenom, String cltaddresse,
			String cltcin, String cltphone, String cltemail, Ville ville) {
		super();
		this.cltpawd = cltpawd;
		this.cltlogin = cltlogin;
		this.cltsexe = cltsexe;
		this.cltnom = cltnom;
		this.cltprenom = cltprenom;
		this.cltaddresse = cltaddresse;
		this.cltcin = cltcin;
		this.cltphone = cltphone;
		this.cltemail = cltemail;
		this.ville= ville;
	}

	public String getCltpawd() {
		return cltpawd;
	}

	public void setCltpawd(String cltpawd) {
		this.cltpawd = cltpawd;
	}

	public String getCltlogin() {
		return cltlogin;
	}

	public void setCltlogin(String cltlogin) {
		this.cltlogin = cltlogin;
	}

	public String getCltsexe() {
		return cltsexe;
	}

	public void setCltsexe(String cltsexe) {
		this.cltsexe = cltsexe;
	}

	

}
