/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package pl.madamusinski.model;

import java.io.Serializable;
import java.util.HashSet;
import java.util.Set;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.ManyToMany;
import javax.persistence.Table;

/**
 *
 * @author maadamusinski
 */
@Entity
@Table(name="role", schema="public")
public class Roles implements Serializable{
    @Id @Column(name="id")
    @GeneratedValue(strategy=GenerationType.IDENTITY)
    private int id;
    @Column(name="role", nullable=false)
    private String role;
    @ManyToMany(mappedBy="roles")
    private Set<Users> users = new HashSet<>();
      
    public Roles() {}
    
    public Roles(int id, String role) {
        this.id = id;
        this.role = role;
    }

    public int getId() {
        return id;
    }
    
    public void setId(int id) {
        this.id = id;
    }
    
    public String getLogin() {
        return role;
    }
    
    public void setLogin(String role) {
        this.role = role;
    }
    
   
    public String toString(){
        return "[id=" + id
               + ", role=" + role
               + "]";
    }
}
