/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package pl.madamusinski.controller;

import java.security.Principal;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

/**
 *
 * @author maadamusinski
 */
@Controller
public class HomeController {
    
    
    @RequestMapping(value ={"/"}, method=RequestMethod.GET)
    public String home(){
        return "redirect:/login";
    } 
    
    @RequestMapping(value ={"/index"}, method=RequestMethod.GET)
    public String index(Model model, Principal p){
        model.addAttribute("user", p.getName());
        model.addAttribute("message", "Hello World!");
        return "index";
    } 
}
