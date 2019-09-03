/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package pl.madamusinski.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

/**
 *
 * @author Mateusz
 */
@Controller
public class LoginController {
    
    @RequestMapping(value="/login", method=RequestMethod.GET)
    public ModelAndView login(ModelAndView model) {
        
        model.addObject("title", "Strona logowania");
        model.addObject("message", "Witaj na stronie logowania");
        model.setViewName("login");
        
        return model;
    }
    
    @RequestMapping(value="/error", method=RequestMethod.GET)
    public ModelAndView error(ModelAndView model) {
        
        model.addObject("title", "Blad logowania");
        model.addObject("message", "Access Denied! Wrong login information!");
        model.setViewName("error");
        
        return model;
    }
}
