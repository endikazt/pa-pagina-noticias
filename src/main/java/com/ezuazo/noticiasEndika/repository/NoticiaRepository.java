package com.ezuazo.noticiasEndika.repository;

import java.util.List;

import com.ezuazo.noticiasEndika.model.Noticia;
public interface NoticiaRepository {
	
	public List<Noticia> getAll();
	public Noticia getById(String cod_noticia);
	public void insert(Noticia noticia);
	public boolean update(Noticia noticia);
	public boolean delete(Noticia noticia);

}
