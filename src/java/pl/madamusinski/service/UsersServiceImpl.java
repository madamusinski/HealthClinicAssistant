/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package pl.madamusinski.service;

import java.util.List;
import javax.transaction.Transactional;
import org.springframework.stereotype.Service;
import pl.madamusinski.dao.UsersDAO;
import pl.madamusinski.dao.UsersDAOImpl;
import pl.madamusinski.model.Users;

/**
 *
 * @author Mateusz
 */
@Service
public class UsersServiceImpl implements UsersService{
    private UsersDAO usersDao;
    
    
    public void setUsersDAO(UsersDAO usersDao) {
        this.usersDao = usersDao;
    }
    
    public UsersDAO getUsersDAO() {
        return usersDao;
    }
    
    @Override
    @Transactional
    public void addUser(Users u) {
        this.usersDao.addUser(u);
    }
    
    @Override
    @Transactional
    public void editUser(Users u) {
        this.usersDao.editUser(u);
    }
    
    @Override
    @Transactional
    public void deleteUser(int id) {
        this.usersDao.deleteUser(id);
    }
    
    @Override
    @Transactional
    public Users getUserById(int id) {
        return this.usersDao.getUserById(id);
    }
    
    @Override
    @Transactional
    public List<Users> getAllUsers() {
        return this.usersDao.getAllUsers();
    }
    
    @Override
    @Transactional
    public List<Users> getAllUsersNew() {
        return this.usersDao.getAllUsersNew();
    }
}
