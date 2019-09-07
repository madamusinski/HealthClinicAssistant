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
    @Temporal(TemporalType.TIMESTAMP)
    @Column(name="data_czas", nullable=false)
    private Date dataCzas;
    
    /**@Transient
    @Column(name="password", nullable=false)
    private String password;*/
    @Column(name="pacjent", nullable=false)
    private String pacjent;
    
    public Wizyta() {}
    
    public Wizyta(int id,  Date dataCzas, String pacjent) {
        this.id = id;
        this.dataCzas = dataCzas;
        this.pacjent = pacjent;
    }
  
    
    public int getId() {
        return id;
    }
    
    public void setId(int id) {
        this.id = id;
    }
    
    
    public Date getDataCzas() {
        return dataCzas;
    }
    
    public void setDataCzas(Date dataCzas) {
        this.dataCzas = dataCzas;
    }
   
    public String getPacjent() {
        return pacjent;
    }
    
    public void setPacjent(String pacjent) {
        this.pacjent = pacjent;
    }
    
    
    public String toString(){
        return "[id=" + id
               + ", dataCzas=" + dataCzas
               //+ ", haslo=" + password
               + ", pacjent=" + pacjent
               + "]";
    }
}

