/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package pl.madamusinski.dao;

import java.util.List;
import org.hibernate.Query;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Repository;
import pl.madamusinski.model.Users;

/**
 *
 * @author maadamusinski
 */
@Repository
public class UsersDAOImpl implements UsersDAO{
      private static final Logger logger = LoggerFactory.getLogger(Users.class);
    
    private SessionFactory sessionFactory;
    
    public void setSessionFactory(SessionFactory sf) {
        this.sessionFactory = sf;
    }
    
    public SessionFactory getSessionFactory() {
        return this.sessionFactory;
    }
    
    public void addUser(Users u) {
        Session session = sessionFactory.getCurrentSession();
        session.persist(u);
        logger.info("User has been added succesfuly, User=" + u);
        System.out.println("User has been added succesfuly, User=" + u);
    }
    
    public void editUser(Users u) {
        Session session = sessionFactory.getCurrentSession();
        session.update(u);
        logger.info("User has been updated succesfuly, User=" + u);
        System.out.println("User has been updated succesfuly, User=" + u);
    }
    
    public void deleteUser(int id) {
        Session session = sessionFactory.getCurrentSession();
        Users u = (Users)session.load(Users.class, id);
        if(u != null) {
            
            session.delete(u);
            logger.info("Deleted succesfuly user with id="+ id);
            System.out.println("Deleted succesfuly user with id="+ id);
        } else {
            logger.info("Cannot delete user of given id=" + id +", because that user is null");
            System.out.println("Cannot delete user of given id=" + id +", because that user is null");
        }
    }
    
    public Users getUserById(int id) {
        Session session = sessionFactory.getCurrentSession();
        Users u = (Users)session.load(Users.class, id);
        logger.info("User has been retrieved succesfuly with id=" + id +", User=" + u);
        System.out.println("User has been retrieved succesfuly with id=" + id +", User=" + u);
        return u;
    }
    @Override
    @SuppressWarnings("unchecked")
    public List<Users> getAllUsers() {
        Session session = sessionFactory.getCurrentSession();
        Query sql = session.createQuery("From Users u");
        List<Users> usersList = sql.list();
        logger.info("List of users retrieved!");
        System.out.println("List of users retrieved!");
        return usersList;
    }
    @Override
    public List<Users> getAllUsersNew() {
        Session session = sessionFactory.getCurrentSession();
        Query sql = session.createQuery("select u.id, u.active FROM Users u");
        List<Users> usersList = sql.list();
        return usersList;
    }
}
