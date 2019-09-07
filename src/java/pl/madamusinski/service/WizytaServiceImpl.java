/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package pl.madamusinski.service;

import java.util.List;
import javax.transaction.Transactional;
import org.springframework.stereotype.Service;
import pl.madamusinski.dao.WizytaDAO;
import pl.madamusinski.model.Wizyta;

/**
 *
 * @author Mateusz
 */
@Service
public class WizytaServiceImpl implements WizytaService{
    private WizytaDAO wizytaDao;
    
    public void setWizytaDAO(WizytaDAO wizytaDao) {
        this.wizytaDao = wizytaDao;
    }
    
   public WizytaDAO getWizytaDAO() {
       return wizytaDao;
   }
    
    @Override
    @Transactional
    public List<Wizyta> getAllWizyta() {
        return wizytaDao.getAllWizyta();
    }
    
}
