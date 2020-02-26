package com.ezuazo.noticiasEndika.repository;

import java.util.List;

import com.ezuazo.noticiasEndika.model.Usuario;

public interface UsuarioRepository {
	
	public List<Usuario> getAll();
	public Usuario getById(String username);
	public void insert(Usuario usuario);
	public boolean update(Usuario usuario);
	public boolean delete(Usuario usuario);

}
