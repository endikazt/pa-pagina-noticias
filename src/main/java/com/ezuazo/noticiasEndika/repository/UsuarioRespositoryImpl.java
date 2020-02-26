package com.ezuazo.noticiasEndika.repository;

import java.util.List;

import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

import com.ezuazo.noticiasEndika.model.Usuario;

@Repository
public class UsuarioRespositoryImpl implements UsuarioRepository{
	
	@Autowired
	SessionFactory sessionFactory;
	
	@SuppressWarnings("unchecked")
	@Transactional(readOnly=true)
	public List<Usuario> getAll() {
		return sessionFactory.getCurrentSession().createQuery("from Usuario").getResultList();
	}

	@Transactional(readOnly=false)
	public void insert(Usuario usuario) {
		sessionFactory.getCurrentSession().saveOrUpdate(usuario);
	}
	
	@Transactional(readOnly=true)
	public Usuario getById(String username) {
		
		@SuppressWarnings("unchecked")
		List<Usuario> resultado = sessionFactory.getCurrentSession().createQuery("from Usuario where username='" + username + "'").getResultList();
		
		Usuario usuario = resultado.get(0);
		
		return usuario;
	}
	
	@Transactional(readOnly=false)
	public boolean update(Usuario usuario) {
		sessionFactory.getCurrentSession().saveOrUpdate(usuario);
		return true;
	}
	
	@Transactional(readOnly=false)
	public boolean delete(Usuario usuario) {
		sessionFactory.getCurrentSession().delete(usuario);
		return true;
	}

}
