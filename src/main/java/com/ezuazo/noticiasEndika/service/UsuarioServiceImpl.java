package com.ezuazo.noticiasEndika.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.ezuazo.noticiasEndika.model.Usuario;
import com.ezuazo.noticiasEndika.repository.UsuarioRepository;

@Service
public class UsuarioServiceImpl implements UsuarioService{
	
	@Autowired
	UsuarioRepository usuarioRepository;

	public List<Usuario> getAll() {
		return usuarioRepository.getAll();
	}

	public void insert(Usuario usuario) {
		usuarioRepository.insert(usuario);
	}

	public Usuario getById(String username) {
		return usuarioRepository.getById(username);
	}

	public boolean update(Usuario usuario) {
		return usuarioRepository.update(usuario);
	}

	public boolean delete(Usuario usuario) {
		return usuarioRepository.delete(usuario);
	}

}
