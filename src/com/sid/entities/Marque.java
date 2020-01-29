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
@Table(name = "marque")
public class Marque implements Serializable{

	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	//Les attributs de Marque :
	@Id @GeneratedValue(strategy = GenerationType.IDENTITY)
	@Column(nullable = false)
	private int marqid;
	private String marqlib;
	@OneToMany(mappedBy = "marque")
	private List<Article> listArticle; 
	public List<Article> getListArticle() {
		return listArticle;
	}
	public void setListArticle(List<Article> listArticle) {
		this.listArticle = listArticle;
	}
	public Marque() {
		super();
		// TODO Auto-generated constructor stub
	}
	public Marque(int marqid, String marqlib) {
		super();
		this.marqid = marqid;
		this.marqlib = marqlib;
	}
	public Marque(String marqlib) {
		super();
		this.marqlib = marqlib;
	}
	public int getMarqid() {
		return marqid;
	}
	public void setMarqid(int marqid) {
		this.marqid = marqid;
	}
	public String getMarqlib() {
		return marqlib;
	}
	public void setMarqlib(String marqlib) {
		this.marqlib = marqlib;
	}
}
