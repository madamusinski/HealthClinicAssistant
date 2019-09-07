/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package pl.madamusinski.dao;

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
        }
    }
}
