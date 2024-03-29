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
import org.hibernate.transform.RootEntityResultTransformer;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Repository;
import pl.madamusinski.model.Users;
import pl.madamusinski.model.Wizyta;

/**
 *
 * @author Mateusz
 */
@Repository
public class WizytaDAOImpl implements WizytaDAO{
          private static final Logger logger = LoggerFactory.getLogger(Wizyta.class);
    
    private SessionFactory sessionFactory;
    
    public void setSessionFactory(SessionFactory sf) {
        this.sessionFactory = sf;
    }
    
    public SessionFactory getSessionFactory() {
        return this.sessionFactory;
    }
    
    @Override
    public List<Wizyta> getAllWizyta() {
        Session session = sessionFactory.getCurrentSession();
        Query sql = session.createQuery("select new Wizyta(w.id, w.dataWizyta, w.czasWizyta, w.pacjent) FROM Wizyta w ");
        //Query sql = session.createQuery("select w.id, w.dataWizyta, w.czasWizyta, w.pacjent FROM Wizyta w");
        //Query sql = session.createSQLQuery("select id, data_wizyta, czas_wizyta, pacjent from wizyta").addEntity(Wizyta.class);
        // where czas_wizyta > to_timestamp('13.09.2019', 'DD.MM.YYYY ') AND data_czas < to_timestamp('14.09.2019', 'DD.MM.YYYY')
        //Query sql = session.createSQLQuery("select id, data_czas, pacjent from wizyta").addEntity(Wizyta.class);
//sql.setResultTransformer(RootEntityResultTransformer.INSTANCE);
        List<Wizyta> listWizyta = sql.list();
        for(Wizyta w : listWizyta) {
            System.out.println(w.getDataWizyta() + ", " + w.getCzasWizyta());
        }
        logger.debug("Retrieving all wizyty");
        System.out.println("Retrieving all wizyty");
        return listWizyta;
    }
    
    @Override
    public void addWizyta(Wizyta w) {
        Session session = sessionFactory.getCurrentSession();
        session.save(w);
        logger.debug("Saving new wizyta=" + w);
        System.out.println("Saving new wizyta=" + w);
    }
}
