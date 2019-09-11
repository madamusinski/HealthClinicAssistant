/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package pl.madamusinski.controller;

import java.util.List;
import javax.mail.internet.MimeMessage;
import javax.servlet.http.HttpServletRequest;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.mail.javamail.MimeMessageHelper;
import org.springframework.mail.javamail.MimeMessagePreparator;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;
import pl.madamusinski.model.Wizyta;
import pl.madamusinski.service.WizytaService;


/**
 *
 * @author Mateusz
 */
@Controller
public class UserController {
    
    private final Logger logger = LoggerFactory.getLogger(UserController.class);
    @Autowired(required=true)
    @Qualifier(value="wizytaService")
    private WizytaService wizytaService;
    
    public void setWizytaService(WizytaService wizytaService) {
        this.wizytaService = wizytaService;
    }
    
    public WizytaService getWizytaService() {
        return wizytaService;
    }
    static final String mailFromRecipient = "healthclinicassistant.noreply@gmail.com";
    @Autowired
    private JavaMailSender mailSender;
    
    @RequestMapping(value="/user", method=RequestMethod.GET)
    public ModelAndView user(ModelAndView model) {
        
        model.addObject("title", "Strona użytkownika");
        model.addObject("message", "Strona użytkownika");
        model.setViewName("user");
        return model;
    }
    
    @RequestMapping(value="/user/wizyty", method=RequestMethod.GET)
    public ModelAndView wizyty(ModelAndView model) {
        model.addObject("title", "Strona użytkownika-wizyty");
        model.addObject("message", "Strona użytkownika-wizyty");
        model.setViewName("wizyty");
        return model;
    }
    
    @RequestMapping(value="/user/wizyty/get_wizyty_json", method=RequestMethod.GET
            , produces="application/json; charset=UTF-8")
    @ResponseBody
    public List<Wizyta> getWizyty() {
        logger.debug("Retrieving result set for all wizyty");
        System.out.println("Retrieving result set for all wizyty");
        List<Wizyta> listWizyty = wizytaService.getAllWizyta();
        for(Wizyta w : listWizyty) {
            System.out.println(w.toString());
        }
        return listWizyty;
    }
    
    @RequestMapping(value="/user/wizyty/add_wizyta", method=RequestMethod.POST
            , consumes="application/json; charset=UTF-8")
    public void addWizyta(@RequestBody Wizyta w) {
        
    }
    
    @RequestMapping(value="/user/email_to_patient", method=RequestMethod.GET)
    public ModelAndView emailForm(ModelAndView m) {
        m.addObject("title", "Wiadomość mail");
        m.addObject("message", "Wysyłanie wiadomości e-mail");
        m.addObject("message2", "Wprowadź adres odbiorcy, temat oraz wiadomość");
        m.setViewName("email_to_patient");
        return m;
    }
    
    @RequestMapping(value="/user/send_email", method=RequestMethod.POST)
    public ModelAndView sendEmailToPatient(HttpServletRequest request, ModelAndView m) {
        String mailToRecipient = request.getParameter("mailTo");
        String mailSubject = request.getParameter("mailSubject");
        String mailMessage = request.getParameter("mailMessage");
        
        
        System.out.println("\nReceipient?= " + mailToRecipient + ", Subject?= " + mailSubject + ", Message?= " + mailMessage + "\n");
        
        mailSender.send(new MimeMessagePreparator(){
            public void prepare(MimeMessage mimeMessage) throws Exception {
                MimeMessageHelper mimeMsgHelper = new MimeMessageHelper(mimeMessage, true, "UTF-8");
                mimeMsgHelper.setTo(mailToRecipient);
                mimeMsgHelper.setFrom(mailFromRecipient);
                mimeMsgHelper.setText(mailMessage);
                mimeMsgHelper.setSubject(mailSubject);
            }
            
        });
        System.out.println("\nMessage Send Successfully.... Hurrey!\n");
        m.setViewName("email_sent");
        return m;
    }
}
