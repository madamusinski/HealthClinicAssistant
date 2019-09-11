/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package pl.madamusinski.model;

import com.fasterxml.jackson.annotation.JsonBackReference;
import java.io.Serializable;
import java.util.HashSet;
import java.util.List;
import java.util.Set;
import javax.persistence.CascadeType;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.JoinTable;
import javax.persistence.ManyToMany;
import javax.persistence.Table;
import javax.persistence.UniqueConstraint;

/**
 *
 * @author maadamusinski
 */
@Entity
@Table(name="role", schema="public")
public class Roles implements Serializable{
    @Id @Column(name="id")
    @GeneratedValue(strategy=GenerationType.IDENTITY)
    private int idr;
    @Column(name="role", nullable=false)
    private String role;
   /** @ManyToMany(mappedBy="roles",fetch=FetchType.LAZY)
    private Set<Users> users = new HashSet<>();
    
    public void setUsers(Set<Users> users) {
        this.users = users;
    }
    
    public Set<Users> getUsers() {
        return users;
    }*/
    
    @ManyToMany(cascade={CascadeType.MERGE},fetch = FetchType.EAGER)
    @JoinTable(name="users_role",
            joinColumns=@JoinColumn(name="id_role", referencedColumnName = "id"),
            inverseJoinColumns=@JoinColumn(name="id_users", referencedColumnName="id"),
            uniqueConstraints={@UniqueConstraint(columnNames={"id_users", "id_role"})})
    @JsonBackReference
    private List<Users> users;
    
    public List<Users> getUsers() {
        return users;
    }
    public void setUsers(List<Users> users) {
        this.users = users;
    }
    
      
    public Roles() {}
    
    public Roles(int idr, String role) {
        this.idr = idr;
        this.role = role;
    }

    public int getId() {
        return idr;
    }
    
    public void setId(int idr) {
        this.idr = idr;
    }
    
    public String getLogin() {
        return role;
    }
    
    public void setLogin(String role) {
        this.role = role;
    }
    
   
    public String toString(){
        return "[id=" + idr
               + ", role=" + role
               + "]";
    }
}
