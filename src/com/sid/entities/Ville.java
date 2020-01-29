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

@Entity 
@Table(name = "ville")
public class Ville implements Serializable {

	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	@Id @GeneratedValue(strategy = GenerationType.IDENTITY)
	@Column(nullable = false)
	private int vileid;
	private String vilelib;
	@OneToMany(mappedBy = "ville")
	private List<Client > listClient;
	public Ville() {
		super();
		// TODO Auto-generated constructor stub
	}
	
	public List<Client> getListClient() {
		return listClient;
	}

	public void setListClient(List<Client> listClient) {
		this.listClient = listClient;
	}

	public Ville(String vilelib) {
		super();
		this.vilelib = vilelib;
	}
	public Ville(int vileid, String vilelib) {
		super();
		this.vileid = vileid;
		this.vilelib = vilelib;
	}
	public int getVileid() {
		return vileid;
	}
	public void setVileid(int vileid) {
		this.vileid = vileid;
	}
	public String getVilelib() {
		return vilelib;
	}
	public void setVilelib(String vilelib) {
		this.vilelib = vilelib;
	}
	@Override
	public String toString() {
		return "Ville [vileid=" + vileid + ", vilelib=" + vilelib + "]";
	}
	
	
}
