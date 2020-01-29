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
@Entity
@Table(name = "categorie")
public class Categorie implements Serializable{

	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	//Les attributs de Categorie :
	@Id @GeneratedValue(strategy = GenerationType.IDENTITY)
	@Column(nullable = false)
	private int catid;
	private String catlib;
	 @OneToMany(mappedBy = "categorie")
	 private List<Article> listArticle;
	 
	public List<Article> getListArticle() {
		return listArticle;
	}
	public void setListArticle(List<Article> listArticle) {
		this.listArticle = listArticle;
	}
	public Categorie() {
		super();
		// TODO Auto-generated constructor stub
	}
	public Categorie(String catlib) {
		super();
		this.catlib = catlib;
	}
	public Categorie(int catid, String catlib) {
		super();
		this.catid = catid;
		this.catlib = catlib;
	}
	public int getCatid() {
		return catid;
	}
	public void setCatid(int catid) {
		this.catid = catid;
	}
	public String getCatlib() {
		return catlib;
	}
	public void setCatlib(String catlib) {
		this.catlib = catlib;
	}
	

}
