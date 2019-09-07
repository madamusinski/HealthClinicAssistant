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
public class AdminController {
     @RequestMapping(value="/admin", method=RequestMethod.GET)
    public ModelAndView admin(ModelAndView model) {
        
        model.addObject("title", "Strona admina");
        model.addObject("message", "Strona admina");
        model.setViewName("admin");
        return model;
    }
    
    @RequestMapping(value="/admin/manage_users", method=RequestMethod.GET)
    public ModelAndView userPanel(ModelAndView model) {
        
        model.addObject("title", "Panel Administratora - zarządzaj użytkownikami");
        model.addObject("message", "Ekran zarządzania użytkownikami");
        model.setViewName("manage_users");
        return model;
    }
}
