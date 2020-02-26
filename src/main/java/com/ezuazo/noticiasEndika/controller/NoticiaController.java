package com.ezuazo.noticiasEndika.controller;

import java.util.Collections;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import com.ezuazo.noticiasEndika.model.Noticia;
import com.ezuazo.noticiasEndika.service.NoticiaService;

@Controller
public class NoticiaController {
	
	@Autowired
	NoticiaService noticiaService;
	
	@RequestMapping(value="/noticias", method = RequestMethod.GET)
	public ModelAndView getAll(){
		
		ModelAndView model = new ModelAndView();
		
		List<Noticia> noticias = noticiaService.getAll();
		Collections.reverse(noticias);
		
		model.addObject("noticias", noticias);
		model.setViewName("noticias");
		
		return model;
	}
	
	@RequestMapping(value="/nuevaNoticia", method = RequestMethod.GET)
	public ModelAndView goToForm(){	
		ModelAndView model = new ModelAndView();
		model.addObject("noticia", new Noticia());
		model.setViewName("nuevaNoticia");
		return model;
	}
	
	@RequestMapping(value="/nuevaNoticia/crear",  method = RequestMethod.POST)
	public String insert(@ModelAttribute("noticia") Noticia noticia, BindingResult result){
		noticiaService.insert(noticia);
		
		return "redirect:/noticias";
	}
	
	@RequestMapping(value="noticias/eliminar/{cod_noticia}", method = RequestMethod.GET)
	public String delete(HttpServletRequest request, @PathVariable("cod_noticia") String cod_noticia){
		
		Noticia noticiaEliminar = noticiaService.getById(cod_noticia);
		
		noticiaService.delete(noticiaEliminar);
		
		return "redirect:/noticias";
		
	  }
	
	@RequestMapping(value="noticias/editar/{cod_noticia}", method = RequestMethod.GET)
	public ModelAndView editView(HttpServletRequest request, @PathVariable("cod_noticia") String cod_noticia){
		
		Noticia noticiaElegida = noticiaService.getById(cod_noticia);
		
		return new ModelAndView("noticia", "noticiaElegida", noticiaElegida);
		
	  }
	
	@RequestMapping(value="noticias/editar/{cod_noticia}/guardar", method = RequestMethod.POST)
	public String doEdit(HttpServletRequest request, @ModelAttribute("noticiaElegida") Noticia noticia, @PathVariable("cod_noticia") String cod_noticia, BindingResult result){
		
		noticia.setCod_noticia(Integer.parseInt(cod_noticia));
		
		noticiaService.update(noticia);
		
		return "redirect:/noticias";
		
	  }

}
