package com.ezuazo.noticiasEndika.controller;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.ezuazo.noticiasEndika.model.Login;
import com.ezuazo.noticiasEndika.model.Usuario;
import com.ezuazo.noticiasEndika.service.UsuarioService;

@Controller
@RequestMapping("/login")
public class LoginController {
	
	@Autowired
	UsuarioService usuarioService;
	
	@GetMapping
	public ModelAndView show() {
		return new ModelAndView("login", "usuario", new Usuario());
	}
	
	@PostMapping("/dologin")
	public String userLogin(HttpSession session, @ModelAttribute("usuario") Usuario usuario) {
		
		Usuario usuarioExiste = usuarioService.getById(usuario.getUsername());
		
		if (usuario.getUsername().equals(usuarioExiste.getUsername()) && usuario.getPassword().equals(usuarioExiste.getPassword())) {
			
			Login usuarioLogin = new Login();
			
			usuarioLogin.setUsername(usuarioExiste.getUsername());
			usuarioLogin.setRol(usuarioExiste.getRol());
		
	        session.setAttribute("usuarioLogin", usuarioLogin);
	        session.setAttribute("mensaje", "Bienvenido " + usuarioExiste.getNombre());
	        return "redirect:/";
	    } else {
	    	session.setAttribute("mensaje", "Error al iniciar sesion. Vuelva a intentarlo.");
	        return "redirect:/login";
	    }
	}

	@GetMapping("/logout")
	public String logout(HttpSession session ) {
	    session.invalidate();
	    return "redirect:/login";
	} 

}
