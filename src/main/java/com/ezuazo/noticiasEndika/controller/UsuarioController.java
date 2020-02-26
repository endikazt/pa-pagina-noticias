package com.ezuazo.noticiasEndika.controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.ezuazo.noticiasEndika.model.Usuario;
import com.ezuazo.noticiasEndika.service.UsuarioService;

@Controller
@RequestMapping("/usuarios")
public class UsuarioController {
	
	@Autowired
	UsuarioService usuarioService;
	
	@GetMapping
	public ModelAndView getAll(){
		ModelAndView model = new ModelAndView();
		
		List<Usuario> usuarios = usuarioService.getAll();
		
		model.addObject("usuarios", usuarios);
		model.addObject("usuario", new Usuario());
		model.setViewName("listaUsuarios");
		
		return model;
	}
	
	@GetMapping("/registro")
	public ModelAndView goToForm(){
		ModelAndView model = new ModelAndView();
		model.addObject("usuario", new Usuario());
		model.setViewName("registro");
		return model;
	}
	
	@PostMapping("/registrar")
	public String registrar(@ModelAttribute("usuario") Usuario usuario, BindingResult result){
		usuarioService.insert(usuario);	
		return "redirect:/";
	}
	
	@PostMapping("/crear")
	public String insertList(@ModelAttribute("usuario") Usuario usuario, BindingResult result){
		usuarioService.insert(usuario);	
		return "redirect:/usuarios";
	}
	
	@GetMapping("/eliminar/{username}")
	public String delete(HttpServletRequest request, @PathVariable("username") String username){
		
		Usuario usuarioEliminar = usuarioService.getById(username);
		
		usuarioService.delete(usuarioEliminar);
		
		return "redirect:/usuarios";
		
	  }
	
	@GetMapping("/editar/{username}")
	public ModelAndView editView(HttpServletRequest request, @PathVariable("username") String username){
		
		Usuario usuarioElegido = usuarioService.getById(username);
		
		return new ModelAndView("usuario", "usuarioElegido", usuarioElegido);		
	  }
	
	@PostMapping("/editar/{username}/guardar")
	public String doEdit(HttpServletRequest request, @ModelAttribute("usuarioElegido") Usuario usuario, @PathVariable("username") String username, BindingResult result){
		
		usuario.setUsername(username);
		
		usuarioService.update(usuario);
		
		return "redirect:/usuarios";
		
	  }

}
