/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package pl.madamusinski.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.servlet.ModelAndView;

/**
 *
 * @author Mateusz
 */
@Controller
public class LoginController {
    
    public ModelAndView login(ModelAndView model) {
        
        model.addObject("title", "Strona logowania");
        model.addObject("message", "Witaj na stronie logowania");
        model.setViewName("login");
        
        return model;
    }
}
