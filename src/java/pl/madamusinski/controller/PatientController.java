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
public class PatientController {
    @RequestMapping(value="/patient", method=RequestMethod.GET)
    public ModelAndView patient(ModelAndView model) {
        
        model.addObject("title", "Strona pacjenta");
        model.addObject("message", "Strona pacjenta");
        model.setViewName("pacjent");
        return model;
    }
}
