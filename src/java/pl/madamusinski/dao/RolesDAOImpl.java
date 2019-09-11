/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package pl.madamusinski.dao;

import java.util.List;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Repository;
import pl.madamusinski.model.Roles;
import pl.madamusinski.model.Users;

/**
 *
 * @author maadamusinski
 */
@Repository
public class RolesDAOImpl implements RolesDAO{
    
    private static final Logger logger = LoggerFactory.getLogger(Users.class);
    
    private SessionFactory sessionFactory;
    
    public void setSessionFactory(SessionFactory sf) {
        this.sessionFactory = sf;
    }
    
    public SessionFactory getSessionFactory() {
        return this.sessionFactory;
    }
   
    
    @Override
    public void addRole(Roles r) {
        Session session = sessionFactory.getCurrentSession();
        session.persist(r);
        logger.info("Role has been added succesfuly, Role=" + r);
        System.out.println("Role has been added succesfuly, Role=" + r);
    }
    
    @Override
    public void updateRole(Roles r) {
        Session session = sessionFactory.getCurrentSession();
        session.update(r);
        logger.info("Role has been updated succesfuly, Role=" + r);
        System.out.println("Role has been updated succesfuly, Role=" + r);
    }
    
    @Override
    public void deleteRole(int id) {
        Session session = sessionFactory.getCurrentSession();
        Roles r = (Roles)session.load(Roles.class, id);
        if(r != null) {
            session.delete(r);
            logger.info("Deleted succesfuly role with id="+ id);
            System.out.println("Deleted succesfuly role with id="+ id);
        } else {
            logger.info("Cannot delete role of given id=" + id +", because that role is null");
            System.out.println("Cannot delete role of given id=" + id +", because that roleer is null");
        }
        logger.info("Role has been updated succesfuly, Role=" + r);
        System.out.println("Role has been updated succesfuly, Role=" + r);
    }
    
    @Override
    public Roles getRoleById(int id) {
        Session session = sessionFactory.getCurrentSession();
        Roles r = (Roles)session.load(Roles.class, id);
        logger.info("Role has been retrieved succesfuly with id=" + id +", Role=" + r);
        System.out.println("Role has been retrieved succesfuly with id=" + id +", Role=" + r);
        return r;
    }
    
    public List<Roles> getAllRoles() {
        Session session = sessionFactory.getCurrentSession();
        List<Roles> listRoles = (List<Roles>)session.createQuery("FROM role");
        logger.info("List of roles retrieved!");
        System.out.println("List of roles retrieved!");
        return listRoles;
    }

  
}
