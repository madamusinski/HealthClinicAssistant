/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package pl.madamusinski.dao;

import java.util.List;
import pl.madamusinski.model.Wizyta;

/**
 *
 * @author Mateusz
 */
public interface WizytaDAO {
    public List<Wizyta> getAllWizyta();
    public void addWizyta(Wizyta w);
}
