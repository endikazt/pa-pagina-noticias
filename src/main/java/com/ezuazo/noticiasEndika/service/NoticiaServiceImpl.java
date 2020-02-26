package com.ezuazo.noticiasEndika.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.ezuazo.noticiasEndika.model.Noticia;
import com.ezuazo.noticiasEndika.repository.NoticiaRepository;

@Service
public class NoticiaServiceImpl implements NoticiaService{
	
	@Autowired
	NoticiaRepository noticiaRepository;

	public List<Noticia> getAll() {
		return noticiaRepository.getAll();
	}

	public void insert(Noticia noticia) {
		noticiaRepository.insert(noticia);		
	}

	public Noticia getById(String cod_noticia) {
		return noticiaRepository.getById(cod_noticia);
	}

	public boolean update(Noticia noticia) {
		return noticiaRepository.update(noticia);
	}

	public boolean delete(Noticia noticia) {
		return noticiaRepository.delete(noticia);
	}

}
