/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package pl.madamusinski.controller;

import com.google.gson.Gson;
import com.google.gson.GsonBuilder;
import java.util.List;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.ResponseStatus;
import org.springframework.web.servlet.ModelAndView;
import pl.madamusinski.model.Users;
import pl.madamusinski.service.UsersService;
import pl.madamusinski.service.UsersServiceImpl;

/**
 *
 * @author Mateusz
 */

@Controller
public class AdminController {
    
    private final Logger logger = LoggerFactory.getLogger(AdminController.class);
    @Autowired(required=true)
    @Qualifier(value="usersService")
    private UsersService usersService;
    
    public void setUsersService(UsersService usersService) {
        this.usersService = usersService;
    }
    
    public UsersService getUsersService() {
        return usersService;
    }
    
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
    
    @RequestMapping(value="/admin/manage_users/get_all_users_json", method=RequestMethod.GET
            , produces="application/json; charset=UTF-8")
    @ResponseBody
    public List<Users> getAllUsers() {
        logger.debug("Kontroler poprawnie zakonczył pobieranie użytkowników");
        List<Users> list = usersService.getAllUsers();
        for(Users u : list){
            System.out.println(u.toString());
        }
        return usersService.getAllUsers();
        
    }
    
    @RequestMapping(value="/admin/manage_users/get_all_users_new_json", method=RequestMethod.GET
            , produces="application/json; charset=UTF-8")
    @ResponseBody
    public List<Users> getAllUsersNew() {
        logger.debug("Kontroler poprawnie zakonczył pobieranie użytkowników NEW");
        List<Users> list = usersService.getAllUsersNew();
        for(Users u : list){
            System.out.println(u.toString());
        }
        return usersService.getAllUsersNew();
        
    }
    @ResponseBody
    @ResponseStatus(HttpStatus.OK)
    @RequestMapping(value="/admin/manage_users/add_user", method=RequestMethod.POST
            , consumes="application/json; charset=UTF-8")
    public void addUser(@RequestBody String form, ModelAndView m) {
       // logger.debug("Wchodze na strone dodawania uzytkownika");
        Gson gson = new GsonBuilder().create();
        Users u = gson.fromJson(form, Users.class);
        this.usersService.addUser(u);
        //m.addObject("title", "Dodawania użytkownika");
       
    }
}
