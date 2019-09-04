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
    
    @RequestMapping(value="/login_error", method=RequestMethod.GET)
    public ModelAndView loginError(ModelAndView model) {
        
        model.addObject("title", "Blad logowania");
        model.addObject("message", "Blad logowania!");
        model.setViewName("login_error");
        
        return model;
    }
    
       @RequestMapping(value="/access_denied", method=RequestMethod.GET)
    public ModelAndView accessDenied(ModelAndView model) {
        
        model.addObject("title", "Dostęp zabroniony!");
        model.addObject("message", "Access Denied! No permission to access this site!");
        model.setViewName("access_denied");
        
        return model;
    }
}
