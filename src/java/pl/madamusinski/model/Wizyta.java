/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package pl.madamusinski.model;

import java.io.Serializable;
import java.util.Date;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Table;
import javax.persistence.Temporal;
import javax.persistence.TemporalType;

/**
 *
 * @author Mateusz
 */
@Entity
@Table(name="wizyta", schema="public")
public class Wizyta implements Serializable {
    
    @Id @Column(name="id")
    @GeneratedValue(strategy=GenerationType.IDENTITY)
    private int id;
    @Temporal(TemporalType.DATE)
    @Column(name="data_wizyta", nullable=false)
    private Date dataWizyta;
    
    @Temporal(TemporalType.TIME)
    @Column(name="czas_wizyta", nullable=false)
    private Date czasWizyta; 
    
    /**@Transient
    @Column(name="password", nullable=false)
    private String password;*/
    @Column(name="pacjent", nullable=false)
    private String pacjent;
    
    public Wizyta() {}
    
    public Wizyta(int id,  Date dataWizyta, Date czasWizyta, String pacjent) {
        this.id = id;
        this.dataWizyta = dataWizyta;
        this.czasWizyta = czasWizyta;
        this.pacjent = pacjent;
    }
  
    
    public int getId() {
        return id;
    }
    
    public void setId(int id) {
        this.id = id;
    }
    
    
    public Date getDataWizyta() {
        return dataWizyta;
    }
    
    public void setDataWizyta(Date dataWizyta) {
        this.dataWizyta = dataWizyta;
    }
    
    public Date getCzasWizyta() {
        return czasWizyta;
    }
    
    public void setCzasWizyta(Date czasWizyta) {
        this.czasWizyta = czasWizyta;
    }
   
    public String getPacjent() {
        return pacjent;
    }
    
    public void setPacjent(String pacjent) {
        this.pacjent = pacjent;
    }
    
    
    public String toString(){
        return "[id=" + id
               + ", data=" + dataWizyta
                + ", czas=" + czasWizyta
               //+ ", haslo=" + password
               + ", pacjent=" + pacjent
               + "]";
    }
}

