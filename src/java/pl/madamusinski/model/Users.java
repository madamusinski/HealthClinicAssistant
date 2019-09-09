/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package pl.madamusinski.model;

import java.io.Serializable;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Table;
import javax.persistence.Transient;

/**
 *
 * @author maadamusinski
 */
@Entity
@Table(name="users", schema="public")
public class Users implements Serializable {
    
    @Id @Column(name="id")
    @GeneratedValue(strategy=GenerationType.IDENTITY)
    private int id;
    @Column(name="login", nullable=false)
    private String login;
    //@Transient
    @Column(name="password", nullable=false)
    private String password;
    @Column(name="active", nullable=false)
    private boolean active;
    
    public Users() {}
    
    public Users(int id, boolean active) {
        this.id = id;
        this.active = active;
    }
    public Users(int id, String login, boolean active) {
        this.id = id;
        this.login = login;
        this.password = password;
        this.active = active;
    }
    
    public int getId() {
        return id;
    }
    
    public void setId(int id) {
        this.id = id;
    }
    
    public String getLogin() {
        return login;
    }
    
    public void setLogin(String login) {
        this.login = login;
    }
    
    public String getPassword() {
        return password;
    }
    
    public void setPassword() {
        this.password = password;
    }
    
    public boolean getActive() {
        return active;
    }
    
    public void setActive(boolean active) {
        this.active = active;
    }
    
    public String toString(){
        return "[id=" + id
               + ", login=" + login
               //+ ", haslo=" + password
               + ", aktywny=" + active
               + "]";
    }
}
