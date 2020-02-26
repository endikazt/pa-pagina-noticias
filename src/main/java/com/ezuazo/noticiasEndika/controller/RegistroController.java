package com.ezuazo.noticiasEndika.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.ezuazo.noticiasEndika.model.Usuario;

@Controller
@RequestMapping("/registro")
public class RegistroController {
	
	@GetMapping
	public ModelAndView show() {
		return new ModelAndView("registro", "usuario", new Usuario());
	}

}
