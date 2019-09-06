/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package pl.madamusinski.dao;

import java.util.List;
import pl.madamusinski.model.Users;

/**
 *
 * @author maadamusinski
 */
public interface UsersDAO {
    
    public void addUser(Users u);
    public void editUser(Users u);
    public void deleteUser(int id);
    public Users getUserById(int id);
    public List<Users> getAllUsers();
}