package com.ezuazo.noticiasEndika.repository;

import java.util.List;

import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

import com.ezuazo.noticiasEndika.model.Noticia;

@Repository
public class NoticiaRepositoryImpl implements NoticiaRepository{
	
	@Autowired
	SessionFactory sessionFactory;

	@SuppressWarnings("unchecked")
	@Transactional(readOnly=true)
	public List<Noticia> getAll() {
		return sessionFactory.getCurrentSession().createQuery("from Noticia").getResultList();
	}
	
	@Transactional(readOnly=false)
	public void insert(Noticia noticia) {
		sessionFactory.getCurrentSession().saveOrUpdate(noticia);		
	}
	
	@Transactional(readOnly=true)
	public Noticia getById(String cod_noticia) {
		@SuppressWarnings("unchecked")
		List<Noticia> resultado = sessionFactory.getCurrentSession().createQuery("from Noticia where cod_noticia='" + cod_noticia + "'").getResultList();
		
		Noticia noticia = resultado.get(0);
		
		return noticia;
		
	}
	
	@Transactional(readOnly=false)
	public boolean update(Noticia noticia) {
		sessionFactory.getCurrentSession().saveOrUpdate(noticia);
		return true;	
	}
	
	@Transactional(readOnly=false)
	public boolean delete(Noticia noticia) {
		sessionFactory.getCurrentSession().delete(noticia);
		return true;
		
	}

}
