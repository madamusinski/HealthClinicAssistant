/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package pl.madamusinski.service;

import java.util.List;
import javax.transaction.Transactional;
import org.springframework.stereotype.Service;
import pl.madamusinski.dao.RolesDAO;
import pl.madamusinski.model.Roles;

/**
 *
 * @author maadamusinski
 */
@Service
public class RolesServiceImpl implements RolesService{
    private RolesDAO rolesDao;
    
    
    
    public RolesDAO getRolesDAO() {
        return rolesDao;
    }
    public void setRolesDAO(RolesDAO rolesDao) {
        this.rolesDao = rolesDao;
    }

    @Override
    @Transactional
    public void addRole(Roles r) {
        this.rolesDao.addRole(r);
    }

    @Override
    public void updateRole(Roles r) {
       this.rolesDao.updateRole(r);
    }

    @Override
    public void deleteRole(int id) {
        this.rolesDao.deleteRole(id);
    }

    @Override
    public Roles getRoleById(int id) {
        return this.rolesDao.getRoleById(id);
    }

    @Override
    public List<Roles> getAllRoles() {
        return this.rolesDao.getAllRoles();
    }
    
    
    
    
}
