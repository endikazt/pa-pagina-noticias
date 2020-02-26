package com.ezuazo.noticiasEndika.model;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Table;

@Entity
@Table(name="noticias")
public class Noticia {
	
	
	@Id
	@GeneratedValue(strategy=GenerationType.IDENTITY)
	@Column
	private int cod_noticia; 
	
	@Column
	private String titulo;
	
	@Column
	private String contenido;

	public String getTitulo() {
		return titulo;
	}

	public void setTitulo(String titulo) {
		this.titulo = titulo;
	}

	public String getContenido() {
		return contenido;
	}

	public void setContenido(String contenido) {
		this.contenido = contenido;
	}
	

	public void setCod_noticia(int cod_noticia) {
		this.cod_noticia = cod_noticia;
	}

	public int getCod_noticia() {
		return cod_noticia;
	}

}
